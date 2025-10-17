package com.easy.start.bean.dto;

import com.easy.auth.enums.LoginType;
import com.easy.start.enums.AccountClient;
import com.easy.tool.http.IpLocation;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 登录参数
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "登录-入参")
public class LoginDTO {

    @Schema(title = "登录类型")
    @NotNull(message = "登录类型不能为空")
    private LoginType loginType;

    @Schema(title = "客户端")
    @NotNull(message = "客户端不能为空")
    private AccountClient client;

    @Schema(title = "用户名")
    @NotBlank(message = "用户名不能为空")
    private String username;

    @Schema(title = "设备类型")
    private String device;

    @Schema(title = "密码")
    private String password;

    @Schema(title = "登录验证码")
    private String code;

    @Schema(title = "图形校验码")
    private String validateCode;

    @Schema(title = "图形校验码随机数")
    private String verifyCodeUuid;

    @Schema(title = "登录IP信息")
    private IpLocation ipInfo;
}