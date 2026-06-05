package com.easy.api.server.config;

import com.easy.api.server.advice.ApiServerResponseBodyAdvice;
import com.easy.api.server.aspect.ApiServerAspect;
import com.easy.api.server.service.ApiServerCryptoService;
import com.easy.api.server.service.ApiServerRequestService;
import com.easy.api.server.spi.ApiServerAccessLogger;
import com.easy.api.server.spi.ApiServerAuthProvider;
import com.easy.api.server.spi.ApiServerRateLimiter;
import com.easy.api.server.support.InMemoryDailyApiServerRateLimiter;
import com.easy.api.server.support.NoopApiServerAccessLogger;
import com.easy.api.server.support.YmlApiServerAuthProvider;
import com.easy.api.server.web.ApiServerJsonAcceptFilter;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;

/**
 * 开放 API 服务端自动装配。
 * <p>
 * 引入 easy-api-server 后会自动注册切面、响应加密、默认授权提供器、默认日志实现和默认限流器。
 * 业务系统可以通过声明同类型 Bean 覆盖默认实现。
 */
@AutoConfiguration
@EnableConfigurationProperties(ApiServerProperties.class)
@ConditionalOnProperty(prefix = "easy.api.server", name = "enabled", havingValue = "true", matchIfMissing = true)
public class ApiServerAutoConfiguration {

    /**
     * 默认 yml 授权提供器。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerAuthProvider apiServerAuthProvider(ApiServerProperties properties) {
        return new YmlApiServerAuthProvider(properties);
    }

    /**
     * 默认空日志实现，保证模块默认不强制写日志。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerAccessLogger apiServerAccessLogger() {
        return new NoopApiServerAccessLogger();
    }

    /**
     * 默认单机内存日限流实现。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerRateLimiter apiServerRateLimiter() {
        return new InMemoryDailyApiServerRateLimiter();
    }

    /**
     * 加解密服务。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerCryptoService apiServerCryptoService() {
        return new ApiServerCryptoService();
    }

    /**
     * 请求校验服务。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerRequestService apiServerRequestService(ApiServerProperties properties, ApiServerAuthProvider authProvider) {
        return new ApiServerRequestService(properties, authProvider);
    }

    /**
     * 处理 {@code @ApiServer} 的核心切面。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerAspect apiServerAspect(ApiServerProperties properties,
                                           ApiServerRequestService requestService,
                                           ApiServerCryptoService cryptoService,
                                           ApiServerRateLimiter rateLimiter,
                                           ApiServerAccessLogger accessLogger) {
        return new ApiServerAspect(properties, requestService, cryptoService, rateLimiter, accessLogger);
    }

    /**
     * 响应体加密处理器。
     */
    @Bean
    @ConditionalOnMissingBean
    public ApiServerResponseBodyAdvice apiServerResponseBodyAdvice(ApiServerCryptoService cryptoService) {
        return new ApiServerResponseBodyAdvice(cryptoService);
    }

    /**
     * 对开放 API 请求强制使用 JSON 响应，避免客户端 Accept 头触发 XML converter。
     */
    @Bean
    @ConditionalOnMissingBean(name = "apiServerJsonAcceptFilterRegistration")
    public FilterRegistrationBean<ApiServerJsonAcceptFilter> apiServerJsonAcceptFilterRegistration(ApiServerProperties properties) {
        FilterRegistrationBean<ApiServerJsonAcceptFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new ApiServerJsonAcceptFilter(properties));
        registrationBean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }
}
