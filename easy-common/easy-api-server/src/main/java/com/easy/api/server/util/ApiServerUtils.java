package com.easy.api.server.util;

import com.alibaba.fastjson2.JSON;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.client.entity.ApiHeaderParam;
import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 开放 API 服务端工具类。
 */
public final class ApiServerUtils {

    private ApiServerUtils() {
    }

    /**
     * 使用默认签名请求头名称读取公共签名参数。
     *
     * @return 解析后的签名参数
     */
    public static ApiHeaderParam getApiHeaderParam() {
        return getApiHeaderParam(getRequest(), ApiConstants.SIGN_KEY);
    }

    /**
     * 从指定请求头读取并解析公共签名参数。
     *
     * @param request    当前请求
     * @param signHeader 签名请求头名称
     * @return 解析后的签名参数
     */
    public static ApiHeaderParam getApiHeaderParam(HttpServletRequest request, String signHeader) {
        String reqParams = request.getHeader(signHeader);
        if (reqParams == null || reqParams.isBlank()) {
            throw new ApiServerException(ApiServerErrorCode.SIGN_NULL);
        }
        try {
            return JSON.parseObject(reqParams, ApiHeaderParam.class);
        } catch (Exception e) {
            throw new ApiServerException(ApiServerErrorCode.SIGN_ERROR, ApiServerErrorCode.SIGN_ERROR.getMessage(), e);
        }
    }

    /**
     * 获取当前线程绑定的 Servlet 请求。
     *
     * @return 当前请求
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes == null) {
            throw new ApiServerException(ApiServerErrorCode.RUNTIME_EXCEPTION, "无法获取当前请求");
        }
        return attributes.getRequest();
    }
}
