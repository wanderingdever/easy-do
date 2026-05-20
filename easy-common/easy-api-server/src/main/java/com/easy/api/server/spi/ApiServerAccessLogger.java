package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerLogContext;

/**
 * 开放 API 访问日志扩展点。
 * <p>
 * 模块默认不记录日志。接入方需要写数据库、写文件、推送消息队列时，
 * 实现该接口并注册为 Spring Bean 即可。
 */
public interface ApiServerAccessLogger {

    /**
     * 请求校验通过且业务方法执行前触发。
     *
     * @param context 请求日志上下文
     */
    void onRequest(ApiServerLogContext context);

    /**
     * 业务方法正常返回后触发。
     *
     * @param context 请求日志上下文
     * @param result  原始业务返回值，尚未经过响应加密
     */
    void onSuccess(ApiServerLogContext context, Object result);

    /**
     * 业务方法或开放 API 处理链路抛出异常时触发。
     *
     * @param context 请求日志上下文
     * @param error   异常信息
     */
    void onError(ApiServerLogContext context, Throwable error);
}
