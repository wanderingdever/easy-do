package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 角色信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_role")
@Schema(name = "SysRole", description = "角色信息")
public class SysRole extends BaseEntity {

    /**
     * 角色名字
     */
    @TableField("role_name")
    @Schema(description = "角色名字")
    private String roleName;

    /**
     * 角色key
     */
    @TableField("role_key")
    @Schema(description = "角色key")
    private String roleKey;

    /**
     * 权限级别
     */
    @Schema(description = "权限级别")
    @TableField("authority_level")
    private String authorityLevel;

    /**
     * 显示顺序
     */
    @TableField("role_sort")
    @Schema(description = "显示顺序")
    private Integer roleSort;

    /**
     * 是否启用
     */
    @TableField("enable")
    @Schema(description = "是否启用")
    private Boolean enable;
}