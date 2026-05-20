package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 角色->菜单权限关联表
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_role_menu")
@Schema(name = "SysRoleMenu", description = "角色->菜单权限关联")
public class SysRoleMenu extends BaseEntity {

    /**
     * 角色ID
     */
    @TableField("role_id")
    @Schema(description = "角色ID")
    private String roleId;

    /**
     * 菜单ID
     */
    @TableField("menu_id")
    @Schema(description = "菜单ID")
    private String menuId;
}