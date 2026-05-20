package com.easy.api.server.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * 开放 API 调用方授权信息。
 * <p>
 * 这是服务端模块内部使用的通用授权模型，不绑定数据库表结构。
 */
@Setter
@Getter
public class ApiServerAuthInfo {

    /**
     * 调用方应用 ID。
     */
    private String appId;

    /**
     * SM2 公钥。
     */
    private String sm2PublicKey;

    /**
     * SM2 私钥。
     */
    private String sm2PrivateKey;

    /**
     * AES 响应加密密钥。
     */
    private String aesKey;

    /**
     * AES 响应加密偏移向量。
     */
    private String aesIv;

    /**
     * 授权是否启用。
     */
    private boolean enabled = true;

    /**
     * 当前 appId 可访问的 API 列表。
     */
    private List<ApiServerApiInfo> apis = new ArrayList<>();

}
