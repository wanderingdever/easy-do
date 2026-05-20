package com.easy.server.bean.dto.sys.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 用户密码信息
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "用户密码信息-入参")
public class UserPwdDTO {


    @Schema(description = "用户ID", requiredMode = Schema.RequiredMode.REQUIRED)
    private String userId;

    @Schema(description = "旧密码")
    @NotBlank(message = "旧密码不能为空")
    private String oldPwd;

    @Schema(description = "新密码")
    @NotBlank(message = "新密码不能为空")
    private String newPwd;

    @Schema(description = "确认密码")
    @NotBlank(message = "确认密码不能为空")
    private String confirmPwd;
}