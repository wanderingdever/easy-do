package com.easy.api.server.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
@ConfigurationProperties(prefix = "easy.api.server")
public class ApiServerProperties {

    private boolean enabled = true;

    private String signHeader = "signParam";

    private Duration timestampWindow = Duration.ofMinutes(5);

    private Auth auth = new Auth();

    @Setter
    @Getter
    public static class Auth {

        private List<App> apps = new ArrayList<>();

    }

    @Setter
    @Getter
    public static class App {

        private String appId;

        private String sm2PublicKey;

        private String sm2PrivateKey;

        private String aesKey;

        private String aesIv;

        private boolean enabled = true;

        private List<Api> apis = new ArrayList<>();

    }

    @Setter
    @Getter
    public static class Api {

        private String name;

        private String path;

        private int limitNum;

        private boolean enabled = true;

    }
}
