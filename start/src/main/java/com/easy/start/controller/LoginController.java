package com.easy.start.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.user.UserDTO;
import com.easy.start.bean.vo.login.PwdLogin;
import com.easy.start.bean.vo.login.TokenInfo;
import com.easy.start.service.LoginService;
import com.easy.utils.lang.IdUtils;
import com.easy.web.annotation.Wrap;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.dromara.hutool.core.io.IoUtil;
import org.dromara.hutool.swing.captcha.CaptchaUtil;
import org.dromara.hutool.swing.captcha.CircleCaptcha;
import org.dromara.hutool.swing.img.ImgUtil;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.Duration;
import java.util.UUID;

import static org.dromara.hutool.swing.img.ImgUtil.castToBufferedImage;

/**
 * 登录
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping()
@Tag(name = "授权接口")
@AllArgsConstructor
public class LoginController {

    private final LoginService loginService;


    @GetMapping(value = "/code")
    @Operation(description = "验证码")
    @Wrap
    @SaIgnore
    public void verificationCode(HttpServletResponse response) {
        // 定义图形验证码的长、宽、验证码位数、干扰圈圈数量
        CircleCaptcha circleCaptcha = CaptchaUtil.ofCircleCaptcha(120, 40, 4, 30);
        // 设置背景颜色
        circleCaptcha.setBackground(new Color(249, 251, 220));
        // 生成四位验证码
        String code = IdUtils.generateCode(4);
        Image image = circleCaptcha.createImage(code);
        // 返回验证码信息
        responseCode(response, code, image);
    }

    @PostMapping("/check_user")
    @Operation(description = "检查用户")
    @SaIgnore
    public boolean checkUser(@RequestBody UserDTO dto) {
        return loginService.checkUser(dto);
    }

    @PostMapping("/pwd_login")
    @Operation(description = "密码登录")
    @SaIgnore
    public TokenInfo pwdLogin(@RequestBody @Valid PwdLogin login) {
        return loginService.pwdLogin(login);
    }

    @PostMapping("/code_login")
    @Operation(description = "验证码登录")
    @SaIgnore
    public TokenInfo codeLogin(@Valid PwdLogin login) {
        // TODO 密码登录
        return null;
    }

    @PostMapping("/logout")
    @Operation(description = "退出登录")
    public void logout() {
        StpUtil.logout(StpUtil.getLoginId());
    }


    private void responseCode(HttpServletResponse response, String code, Image image) {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        String uuidStr = UUID.randomUUID().toString().replace("-", "");
        response.setHeader("verify-code-uuid", uuidStr);
        try {
            BufferedImage bufferedImage = castToBufferedImage(image, ImgUtil.IMAGE_TYPE_JPEG);
            // 创建一个ByteArrayOutputStream，用于存储图片数据
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            // 写入图片数据到ByteArrayOutputStream
            ImageIO.write(bufferedImage, "jpeg", baos);
            // 将ByteArrayOutputStream转换为ByteArrayInputStream
            byte[] imageInBytes = baos.toByteArray();
            // 输出
            IoUtil.write(response.getOutputStream(), true, imageInBytes);
            RedisUtils.setCacheObject(RedisConstants.CAPTCHA_CODE + uuidStr, code, Duration.ofMinutes(1));
        } catch (IOException e) {
            throw new CustomizeException(e.getMessage());
        }
    }
}