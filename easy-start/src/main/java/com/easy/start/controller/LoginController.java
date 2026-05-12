package com.easy.start.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import cn.hutool.core.img.ImgUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentParser;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.SystemConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.LoginDTO;
import com.easy.start.bean.vo.TokenInfo;
import com.easy.start.service.LoginService;
import com.easy.start.service.sys.SysUserService;
import com.easy.tool.http.IpLocation;
import com.easy.tool.http.IpUtils;
import com.easy.tool.lang.IdUtils;
import com.easy.web.annotation.ResultWrap;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.Duration;
import java.util.UUID;


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
    private final SysUserService userService;

    @GetMapping(value = "/code")
    @Operation(summary = "验证码")
    @ResultWrap
    @SaIgnore
    public void verificationCode(HttpServletResponse response) {
        // 定义图形验证码的长、宽、验证码位数、干扰圈圈数量
        CircleCaptcha circleCaptcha = CaptchaUtil.createCircleCaptcha(120, 40, 4, 0);
        // 设置背景颜色
        circleCaptcha.setBackground(new Color(249, 251, 220));
        // 生成四位验证码
        String code = IdUtils.generateCode(4);
        Image image = circleCaptcha.createImage(code);
        // 返回验证码信息
        responseCode(response, code, image);
    }

    @GetMapping("/check_user")
    @Operation(summary = "检查用户")
    @SaIgnore
    public boolean checkUser(@RequestParam("username") String username) {
        return userService.checkUser(username);
    }

    @PostMapping("/login")
    @Operation(summary = "登录")
    @SaIgnore
    public TokenInfo login(@RequestBody @Valid LoginDTO login, HttpServletRequest request) {
        String userAgentString = request.getHeader("User-Agent");
        UserAgent parse = UserAgentParser.parse(userAgentString);
        IpLocation location = IpUtils.getLocation(request);
        login.setIpInfo(location);
        login.setDevice(parse.getPlatform().getName());
        return switch (login.getLoginType()) {
            case PWD -> loginService.loginWithPassword(login);
            case CODE -> loginService.loginWithCode(login);
            default -> throw new CustomizeException("登录类型错误");
        };
    }

    @GetMapping("/logout")
    @Operation(summary = "退出登录")
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
            BufferedImage bufferedImage = ImgUtil.castToBufferedImage(image, ImgUtil.IMAGE_TYPE_JPEG);
            // 创建一个ByteArrayOutputStream，用于存储图片数据
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            // 写入图片数据到ByteArrayOutputStream
            ImageIO.write(bufferedImage, "jpeg", baos);
            // 将ByteArrayOutputStream转换为ByteArrayInputStream
            byte[] imageInBytes = baos.toByteArray();
            // 输出
            IoUtil.write(response.getOutputStream(), true, imageInBytes);
            RedisUtils.setCacheObject(SystemConstants.CAPTCHA_CODE + uuidStr, code, Duration.ofMinutes(1));
        } catch (IOException e) {
            throw new CustomizeException(e.getMessage());
        }
    }
}