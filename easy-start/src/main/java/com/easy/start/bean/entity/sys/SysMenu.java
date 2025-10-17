package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import com.easy.start.enums.MenuType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


/**
 * <p>
 * 菜单权限信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_menu")
@Schema(name = "SysMenu", description = "菜单权限信息")
public class SysMenu extends BaseEntity {

    /**
     * 菜单名称
     */
    @TableField("menu_name")
    @Schema(description = "菜单名称")
    private String menuName;

    /**
     * 菜单类型
     */
    @TableField("menu_type")
    @Schema(description = "菜单类型")
    private MenuType menuType;

    /**
     * 父菜单ID
     */
    @TableField("parent_id")
    @Schema(description = "父菜单ID")
    private String parentId;

    /**
     * 显示顺序
     */
    @TableField("order_num")
    @Schema(description = "显示顺序")
    private Integer orderNum;

    /**
     * 路由地址
     */
    @TableField("path")
    @Schema(description = "路由地址")
    private String path;

    /**
     * 组件路径
     */
    @TableField("component")
    @Schema(description = "组件路径")
    private String component;

    /**
     * 重定向
     */
    @TableField("redirect")
    @Schema(description = "重定向")
    private String redirect;

    /**
     * 是否为外链
     */
    @TableField("is_iframe")
    @Schema(description = "是否为外链")
    private Boolean isIframe;

    /**
     * 是否为外链
     */
    @TableField("is_link")
    @Schema(description = "是否为外链")
    private Boolean isLink;

    /**
     * 是否固定
     */
    @TableField("is_affix")
    @Schema(description = "是否固定")
    private Boolean isAffix;

    /**
     * 是否缓存
     */
    @TableField("is_keep_alive")
    @Schema(description = "是否缓存")
    private Boolean isKeepAlive;

    /**
     * 菜单是否显示
     */
    @TableField("is_hide")
    @Schema(description = "菜单是否显示")
    private Boolean isHide;

    /**
     * 地址
     */
    @TableField("link")
    @Schema(description = "地址")
    private String link;

    /**
     * 权限标识
     */
    @TableField("perms")
    @Schema(description = "权限标识")
    private String perms;

    /**
     * 菜单图标
     */
    @TableField("icon")
    @Schema(description = "菜单图标")
    private String icon;

    /**
     * 是否启用
     */
    @TableField("enable")
    @Schema(description = "是否启用")
    private Boolean enable;

    /**
     * 子菜单
     */
    @TableField(exist = false)
    @Schema(description = "子菜单")
    private List<SysMenu> children;
}