package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;


/**
 * <p>
 * 用户->角色关联
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_user_role")
@Schema(name = "SysUserRole", description = "用户->角色关联")
@AllArgsConstructor
@NoArgsConstructor
public class SysUserRole extends BaseEntity {

    /**
     * 用户ID
     */
    @TableField("user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * 角色ID
     */
    @TableField("role_id")
    @Schema(description = "角色ID")
    private String roleId;
}