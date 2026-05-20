package com.easy.api.server.support;

import com.easy.api.server.config.ApiServerProperties;
import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.spi.ApiServerAuthProvider;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 基于 yml 配置的默认授权信息提供器。
 */
public class YmlApiServerAuthProvider implements ApiServerAuthProvider {

    /**
     * appId 到授权信息的内存索引。
     */
    private final Map<String, ApiServerAuthInfo> authInfoMap;

    public YmlApiServerAuthProvider(ApiServerProperties properties) {
        this.authInfoMap = loadAuthInfo(properties);
    }

    @Override
    public ApiServerAuthInfo getAuthInfo(String appId) {
        return authInfoMap.get(appId);
    }

    /**
     * 将配置文件中的授权应用列表转换为运行期授权模型。
     */
    private Map<String, ApiServerAuthInfo> loadAuthInfo(ApiServerProperties properties) {
        Map<String, ApiServerAuthInfo> map = new HashMap<>();
        List<ApiServerProperties.App> apps = properties.getAuth().getApps();
        if (apps == null) {
            return map;
        }
        for (ApiServerProperties.App app : apps) {
            if (app.getAppId() == null || app.getAppId().isBlank()) {
                continue;
            }
            ApiServerAuthInfo authInfo = new ApiServerAuthInfo();
            authInfo.setAppId(app.getAppId());
            authInfo.setSm2PublicKey(app.getSm2PublicKey());
            authInfo.setSm2PrivateKey(app.getSm2PrivateKey());
            authInfo.setAesKey(app.getAesKey());
            authInfo.setAesIv(app.getAesIv());
            authInfo.setEnabled(app.isEnabled());
            authInfo.setApis(toApiInfo(app.getApis()));
            map.put(authInfo.getAppId(), authInfo);
        }
        return map;
    }

    /**
     * 将配置文件中的 API 授权项转换为运行期授权模型。
     */
    private List<ApiServerApiInfo> toApiInfo(List<ApiServerProperties.Api> apis) {
        if (apis == null) {
            return List.of();
        }
        return apis.stream()
                .map(api -> new ApiServerApiInfo(api.getName(), api.getPath(), api.getLimitNum(), api.isEnabled()))
                .toList();
    }
}
