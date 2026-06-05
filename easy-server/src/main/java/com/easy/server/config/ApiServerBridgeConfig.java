package com.easy.server.config;

import com.alibaba.fastjson2.JSON;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.model.ApiServerLogContext;
import com.easy.api.server.spi.ApiServerAccessLogger;
import com.easy.api.server.spi.ApiServerAuthProvider;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.bean.entity.sys.OpenApiList;
import com.easy.server.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.server.enums.ApiAuthStatus;
import com.easy.server.service.sys.OpenApiRequestLogsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * API 服务器桥接配置
 */
@Configuration
public class ApiServerBridgeConfig {

    /**
     * API 服务器认证提供器
     */
    @Bean
    public ApiServerAuthProvider easyServerApiServerAuthProvider() {
        return appId -> {
            OpenApiUserAuthInfo authInfo = RedisUtils.getCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + appId);
            if (authInfo == null) {
                return null;
            }
            ApiServerAuthInfo serverAuthInfo = new ApiServerAuthInfo();
            serverAuthInfo.setAppId(authInfo.getAppid());
            serverAuthInfo.setSm2PublicKey(authInfo.getSm2PublicKey());
            serverAuthInfo.setSm2PrivateKey(authInfo.getSm2PrivateKey());
            serverAuthInfo.setAesKey(authInfo.getAesKey());
            serverAuthInfo.setAesIv(authInfo.getAesIv());
            serverAuthInfo.setEnabled(authInfo.getStatus() == ApiAuthStatus.AUTHORIZED);
            if (authInfo.getOpenApiList() != null) {
                serverAuthInfo.setApis(authInfo.getOpenApiList().stream()
                        .map(this::toApiInfo)
                        .toList());
            }
            return serverAuthInfo;
        };
    }

    /**
     * API 服务器访问日志记录器
     */
    @Bean
    public ApiServerAccessLogger easyServerApiServerAccessLogger(OpenApiRequestLogsService requestLogsService) {
        return new ApiServerAccessLogger() {
            @Override
            public void onRequest(ApiServerLogContext context) {
                requestLogsService.insertLog(
                        context.getAppId(),
                        context.getRequestId(),
                        context.getApiPath(),
                        context.getRequestIp(),
                        JSON.toJSONString(context.getHeaderParam()),
                        JSON.toJSONString(context.getRequestParam()),
                        null
                );
            }

            @Override
            public void onSuccess(ApiServerLogContext context, Object result) {
                requestLogsService.updateByAppidAndRequestId(
                        context.getAppId(),
                        context.getRequestId(),
                        JSON.toJSONString(result),
                        null
                );
            }

            @Override
            public void onError(ApiServerLogContext context, Throwable error) {
                requestLogsService.updateByAppidAndRequestId(
                        context.getAppId(),
                        context.getRequestId(),
                        null,
                        error.getMessage()
                );
            }
        };
    }

    private ApiServerApiInfo toApiInfo(OpenApiList apiList) {
        boolean enabled = apiList.getEnable() == null || apiList.getEnable();
        int limitNum = apiList.getLimitNum() == null ? 0 : apiList.getLimitNum();
        return new ApiServerApiInfo(apiList.getApiName(), apiList.getApiUrl(), limitNum, enabled);
    }
}
