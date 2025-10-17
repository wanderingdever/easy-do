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
 * 用户微信信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_user_wechat")
@Schema(name = "SysUserWechat", description = "用户微信信息")
public class SysUserWechat extends BaseEntity {

    /**
     * 用户ID
     */
    @TableField("user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * openid
     */
    @TableField("openid")
    @Schema(description = "openid")
    private String openid;

    /**
     * 微信唯一标识
     */
    @TableField("unioid")
    @Schema(description = "微信唯一标识")
    private String unioid;
}