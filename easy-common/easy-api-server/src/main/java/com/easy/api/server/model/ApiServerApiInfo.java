package com.easy.api.server.model;

import lombok.Getter;
import lombok.Setter;

/**
 * 单个开放 API 的授权描述。
 */
@Setter
@Getter
public class ApiServerApiInfo {

    /**
     * API 名称，仅用于展示和日志。
     */
    private String name;

    /**
     * API 请求路径。
     */
    private String path;

    /**
     * 每日调用次数限制，0 表示不限制。
     */
    private int limitNum;

    /**
     * API 是否启用。
     */
    private boolean enabled = true;

    /**
     * 默认构造方法，供配置绑定和序列化使用。
     */
    public ApiServerApiInfo() {
    }

    /**
     * 快速构造 API 授权项。
     */
    public ApiServerApiInfo(String name, String path, int limitNum, boolean enabled) {
        this.name = name;
        this.path = path;
        this.limitNum = limitNum;
        this.enabled = enabled;
    }

}
