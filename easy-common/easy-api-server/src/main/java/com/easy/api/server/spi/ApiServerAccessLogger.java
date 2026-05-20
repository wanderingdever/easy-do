package com.easy.api.server.spi;

import com.easy.api.server.model.ApiServerLogContext;

public interface ApiServerAccessLogger {

    void onRequest(ApiServerLogContext context);

    void onSuccess(ApiServerLogContext context, Object result);

    void onError(ApiServerLogContext context, Throwable error);
}
