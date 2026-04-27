package com.easy.start.config;


import com.aliyun.sdk.service.oss2.OSSClient;
import com.aliyun.sdk.service.oss2.credentials.StaticCredentialsProvider;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;

@Configuration
@EnableConfigurationProperties(OssProperties.class)
public class OssConfig {

    @Bean(destroyMethod = "close")
    public OSSClient ossClient(OssProperties properties) {
        return OSSClient.newBuilder()
                .endpoint(properties.getEndpoint())
                .region(properties.getRegion())
                .credentialsProvider(new StaticCredentialsProvider(
                        properties.getAccessKeyId(),
                        properties.getAccessKeySecret()
                ))
                .useCName(Boolean.TRUE.equals(properties.getUseCname()))
                .connectTimeout(Duration.ofSeconds(10))
                .readWriteTimeout(Duration.ofSeconds(60))
                .signatureVersion("v4")
                .build();
    }
}
