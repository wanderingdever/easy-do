package com.easy.core.enums;

import cn.hutool.http.HttpStatus;
import com.easy.core.constant.HttpCodes;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum REnum implements EnumInterface<Integer> {

    /**
     * 响应码枚举
     */
    SUCCESS(HttpCodes.SUCCESS, "SUCCESS", "成功"),
    RUNTIME_EXCEPTION(HttpCodes.ERROR, "ERROR", "错误"),

    DUPLICATE_SUBMIT(HttpStatus.HTTP_TOO_MANY_REQUESTS, "Please do not resubmit", "请不要重新提交"),

    // 签名为空
    SIGN_NULL(HttpStatus.HTTP_BAD_REQUEST, "Sign is empty", "签名为空"),
    // 签名异常
    SIGN_ERROR(HttpStatus.HTTP_FORBIDDEN, "Sign error", "签名错误"),
    // 签名过期
    SIGN_EXPIRED(HttpStatus.HTTP_GONE, "Sign expired", "签名过期"),
    // 签名不合法
    SIGN_ILLEGAL(HttpStatus.HTTP_BAD_METHOD, "Sign is illegal", "签名不合法"),

    APPID_ERROR(HttpStatus.HTTP_UNAUTHORIZED, "Appid exception", "APPID异常"),

    // 超过限制请求次数
    REQUEST_LIMIT_ERROR(HttpStatus.HTTP_BAD_METHOD, "The request has been current limited", "接口已限流"),
    // 接口未授权
    API_NOT_AUTHORIZED(HttpStatus.HTTP_UNAUTHORIZED, "Api not authorized", "接口未授权"),
    ;

    private final Integer code;
    private final String introduction;
    private final String msg;
}