package com.easy.api.server.exception;

import lombok.Getter;

@Getter
public enum ApiServerErrorCode {

    SIGN_NULL("签名为空"),
    SIGN_ERROR("签名错误"),
    SIGN_EXPIRED("签名过期"),
    SIGN_ILLEGAL("签名不合法"),
    APPID_ERROR("APPID异常"),
    API_NOT_AUTHORIZED("接口未授权"),
    REQUEST_LIMIT_ERROR("接口已限流"),
    REQUEST_DECRYPT_ERROR("业务参数加密验证失败"),
    RESPONSE_ENCRYPT_ERROR("响应参数加密失败"),
    RUNTIME_EXCEPTION("开放 API 服务异常");

    private final String message;

    ApiServerErrorCode(String message) {
        this.message = message;
    }

}
