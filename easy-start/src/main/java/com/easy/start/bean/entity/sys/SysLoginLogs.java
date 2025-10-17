package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.auth.enums.LoginType;
import com.easy.core.base.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 * 系统访问记录
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_login_logs")
@Schema(name = "SysLoginLogs", description = "系统访问记录")
public class SysLoginLogs extends BaseEntity {

    /**
     * 用户ID
     */
    @TableField("user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * 用户账号
     */
    @TableField("username")
    @Schema(description = "用户账号")
    private String username;

    /**
     * 登录类型
     */
    @TableField("login_type")
    @Schema(description = "登录类型")
    private LoginType loginType;

    /**
     * 登录IP地址
     */
    @TableField("ip")
    @Schema(description = "登录IP地址")
    private String ip;

    /**
     * 登录地点
     */
    @TableField("ip_location")
    @Schema(description = "登录地点")
    private String ipLocation;

    /**
     * 浏览器类型
     */
    @TableField("browser")
    @Schema(description = "浏览器类型")
    private String browser;

    /**
     * 访问时间
     */
    @TableField("login_time")
    @Schema(description = "访问时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String loginTime;
}