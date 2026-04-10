package com.easy.start.aspect;

import cn.hutool.core.collection.ListUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.easy.client.constant.ApiConstants;
import com.easy.client.entity.ApiHeaderParam;
import com.easy.client.entity.ApiRequestParam;
import com.easy.client.utils.ApiSignUtils;
import com.easy.core.enums.REnum;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.entity.sys.OpenApiList;
import com.easy.start.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.start.service.sys.OpenApiRequestLogsService;
import com.easy.start.utils.ApiServerUtils;
import com.easy.tool.http.IpUtils;
import com.easy.tool.lang.DateUtils;
import com.easy.tool.lang.IdUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

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
    @Pointcut("@within(com.easy.client.annotation.ApiServer) || @annotation(com.easy.client.annotation.ApiServer)")
    public void preventDuplication() {
    }


    @Around("preventDuplication()")
    public Object around(ProceedingJoinPoint joinPoint) {
        // 获取方法签名
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        HttpServletRequest request = ApiServerUtils.getRequest();
        ApiHeaderParam apiHeaderParam = ApiServerUtils.getApiHeaderParam();
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
        if (appidApiList == null || appidApiList.isEmpty()) {
            throw new CustomizeException(REnum.API_NOT_AUTHORIZED);
        }
        // 取出对应的api授权信息
        OpenApiList openApi = appidApiList.stream().filter(api -> api.getApiUrl().equals(requestUrl)).findFirst().orElse(null);
        // 如果没有权限且请求地址不是 /api/test 则抛出异常
        if (openApi == null) {
            throw new CustomizeException(REnum.API_NOT_AUTHORIZED);
        }

        String ipAddress = IpUtils.getIpAddress(request);
        // 给每次请求设置请求id 随机uuid+时分秒毫秒
        String requestId = IdUtils.fastSimpleUUID() + DateUtils.timeNum();
        request.setAttribute(ApiConstants.REQUEST_ID, requestId);
        Object[] args = joinPoint.getArgs();
        ApiRequestParam arg;
        try {
            Object o = null;
            if (args != null && args.length > 0 && args[0] instanceof ApiRequestParam) {
                arg = (ApiRequestParam) args[0];
                // 获取方法参数类型数组
                Class<?>[] parameterTypes = method.getParameterTypes();

                // 序列化为接口对应的类
                o = ApiServerUtils.decryptRequest(request, arg.getReqParam(), parameterTypes[0]);
                args[0] = o;
            }
            // 校验请求次数限制
            String requestRedisKey = ApiConstants.REQUEST_URL_DAY_LIMIT + request.getRequestURI() + ":" + DateUtils.dateNum() + apiHeaderParam.getAppId();
            List<Object> cacheList = RedisUtils.getCacheList(requestRedisKey);
            int limit = openApi.getLimitNum();
            if (limit != 0 && cacheList.size() >= limit) {
                throw new CustomizeException(REnum.REQUEST_LIMIT_ERROR);
            }
            openApiRequestLogsService.insertLog(apiHeaderParam.getAppId(), requestId, requestUrl, ipAddress, JSON.toJSONString(apiHeaderParam), JSONObject.toJSONString(o), null);
            RedisUtils.setCacheListWithExpireTime(requestRedisKey, ListUtil.of(apiHeaderParam.getAppId()), DateUtils.endOfDay(new Date()).toLocalDateTime());
            return joinPoint.proceed(args);
        } catch (Throwable throwable) {
            // 确保方法执行异常实时释放限时标记(异常后置通知)
            openApiRequestLogsService.insertLog(apiHeaderParam.getAppId(), requestId, requestUrl, ipAddress, JSON.toJSONString(apiHeaderParam), JSONObject.toJSONString(args), throwable.getMessage());
            throw new CustomizeException(throwable.getMessage());
        }
    }

    @AfterReturning(pointcut = "preventDuplication()", returning = "result")
    public void afterReturning(Object result) {
        // 请求成功后的处理逻辑
        ApiHeaderParam apiHeaderParam = ApiServerUtils.getApiHeaderParam();
        HttpServletRequest request = ApiServerUtils.getRequest();
        String requestId = request.getAttribute(ApiConstants.REQUEST_ID).toString();
        openApiRequestLogsService.updateByAppidAndRequestId(apiHeaderParam.getAppId(), requestId, JSON.toJSONString(result), null);
    }

    @AfterThrowing(pointcut = "preventDuplication()", throwing = "ex")
    public void afterThrowing(Throwable ex) {
        // 请求异常后的处理逻辑
        // 可以在这里添加日志记录等操作
        log.error("请求异常后的处理逻辑：{}", ex.getMessage());
    }

}