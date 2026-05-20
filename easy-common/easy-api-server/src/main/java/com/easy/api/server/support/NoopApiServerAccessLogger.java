package com.easy.api.server.support;

import com.easy.api.server.model.ApiServerLogContext;
import com.easy.api.server.spi.ApiServerAccessLogger;

/**
 * 默认空日志实现。
 * <p>
 * 保持模块默认不记录日志，避免强制业务系统引入日志表或日志存储。
 */
public class NoopApiServerAccessLogger implements ApiServerAccessLogger {

    @Override
    public void onRequest(ApiServerLogContext context) {
    }

    @Override
    public void onSuccess(ApiServerLogContext context, Object result) {
    }

    @Override
    public void onError(ApiServerLogContext context, Throwable error) {
    }
}
