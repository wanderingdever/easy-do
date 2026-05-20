package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerAuthInfo;

public interface ApiServerAuthProvider {

    ApiServerAuthInfo getAuthInfo(String appId);
}
