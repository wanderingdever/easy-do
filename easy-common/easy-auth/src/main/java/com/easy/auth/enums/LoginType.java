package com.easy.auth.enums;


import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum LoginType {

    /**
     * 账号客户端枚举
     */
    PWD("PWD", "账号密码登录"),
    CODE("CODE", "验证码登录"),
    ;
    @EnumValue
    private final String value;

    private final String desc;
}
