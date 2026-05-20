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
 * 用户->机构关联
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_user_org")
@Schema(name = "SysUserOrg", description = "用户->机构关联")
public class SysUserOrg extends BaseEntity {

    /**
     * 用户id
     */
    @TableField("user_id")
    @Schema(description = "用户id")
    private String userId;

    /**
     * 机构id
     */
    @TableField("org_id")
    @Schema(description = "机构id")
    private String orgId;
}