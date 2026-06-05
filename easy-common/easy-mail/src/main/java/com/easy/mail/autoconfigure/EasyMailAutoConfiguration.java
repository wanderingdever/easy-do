package com.easy.mail.autoconfigure;

import com.easy.mail.MailManage;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;

/**
 * easy-mail Spring Boot 3 自动配置。
 * <p>
 * 当业务模块配置 spring.mail 并存在 JavaMailSender 时，自动创建 MailManage。
 */
@AutoConfiguration(after = MailSenderAutoConfiguration.class)
@ConditionalOnClass({JavaMailSender.class, MailManage.class})
@ConditionalOnProperty(prefix = "spring.mail", name = "host")
public class EasyMailAutoConfiguration {

    /**
     * 创建邮件发送管理器。
     */
    @Bean
    @ConditionalOnMissingBean(MailManage.class)
    public MailManage mailManage(JavaMailSender javaMailSender,
                                 @Value("${spring.mail.username:}") String username) {
        return new MailManage(javaMailSender, username);
    }
}
