package com.easy.redis.config;

import com.easy.redis.codec.FastJson2Codec;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.redisson.spring.starter.***REMOVE_SECRET***;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * redis配置
 *
 * @author matt
 */
@Slf4j
@Configuration
@EnableCaching
@EnableConfigurationProperties(RedissonProperties.class)
public class RedisConfig {

    @Resource
    @Qualifier("redissonProperties")
    private RedissonProperties redissonProperties;


    @Bean
    public ***REMOVE_SECRET*** redissonCustomizer() {
        return config -> {
            config.setThreads(redissonProperties.getThreads())
                    .setNettyThreads(redissonProperties.getNettyThreads())
                    .setCodec(new FastJson2Codec());
            RedissonProperties.SingleServerConfig singleServerConfig = redissonProperties.getSingleServerConfig();
            if (singleServerConfig != null) {
                // 使用单机模式
                config.useSingleServer()
                        .setTimeout(singleServerConfig.getTimeout())
                        .setClientName(singleServerConfig.getClientName())
                        .setIdleConnectionTimeout(singleServerConfig.getIdleConnectionTimeout())
                        .***REMOVE_SECRET***(singleServerConfig.***REMOVE_SECRET***())
                        .setConnectionMinimumIdleSize(singleServerConfig.getConnectionMinimumIdleSize())
                        .setConnectionPoolSize(singleServerConfig.getConnectionPoolSize());
            }
            log.error("init redisson config");
        };
    }
}