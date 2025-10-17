package com.easy.start.bean.dto.sys.user;


import com.easy.core.enums.Sex;
import com.easy.start.enums.AccountClient;
import com.easy.start.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "用户信息-入参")
public class UserDTO {

    @Schema(description = "机构ID", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "机构信息不能为空")
    private String orgId;

    @Schema(description = "用户名", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "用户名不能为空")
    private String username;

    @Schema(description = "所属客户端")
    @NotNull(message = "所属客户端不能为空")
    private AccountClient client;

    @Schema(description = "账号状态")
    @NotNull(message = "账号状态不能为空")
    private AccountStatus status;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "手机号")
    private String phone;


    /* info */
    @Schema(description = "昵称")
    private String nickname;

    @Schema(description = "性别")
    private Sex sex;

    @Schema(description = "头像")
    private String avatar;

    /* 其他 */
    @Schema(description = "角色")
    private List<String> roleList;
}