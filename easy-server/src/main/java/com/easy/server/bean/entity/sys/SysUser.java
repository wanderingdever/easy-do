package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import com.easy.server.enums.AccountClient;
import com.easy.server.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 账号信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_user")
@Schema(name = "SysUser", description = "账号信息")
public class SysUser extends BaseEntity {

    /**
     * 账号
     */
    @TableField("username")
    @Schema(description = "账号")
    private String username;

    /**
     * 密码
     */
    @TableField("password")
    @Schema(description = "密码")
    private String password;

    /**
     * 邮箱
     */
    @TableField("email")
    @Schema(description = "邮箱")
    private String email;

    /**
     * 手机号
     */
    @TableField("phone")
    @Schema(description = "手机号")
    private String phone;


    /**
     * 手机号前三位
     */
    @TableField("phone_prefix")
    @Schema(description = "手机号前三位")
    private String phonePrefix;

    /**
     * 手机号后四位
     */
    @TableField("phone_suffix")
    @Schema(description = "手机号后四位")
    private String phoneSuffix;

    /**
     * 所属客户端
     */
    @TableField("client")
    @Schema(description = "所属客户端")
    private AccountClient client;

    /**
     * 账号状态
     */
    @TableField("status")
    @Schema(description = "账号状态")
    private AccountStatus status;
}