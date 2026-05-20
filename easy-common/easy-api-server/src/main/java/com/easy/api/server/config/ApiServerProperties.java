package com.easy.api.server.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

/**
 * 开放 API 服务端配置。
 * <p>
 * 默认支持通过 yml 配置 app 授权信息；如果业务系统需要从数据库、Redis 或远程配置中心读取授权信息，
 * 可以自行实现 {@code ApiServerAuthProvider} 覆盖默认 yml 实现。
 */
@Setter
@Getter
@ConfigurationProperties(prefix = "easy.api.server")
public class ApiServerProperties {

    /**
     * 是否启用开放 API 服务端能力。
     */
    private boolean enabled = true;

    /**
     * 存放公共签名参数的请求头名称。
     */
    private String signHeader = "signParam";

    /**
     * 请求时间戳允许的最大偏移窗口，默认 5 分钟。
     */
    private Duration timestampWindow = Duration.ofMinutes(5);

    /**
     * yml 模式下的授权信息配置。
     */
    private Auth auth = new Auth();

    /**
     * yml 授权配置根节点。
     */
    @Setter
    @Getter
    public static class Auth {

        /**
         * 已授权应用列表。
         */
        private List<App> apps = new ArrayList<>();

    }

    /**
     * 单个调用方应用的授权信息。
     */
    @Setter
    @Getter
    public static class App {

        /**
         * 调用方应用 ID。
         */
        private String appId;

        /**
         * SM2 公钥，用于配合私钥完成请求参数解密。
         */
        private String sm2PublicKey;

        /**
         * SM2 私钥，用于解密客户端提交的业务参数。
         */
        private String sm2PrivateKey;

        /**
         * AES 密钥，用于加密响应数据。
         */
        private String aesKey;

        /**
         * AES 偏移向量，用于加密响应数据。
         */
        private String aesIv;

        /**
         * 当前应用授权是否启用。
         */
        private boolean enabled = true;

        /**
         * 当前应用可调用的 API 列表。
         */
        private List<Api> apis = new ArrayList<>();

    }

    /**
     * 单个开放 API 授权项。
     */
    @Setter
    @Getter
    public static class Api {

        /**
         * API 名称，仅用于展示和日志辅助识别。
         */
        private String name;

        /**
         * API 请求路径，需与 {@code HttpServletRequest#getRequestURI()} 完全匹配。
         */
        private String path;

        /**
         * 每日调用次数限制，0 表示不限制。
         */
        private int limitNum;

        /**
         * 当前 API 授权项是否启用。
         */
        private boolean enabled = true;

    }
}
