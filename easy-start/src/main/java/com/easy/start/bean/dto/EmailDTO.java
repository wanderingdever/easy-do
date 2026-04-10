package com.easy.start.bean.dto;

import com.easy.start.enums.MailCodeType;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 邮箱参数
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "邮箱参数")
public class EmailDTO {

    @Schema(description = "邮箱", requiredMode = Schema.RequiredMode.REQUIRED)
    @Email
    @NotBlank(message = "邮箱不能为空。")
    private String email;

    @Schema(description = "验证码类型", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "验证码类型不能为空。")
    private MailCodeType type;

    @Schema(description = "验证码")
    private String code;
}