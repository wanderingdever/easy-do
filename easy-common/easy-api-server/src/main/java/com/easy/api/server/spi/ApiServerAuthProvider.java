package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerAuthInfo;

/**
 * 开放 API 授权信息提供器。
 * <p>
 * 默认实现从 yml 读取授权信息；业务系统如果要使用数据库、Redis 或其他存储，
 * 只需要注册一个同类型 Bean 即可替换默认实现。
 */
public interface ApiServerAuthProvider {

    /**
     * 根据 appId 获取授权信息。
     *
     * @param appId 调用方应用 ID
     * @return 授权信息；返回 null 表示 appId 不存在或不可用
     */
    ApiServerAuthInfo getAuthInfo(String appId);
}
