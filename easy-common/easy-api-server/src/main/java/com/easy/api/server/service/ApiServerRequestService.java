package com.easy.api.server.service;

import com.easy.api.client.entity.ApiHeaderParam;
import com.easy.api.client.utils.ApiSignUtils;
import com.easy.api.server.config.ApiServerProperties;
import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;
import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.spi.ApiServerAuthProvider;
import jakarta.servlet.http.HttpServletRequest;

import java.time.Duration;
import java.util.List;

/**
 * 开放 API 请求校验服务。
 * <p>
 * 负责公共请求头校验、授权信息获取、签名验证和 API 权限匹配。
 */
public class ApiServerRequestService {

    private final ApiServerProperties properties;

    private final ApiServerAuthProvider authProvider;

    public ApiServerRequestService(ApiServerProperties properties, ApiServerAuthProvider authProvider) {
        this.properties = properties;
        this.authProvider = authProvider;
    }

    /**
     * 校验签名公共参数，并返回当前 appId 的授权信息。
     *
     * @param headerParam 解析后的签名请求头
     * @return 授权信息
     */
    public ApiServerAuthInfo verifyAndGetAuthInfo(ApiHeaderParam headerParam) {
        if (!verifyTimestamp(headerParam.getTimestamp(), properties.getTimestampWindow())) {
            throw new ApiServerException(ApiServerErrorCode.SIGN_EXPIRED);
        }
        ApiServerAuthInfo authInfo = authProvider.getAuthInfo(headerParam.getAppId());
        if (authInfo == null || !authInfo.isEnabled()) {
            throw new ApiServerException(ApiServerErrorCode.APPID_ERROR);
        }
        boolean valid = ApiSignUtils.verifyToken(
                headerParam.getAppId(),
                headerParam.getTimestamp(),
                headerParam.getRandomStr(),
                headerParam.getToken()
        );
        if (!valid) {
            throw new ApiServerException(ApiServerErrorCode.SIGN_ILLEGAL);
        }
        return authInfo;
    }

    /**
     * 校验当前 appId 是否有权访问本次请求路径。
     *
     * @param authInfo 当前 appId 授权信息
     * @param request  当前请求
     * @return 命中的 API 授权项
     */
    public ApiServerApiInfo verifyAndGetApiInfo(ApiServerAuthInfo authInfo, HttpServletRequest request) {
        String requestUri = request.getRequestURI();
        List<ApiServerApiInfo> apis = authInfo.getApis();
        if (apis == null || apis.isEmpty()) {
            throw new ApiServerException(ApiServerErrorCode.API_NOT_AUTHORIZED);
        }
        return apis.stream()
                .filter(api -> api.isEnabled() && requestUri.equals(api.getPath()))
                .findFirst()
                .orElseThrow(() -> new ApiServerException(ApiServerErrorCode.API_NOT_AUTHORIZED));
    }

    /**
     * 校验请求时间戳是否在允许窗口内。
     */
    private boolean verifyTimestamp(Long timestamp, Duration window) {
        long currentTimeMillis = System.currentTimeMillis();
        long windowMillis = window == null ? Duration.ofMinutes(5).toMillis() : window.toMillis();
        return timestamp != null
                && timestamp <= currentTimeMillis
                && currentTimeMillis - timestamp <= windowMillis;
    }
}
