package com.easy.server.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.server.bean.dto.EmailDTO;
import com.easy.server.service.MailService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 邮件接口
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping(value = "/mail")
@Tag(name = "邮件接口")
@AllArgsConstructor
public class MailController {

    private final MailService mailService;

    /**
     * 注册邮件验证码
     * TODO 要授权+限流
     *
     * @param emailDTO 邮箱 {@link EmailDTO}
     */
    @SaIgnore
    @PostMapping("/code")
    @Operation(summary = "发送验证码", method = "post")
//    @RepeatSubmit(interval = 1000 * 60)
    public void sendMail(@Valid @RequestBody EmailDTO emailDTO) {
        mailService.sendEmailCode(emailDTO.getEmail(), emailDTO.getType());
    }


}