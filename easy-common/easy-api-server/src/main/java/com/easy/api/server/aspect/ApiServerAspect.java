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

/**
 * 开放 API 服务端核心切面。
 * <p>
 * 负责串联签名校验、授权校验、限流、请求参数解密、业务方法调用和访问日志回调。
 */
@Aspect
public class ApiServerAspect {

    /**
     * 服务端配置。
     */
    private final ApiServerProperties properties;

    /**
     * 请求校验服务。
     */
    private final ApiServerRequestService requestService;

    /**
     * 请求解密服务。
     */
    private final ApiServerCryptoService cryptoService;

    /**
     * API 限流器。
     */
    private final ApiServerRateLimiter rateLimiter;

    /**
     * 访问日志扩展点。
     */
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

    /**
     * 处理开放 API 请求。
     * <p>
     * 该方法只处理 {@code @ApiServer} 标记的接口，且不绑定任何具体授权存储或日志存储。
     */
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

    /**
     * 如果第一个入参继承自 {@code ApiRequestParam}，则解密其中的 reqParam 并替换为真实业务对象。
     */
    private Object decryptFirstApiRequestParam(Method method, Object[] args, ApiServerAuthInfo authInfo) {
        if (args == null || args.length == 0 || !(args[0] instanceof ApiRequestParam apiRequestParam)) {
            return null;
        }
        Class<?>[] parameterTypes = method.getParameterTypes();
        Object decryptedParam = cryptoService.decryptRequest(apiRequestParam.getReqParam(), parameterTypes[0], authInfo);
        args[0] = decryptedParam;
        return decryptedParam;
    }

    /**
     * 构造日志上下文，交给接入方实现的 {@code ApiServerAccessLogger} 使用。
     */
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

    /**
     * 获取调用方 IP，优先识别代理转发头。
     */
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

    /**
     * 兼容方法注解和类注解两种 {@code @ApiServer} 使用方式。
     */
    private ApiServer getApiServerAnnotation(Method method, Class<?> targetClass) {
        ApiServer methodAnnotation = AnnotationUtils.findAnnotation(method, ApiServer.class);
        if (methodAnnotation != null) {
            return methodAnnotation;
        }
        return AnnotationUtils.findAnnotation(targetClass, ApiServer.class);
    }
}
