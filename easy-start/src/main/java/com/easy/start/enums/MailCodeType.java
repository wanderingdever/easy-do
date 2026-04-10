package com.easy.start.enums;

import com.easy.core.enums.EnumInterface;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 邮件验证码类型
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum MailCodeType implements EnumInterface<String> {

    BAND_EMAIL("BAND_EMAIL", "绑定邮箱", "mail_code:band_email:", "安全验证", false),
    CHANGE_PASSWORD("CHANGE_PASSWORD", "修改密码", "mail_code:change_password:", "安全验证", true),
    ;

    private final String code;

    private final String introduction;

    /**
     * 验证码缓存key
     */
    private final String redisKey;

    /**
     * 邮件主题
     */
    private final String subject;

    /**
     * 是否需要校验账号
     */
    private final Boolean verifyAccount;
}