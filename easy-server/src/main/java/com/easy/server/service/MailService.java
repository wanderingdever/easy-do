package com.easy.server.service;

import com.easy.core.exception.CustomizeException;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.enums.MailCodeType;
import com.easy.tool.lang.IdUtils;
import jakarta.annotation.Resource;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.time.Duration;
import java.util.List;
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

    @Value(value = "${spring.mail.username}")
    private String from;

    @Resource
    private JavaMailSender javaMailSender;

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
        sendTemplateMail(email, type.getSubject(), "mail/verification_code.html", code, "5");
    }

    /**
     * 发送简单邮件
     *
     * @param to      接收者
     * @param subject 主题
     * @param context 内容
     */
    public void sendSampleMail(String subject, List<String> context, List<String> to) {
        sendSampleMail(subject, String.join("\n", context), to.toArray(new String[0]));
    }

    public void sendSampleMail(String subject, String context, String... to) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(context);
            javaMailSender.send(message);
            log.info("发送简单邮件成功:\n收件人：{}\n标题：{}\n内容：{}", to, subject, context);
        } catch (Exception e) {
            log.error("发送简单邮件失败:", e);
            throw new CustomizeException("发送邮件失败");
        }

    }

    /**
     * 发送附件邮件
     *
     * @param to             接收者
     * @param subject        主题
     * @param context        内容
     * @param attachmentName 附件名
     * @param filePath       文件路径
     */
    public void sendAttachmentMail(String to, String subject, String context, String attachmentName, String filePath) {
        try {
            // 创建一个复杂的消息邮件
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(context);
            // 上传文件
            helper.addAttachment(attachmentName, new File(filePath));
            javaMailSender.send(mimeMessage);
        } catch (Exception e) {
            log.error("发送附件邮件失败:", e);
            throw new CustomizeException("发送邮件失败");
        }

    }

    /**
     * 发送模板邮件
     *
     * @param to           接收者
     * @param subject      主题
     * @param templatePath 模板路径
     * @param arguments    参数
     */
    public void sendTemplateMail(String to, String subject, String templatePath, String... arguments) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(this.buildTemplateContext(templatePath, arguments), true);
            javaMailSender.send(mimeMessage);
        } catch (Exception e) {
            log.error("发送模板邮件失败:", e);
            throw new CustomizeException("发送邮件失败");
        }

    }

    private String buildTemplateContext(String templatePath, String... arguments) {
        // 加载邮件html模板
        ClassPathResource resource = new ClassPathResource(templatePath);
        InputStream inputStream = null;
        BufferedReader fileReader = null;
        StringBuilder buffer = new StringBuilder();
        String line = "";
        try {
            inputStream = resource.getInputStream();
            fileReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
            while ((line = fileReader.readLine()) != null) {
                buffer.append(line);
            }
        } catch (Exception e) {
            log.error("读取模板失败:", e);
        } finally {
            if (fileReader != null) {
                try {
                    fileReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        // 替换html模板中的参数
        return MessageFormat.format(buffer.toString(), arguments);
    }
}