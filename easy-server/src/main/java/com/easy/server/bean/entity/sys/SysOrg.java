package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


/**
 * <p>
 * 机构基本信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_org")
@Schema(name = "SysOrg", description = "机构基本信息")
public class SysOrg extends BaseEntity {

    /**
     * 上级id
     */
    @TableField("parent_id")
    @Schema(description = "上级id")
    private String parentId;

    /**
     * 组织名称
     */
    @TableField("org_name")
    @Schema(description = "组织名称")
    private String orgName;

    /**
     * 组织简称
     */
    @Schema(description = "组织简称")
    @TableField("org_short_name")
    private String orgShortName;

    /**
     * 机构编码
     */
    @TableField("org_code")
    @Schema(description = "机构编码")
    private String orgCode;

    /**
     * 顺序
     */
    @TableField("org_sort")
    @Schema(description = "顺序")
    private Integer orgSort;

    /**
     * 组织状态
     */
    @TableField("org_status")
    @Schema(description = "组织状态")
    private String orgStatus;

    @TableField(exist = false)
    @Schema(description = "下级")
    private List<SysOrg> children;
}