package com.easy.mail;

import com.easy.core.exception.CustomizeException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.List;

/**
 * 邮件发送管理器。
 * <p>
 * 由 easy-mail 自动配置创建，业务模块只需要注入使用即可。
 */
@Slf4j
public class MailManage {

    private final String from;
    private final JavaMailSender javaMailSender;

    public MailManage(JavaMailSender javaMailSender, String from) {
        this.javaMailSender = javaMailSender;
        this.from = from;
    }

    /**
     * 发送简单邮件
     *
     * @param to      接收者
     * @param subject 主题
     * @param context 内容
     */
    public void sendSampleMail(String subject, List<String> context, List<String> to) {
        if (to == null || to.isEmpty()) {
            return;
        }
        sendSimpleMail(subject, String.join("\n", context == null ? List.of() : context), to.toArray(new String[0]));
    }

    /**
     * 发送简单邮件。
     * <p>
     * 保留旧方法名，兼容已有调用。
     *
     * @param subject 主题
     * @param context 内容
     * @param to      收件人
     */
    public void sendSampleMail(String subject, String context, String... to) {
        sendSimpleMail(subject, context, to);
    }

    /**
     * 发送简单文本邮件。
     *
     * @param subject 主题
     * @param context 内容
     * @param to      收件人
     */
    public void sendSimpleMail(String subject, String context, String... to) {

        if (to == null || to.length == 0) {
            return;
        }
        try {
            checkFrom();
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(context == null ? "" : context);
            javaMailSender.send(message);
            log.info("发送邮件成功: 标题：{} 收件人：{}", subject, Arrays.toString(to));
            log.debug("发送邮件内容: 收件人：{} 标题：{} 内容：{}", Arrays.toString(to), subject, context);
        } catch (CustomizeException e) {
            throw e;
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
            checkFrom();
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(context == null ? "" : context);
            // 上传文件
            File attachment = new File(filePath);
            if (!attachment.exists() || !attachment.isFile()) {
                throw new CustomizeException("邮件附件不存在: " + filePath);
            }
            helper.addAttachment(attachmentName, attachment);
            javaMailSender.send(mimeMessage);
        } catch (CustomizeException e) {
            throw e;
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
        try {
            checkFrom();
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(this.buildTemplateContext(templatePath, arguments), true);
            javaMailSender.send(mimeMessage);
        } catch (CustomizeException e) {
            throw e;
        } catch (Exception e) {
            log.error("发送模板邮件失败:", e);
            throw new CustomizeException("发送邮件失败");
        }

    }

    private String buildTemplateContext(String templatePath, String... arguments) {
        ClassPathResource resource = new ClassPathResource(templatePath);
        if (!resource.exists()) {
            throw new CustomizeException("邮件模板不存在: " + templatePath);
        }
        StringBuilder buffer = new StringBuilder();
        try (InputStream inputStream = resource.getInputStream();
             BufferedReader fileReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = fileReader.readLine()) != null) {
                buffer.append(line);
            }
        } catch (Exception e) {
            log.error("读取模板失败:", e);
            throw new CustomizeException("读取邮件模板失败");
        }
        return MessageFormat.format(buffer.toString(), arguments);
    }

    private void checkFrom() {
        if (from == null || from.isBlank()) {
            throw new CustomizeException("邮件发送人未配置，请配置 spring.mail.username");
        }
    }

}
