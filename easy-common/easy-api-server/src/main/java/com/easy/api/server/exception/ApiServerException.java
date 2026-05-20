package com.easy.api.server.exception;

import lombok.Getter;

/**
 * 开放 API 服务端异常。
 */
@Getter
public class ApiServerException extends RuntimeException {

    /**
     * 错误码。
     */
    private final ApiServerErrorCode code;

    /**
     * 使用错误码默认提示创建异常。
     */
    public ApiServerException(ApiServerErrorCode code) {
        super(code.getMessage());
        this.code = code;
    }

    /**
     * 使用自定义错误提示创建异常。
     */
    public ApiServerException(ApiServerErrorCode code, String message) {
        super(message);
        this.code = code;
    }

    /**
     * 使用自定义错误提示和原始异常创建异常。
     */
    public ApiServerException(ApiServerErrorCode code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

}
