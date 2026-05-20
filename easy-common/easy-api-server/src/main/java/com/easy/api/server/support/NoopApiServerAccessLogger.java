package com.easy.api.server.support;

import com.easy.api.server.model.ApiServerLogContext;
import com.easy.api.server.spi.ApiServerAccessLogger;

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
