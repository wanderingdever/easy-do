package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;

import jakarta.servlet.http.HttpServletRequest;

public interface ApiServerRateLimiter {

    void check(ApiServerAuthInfo authInfo, ApiServerApiInfo apiInfo, HttpServletRequest request);
}
