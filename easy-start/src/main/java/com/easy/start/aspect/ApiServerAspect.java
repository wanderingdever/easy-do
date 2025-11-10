package com.easy.start.aspect;

import cn.hutool.core.collection.ListUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.easy.core.enums.REnum;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.sys.api.ApiHeaderParam;
import com.easy.start.bean.dto.sys.api.ApiRequestParamDTO;
import com.easy.start.bean.entity.sys.OpenApiList;
import com.easy.start.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.start.constant.ApiConstants;
import com.easy.start.service.sys.OpenApiRequestLogsService;
import com.easy.start.utils.ApiSignUtils;
import com.easy.tool.http.IpUtils;
import com.easy.tool.lang.DateUtils;
import com.easy.tool.lang.IdUtils;
import jakarta.servlet.http.HttpServletRequest;
import jodd.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;


/**
 * api接口服务处理
 * </p>
 *
 * @author Matt
 */
@Component
@Aspect
@Slf4j
public class ApiServerAspect {

    private final OpenApiRequestLogsService openApiRequestLogsService;

    public ApiServerAspect(OpenApiRequestLogsService openApiRequestLogsService) {
        this.openApiRequestLogsService = openApiRequestLogsService;
    }

    /**
     * 定义切点
     */
    @Pointcut("@within(com.easy.start.annotation.ApiServer) || @annotation(com.easy.start.annotation.ApiServer)")
    public void preventDuplication() {
    }


    @Around("preventDuplication()")
    public Object around(ProceedingJoinPoint joinPoint) {
        // 获取方法签名
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        HttpServletRequest request = getRequest();
        ApiHeaderParam apiHeaderParam = getApiHeaderParam();
        // 验证时间戳是否正确,时间戳要小于当前时间戳,且在五分钟之内
        if (!ApiSignUtils.verifyTimestamp(apiHeaderParam.getTimestamp())) {
            throw new CustomizeException(REnum.SIGN_EXPIRED);
        }
        // 验证appid是否正确
        OpenApiUserAuthInfo authInfo = RedisUtils.getCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + apiHeaderParam.getAppId());
        if (authInfo == null) {
            throw new CustomizeException(REnum.APPID_ERROR);
        }
        // 验证签名是否合法
        boolean valid = ApiSignUtils.verifyToken(apiHeaderParam.getAppId(), apiHeaderParam.getTimestamp(), apiHeaderParam.getRandomStr(), apiHeaderParam.getToken());
        if (!valid) {
            throw new CustomizeException(REnum.SIGN_ILLEGAL);
        }
        String requestUrl = request.getRequestURI();
        // 校验是否有调用权限
        List<OpenApiList> appidApiList = authInfo.getOpenApiList();
        if (appidApiList == null || appidApiList.stream().noneMatch(openApiList -> openApiList.getApiUrl().equals(requestUrl))) {
            throw new CustomizeException(REnum.API_NOT_AUTHORIZED);
        }

        String ipAddress = IpUtils.getIpAddress(request);
        // 给每次请求设置请求id 随机uuid+时分秒毫秒
        String requestId = IdUtils.fastSimpleUUID() + DateUtils.timeNum();
        request.setAttribute(ApiConstants.REQUEST_ID, requestId);
        Object[] args = joinPoint.getArgs();
        ApiRequestParamDTO arg;
        try {
            arg = (ApiRequestParamDTO) args[0];
            // 校验请求次数限制
            String requestRedisKey = ApiConstants.REQUEST_URL_DAY_LIMIT + request.getRequestURI() + ":" + DateUtils.dateNum() + apiHeaderParam.getAppId();
            List<Object> cacheList = RedisUtils.getCacheList(requestRedisKey);
            int limit = appidApiList.stream().filter(openApiList -> openApiList.getApiUrl().equals(requestUrl)).findFirst().get().getLimitNum();
            if (limit != 0 && cacheList.size() >= limit) {
                throw new CustomizeException(REnum.REQUEST_LIMIT_ERROR);
            }
            // 获取方法参数类型数组
            Class<?>[] parameterTypes = method.getParameterTypes();

            // 序列化为接口对应的类
            Object o = ApiSignUtils.decryptRequest(request, arg.getReqParam(), parameterTypes[0]);
            args[0] = o;

            openApiRequestLogsService.insertLog(apiHeaderParam.getAppId(), requestId, requestUrl, ipAddress, JSON.toJSONString(apiHeaderParam), JSONObject.toJSONString(o), null);
            RedisUtils.setCacheListWithExpireTime(requestRedisKey, ListUtil.of(apiHeaderParam.getAppId()), DateUtils.endOfDay(new Date()).toLocalDateTime());
            return joinPoint.proceed(args);
        } catch (Throwable throwable) {
            // 确保方法执行异常实时释放限时标记(异常后置通知)
            openApiRequestLogsService.insertLog(apiHeaderParam.getAppId(), requestId, requestUrl, ipAddress, JSON.toJSONString(apiHeaderParam), JSONObject.toJSONString(args[0]), throwable.getMessage());
            throw new CustomizeException(throwable.getMessage());
        }
    }

    @AfterReturning(pointcut = "preventDuplication()", returning = "result")
    public void afterReturning(Object result) {
        // 请求成功后的处理逻辑
        ApiHeaderParam apiHeaderParam = getApiHeaderParam();
        HttpServletRequest request = getRequest();
        String requestId = request.getAttribute(ApiConstants.REQUEST_ID).toString();
        openApiRequestLogsService.updateByAppidAndRequestId(apiHeaderParam.getAppId(), requestId, JSON.toJSONString(result), null);
    }

    @AfterThrowing(pointcut = "preventDuplication()", throwing = "ex")
    public void afterThrowing(Throwable ex) {
        // 请求异常后的处理逻辑
        // 可以在这里添加日志记录等操作
        log.error("请求异常后的处理逻辑：{}", ex.getMessage());
    }


    private ApiHeaderParam getApiHeaderParam() {
        HttpServletRequest request = getRequest();
        String reqParams = request.getHeader(ApiConstants.SIGN_KEY);
        if (StringUtil.isBlank(reqParams)) {
            throw new CustomizeException(REnum.SIGN_NULL);
        }
        ApiHeaderParam apiHeaderParam;
        try {
            apiHeaderParam = JSON.parseObject(reqParams, ApiHeaderParam.class);
            return apiHeaderParam;
        } catch (Exception e) {
            throw new CustomizeException(REnum.SIGN_ERROR);
        }
    }

    private HttpServletRequest getRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes == null) {
            throw new CustomizeException(REnum.RUNTIME_EXCEPTION);
        }
        return attributes.getRequest();
    }
}