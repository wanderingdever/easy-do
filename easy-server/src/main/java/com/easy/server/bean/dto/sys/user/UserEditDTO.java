package com.easy.server.bean.dto.sys.user;

import com.easy.core.enums.Sex;
import com.easy.server.enums.AccountClient;
import com.easy.server.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * 用户编辑-入参
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "用户编辑-入参")
public class UserEditDTO {

    @NotBlank(message = "数据主键不能为空")
    @Schema(description = "id")
    private String userId;

    @Schema(description = "机构ID", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "机构信息不能为空")
    private String orgId;

    @Schema(description = "所属客户端")
    @NotNull(message = "所属客户端不能为空")
    private AccountClient client;

    @Schema(description = "账号状态")
    @NotNull(message = "账号状态不能为空")
    private AccountStatus status;


    /* info */
    @Schema(description = "用户信息ID")
    private String userInfoId;

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