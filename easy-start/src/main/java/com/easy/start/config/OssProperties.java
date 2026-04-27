package com.easy.start.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "aliyun.oss")
@Setter
@Getter
public class OssProperties {

    private String endpoint;
    private String region;
    private String bucketName;
    private String accessKeyId;
    private String accessKeySecret;
    private String publicDomain;
    private Boolean useCname = false;
}
