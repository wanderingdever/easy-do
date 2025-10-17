package com.easy.start.bean.dto.sys.user;


import com.easy.datasource.dto.PageDTO;
import com.easy.start.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户查询
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户查询/分页入参")
public class UserSearchDTO extends PageDTO {

    @Schema(description = "机构ID ")
    private String orgId;

    @Schema(description = "账号")
    private String username;

    @Schema(description = "手机号")
    private String phone;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "账号状态")
    private AccountStatus status;
}