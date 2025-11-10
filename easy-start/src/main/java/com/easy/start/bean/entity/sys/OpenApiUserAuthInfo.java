package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import com.easy.start.enums.ApiAuthStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * <p>
 * 用户api授权信息
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Getter
@Setter
@TableName("open_api_user_auth_info")
@Schema(description = "用户api授权信息")
public class OpenApiUserAuthInfo extends BaseEntity {

    @Schema(description = "用户ID")
    @TableField("user_id")
    private String userId;

    @Schema(description = "appid")
    @TableField("appid")
    private String appid;

    @Schema(description = "sm2公钥")
    @TableField("sm2_public_key")
    private String sm2PublicKey;

    @Schema(description = "sm2私钥")
    @TableField("sm2_private_key")
    private String sm2PrivateKey;

    @Schema(description = "aesKey")
    @TableField("aes_key")
    private String aesKey;

    @Schema(description = "aesIv")
    @TableField("aes_iv")
    private String aesIv;

    @Schema(description = "授权状态")
    @TableField("status")
    private ApiAuthStatus status;

    @Schema(description = "授权api列表")
    @TableField(exist = false)
    List<OpenApiList> openApiList;
}