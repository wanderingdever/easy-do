package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;

import jakarta.servlet.http.HttpServletRequest;

/**
 * 开放 API 限流扩展点。
 * <p>
 * 默认实现是单机内存日限流。生产环境如需分布式限流，应由业务系统提供 Redis、数据库或网关版本实现。
 */
public interface ApiServerRateLimiter {

    /**
     * 校验当前请求是否超过授权 API 的调用限制。
     *
     * @param authInfo 当前 appId 授权信息
     * @param apiInfo  当前命中的 API 授权项
     * @param request  当前请求
     */
    void check(ApiServerAuthInfo authInfo, ApiServerApiInfo apiInfo, HttpServletRequest request);
}
