package com.easy.api.server.aspect;

import com.easy.api.client.annotation.ApiServer;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.client.entity.ApiHeaderParam;
import com.easy.api.client.entity.ApiRequestParam;
import com.easy.api.server.config.ApiServerProperties;
import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.model.ApiServerLogContext;
import com.easy.api.server.service.ApiServerCryptoService;
import com.easy.api.server.service.ApiServerRequestService;
import com.easy.api.server.spi.ApiServerAccessLogger;
import com.easy.api.server.spi.ApiServerRateLimiter;
import com.easy.api.server.util.ApiServerUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.AnnotationUtils;

import java.lang.reflect.Method;
import java.util.UUID;

@Aspect
public class ApiServerAspect {

    private final ApiServerProperties properties;

    private final ApiServerRequestService requestService;

    private final ApiServerCryptoService cryptoService;

    private final ApiServerRateLimiter rateLimiter;

    private final ApiServerAccessLogger accessLogger;

    public ApiServerAspect(ApiServerProperties properties,
                           ApiServerRequestService requestService,
                           ApiServerCryptoService cryptoService,
                           ApiServerRateLimiter rateLimiter,
                           ApiServerAccessLogger accessLogger) {
        this.properties = properties;
        this.requestService = requestService;
        this.cryptoService = cryptoService;
        this.rateLimiter = rateLimiter;
        this.accessLogger = accessLogger;
    }

    @Pointcut("@within(com.easy.api.client.annotation.ApiServer) || @annotation(com.easy.api.client.annotation.ApiServer)")
    public void apiServerPointcut() {
    }

    @Around("apiServerPointcut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        ApiServer apiServer = getApiServerAnnotation(method, joinPoint.getTarget().getClass());
        if (!properties.isEnabled() || apiServer == null) {
            return joinPoint.proceed();
        }

        HttpServletRequest request = ApiServerUtils.getRequest();
        ApiHeaderParam headerParam = ApiServerUtils.getApiHeaderParam(request, properties.getSignHeader());
        ApiServerAuthInfo authInfo = requestService.verifyAndGetAuthInfo(headerParam);
        ApiServerApiInfo apiInfo = requestService.verifyAndGetApiInfo(authInfo, request);
        rateLimiter.check(authInfo, apiInfo, request);

        String requestId = UUID.randomUUID().toString().replace("-", "") + System.currentTimeMillis();
        request.setAttribute(ApiConstants.REQUEST_ID, requestId);
        request.setAttribute(ApiServerAuthInfo.class.getName(), authInfo);

        Object[] args = joinPoint.getArgs();
        Object requestParam = decryptFirstApiRequestParam(method, args, authInfo);
        ApiServerLogContext logContext = buildLogContext(request, headerParam, authInfo, apiInfo, requestId, requestParam);
        accessLogger.onRequest(logContext);

        try {
            Object result = joinPoint.proceed(args);
            accessLogger.onSuccess(logContext, result);
            return result;
        } catch (Throwable throwable) {
            accessLogger.onError(logContext, throwable);
            throw throwable;
        }
    }

    private Object decryptFirstApiRequestParam(Method method, Object[] args, ApiServerAuthInfo authInfo) {
        if (args == null || args.length == 0 || !(args[0] instanceof ApiRequestParam apiRequestParam)) {
            return null;
        }
        Class<?>[] parameterTypes = method.getParameterTypes();
        Object decryptedParam = cryptoService.decryptRequest(apiRequestParam.getReqParam(), parameterTypes[0], authInfo);
        args[0] = decryptedParam;
        return decryptedParam;
    }

    private ApiServerLogContext buildLogContext(HttpServletRequest request,
                                                ApiHeaderParam headerParam,
                                                ApiServerAuthInfo authInfo,
                                                ApiServerApiInfo apiInfo,
                                                String requestId,
                                                Object requestParam) {
        ApiServerLogContext context = new ApiServerLogContext();
        context.setAppId(headerParam.getAppId());
        context.setRequestId(requestId);
        context.setApiPath(request.getRequestURI());
        context.setRequestIp(resolveIpAddress(request));
        context.setHeaderParam(headerParam);
        context.setRequestParam(requestParam);
        context.setRequest(request);
        context.setAuthInfo(authInfo);
        context.setApiInfo(apiInfo);
        return context;
    }

    private String resolveIpAddress(HttpServletRequest request) {
        String forwardedFor = request.getHeader("X-Forwarded-For");
        if (forwardedFor != null && !forwardedFor.isBlank()) {
            return forwardedFor.split(",")[0].trim();
        }
        String realIp = request.getHeader("X-Real-IP");
        if (realIp != null && !realIp.isBlank()) {
            return realIp;
        }
        return request.getRemoteAddr();
    }

    private ApiServer getApiServerAnnotation(Method method, Class<?> targetClass) {
        ApiServer methodAnnotation = AnnotationUtils.findAnnotation(method, ApiServer.class);
        if (methodAnnotation != null) {
            return methodAnnotation;
        }
        return AnnotationUtils.findAnnotation(targetClass, ApiServer.class);
    }
}
