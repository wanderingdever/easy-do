package com.easy.api.server.config;

import com.easy.api.server.advice.ApiServerResponseBodyAdvice;
import com.easy.api.server.aspect.ApiServerAspect;
import com.easy.api.server.service.ApiServerCryptoService;
import com.easy.api.server.service.ApiServerRequestService;
import com.easy.api.server.spi.ApiServerAccessLogger;
import com.easy.api.server.spi.ApiServerAuthProvider;
import com.easy.api.server.spi.ApiServerRateLimiter;
import com.easy.api.server.support.***REMOVE_SECRET***;
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

@AutoConfiguration
@EnableConfigurationProperties(ApiServerProperties.class)
@ConditionalOnProperty(prefix = "easy.api.server", name = "enabled", havingValue = "true", matchIfMissing = true)
public class ApiServerAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean
    public ApiServerAuthProvider apiServerAuthProvider(ApiServerProperties properties) {
        return new YmlApiServerAuthProvider(properties);
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerAccessLogger apiServerAccessLogger() {
        return new NoopApiServerAccessLogger();
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerRateLimiter apiServerRateLimiter() {
        return new ***REMOVE_SECRET***();
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerCryptoService apiServerCryptoService() {
        return new ApiServerCryptoService();
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerRequestService apiServerRequestService(ApiServerProperties properties, ApiServerAuthProvider authProvider) {
        return new ApiServerRequestService(properties, authProvider);
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerAspect apiServerAspect(ApiServerProperties properties,
                                           ApiServerRequestService requestService,
                                           ApiServerCryptoService cryptoService,
                                           ApiServerRateLimiter rateLimiter,
                                           ApiServerAccessLogger accessLogger) {
        return new ApiServerAspect(properties, requestService, cryptoService, rateLimiter, accessLogger);
    }

    @Bean
    @ConditionalOnMissingBean
    public ApiServerResponseBodyAdvice apiServerResponseBodyAdvice(ApiServerCryptoService cryptoService) {
        return new ApiServerResponseBodyAdvice(cryptoService);
    }

    @Bean
    @ConditionalOnMissingBean(name = "***REMOVE_SECRET***")
    public FilterRegistrationBean<ApiServerJsonAcceptFilter> ***REMOVE_SECRET***(ApiServerProperties properties) {
        FilterRegistrationBean<ApiServerJsonAcceptFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new ApiServerJsonAcceptFilter(properties));
        registrationBean.setOrder(Ordered.HIGHEST_PRECEDENCE);
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }
}
