package com.easy.client.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "easy.api.client")
public class ApiClientProperties {

    private String baseUrl;

    private String appid;

    private String privateKey;

    private String publicKey;

    private String aesKey;

    private String aesIv;

    private int connectTimeout = 30;

    private int readTimeout = 30;

    private int writeTimeout = 30;
}
