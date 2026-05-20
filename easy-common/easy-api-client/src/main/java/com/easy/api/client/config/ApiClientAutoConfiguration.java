package com.easy.api.client.config;

import com.easy.api.client.service.ApiClientService;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

@AutoConfiguration
@EnableConfigurationProperties(ApiClientProperties.class)
public class ApiClientAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean
    public ApiClientService apiClientService(ApiClientProperties properties) {
        return new ApiClientService(properties);
    }
}