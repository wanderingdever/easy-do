package com.easy.server.service;

import com.easy.mail.MailManage;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.enums.MailCodeType;
import com.easy.tool.lang.IdUtils;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Locale;

/**
 * 邮件服务
 * </p>
 *
 * @author Matt
 */
@Service
@Slf4j
public class MailService {


    @Resource
    private MailManage mailManage;

    /**
     * 发送邮件验证码
     *
     * @param email 邮箱
     * @param type  邮件类型 {@link MailCodeType}
     */
    public void sendEmailCode(String email, MailCodeType type) {
        // 生成6位验证码
        String code = IdUtils.generateCode(6).toUpperCase(Locale.ROOT);
        // 缓存验证码5分钟
        RedisUtils.setCacheObject(type.getRedisKey() + email, code, Duration.ofMinutes(5));
        mailManage.sendTemplateMail(email, type.getSubject(), "mail/verification_code.html", code, "5");
    }
}