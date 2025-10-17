package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import com.easy.core.enums.Sex;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 用户基本信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_user_info")
@Schema(name = "SysUserInfo", description = "用户基本信息")
public class SysUserInfo extends BaseEntity {

    /**
     * 用户信息ID
     */
    @TableField("user_id")
    @Schema(description = "用户信息ID")
    private String userId;

    /**
     * 账号昵称
     */
    @TableField("nickname")
    @Schema(description = "账号昵称")
    private String nickname;

    /**
     * 头像
     */
    @TableField("avatar")
    @Schema(description = "头像")
    private String avatar;

    /**
     * 性别
     */
    @TableField("sex")
    @Schema(description = "性别")
    private Sex sex;
}