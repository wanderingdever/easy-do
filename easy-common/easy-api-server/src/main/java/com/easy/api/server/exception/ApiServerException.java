package com.easy.api.server.exception;

import lombok.Getter;

@Getter
public class ApiServerException extends RuntimeException {

    private final ApiServerErrorCode code;

    public ApiServerException(ApiServerErrorCode code) {
        super(code.getMessage());
        this.code = code;
    }

    public ApiServerException(ApiServerErrorCode code, String message) {
        super(message);
        this.code = code;
    }

    public ApiServerException(ApiServerErrorCode code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

}
