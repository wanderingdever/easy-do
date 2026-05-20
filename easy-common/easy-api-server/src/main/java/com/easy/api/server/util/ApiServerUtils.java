package com.easy.api.server.util;

import com.alibaba.fastjson2.JSON;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.client.entity.ApiHeaderParam;
import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public final class ApiServerUtils {

    private ApiServerUtils() {
    }

    public static ApiHeaderParam getApiHeaderParam() {
        return getApiHeaderParam(getRequest(), ApiConstants.SIGN_KEY);
    }

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

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes == null) {
            throw new ApiServerException(ApiServerErrorCode.RUNTIME_EXCEPTION, "无法获取当前请求");
        }
        return attributes.getRequest();
    }
}
