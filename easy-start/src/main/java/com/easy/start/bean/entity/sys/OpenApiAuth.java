package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 *
 * </p>
 *
 * @author Matt
 * @since 2025-07-18
 */
@Getter
@Setter
@TableName("open_api_auth")
@Schema(name = "OpenApiAuth", description = "")
public class OpenApiAuth extends BaseEntity {


    @Schema(description = "用户ID")
    @TableField("user_id")
    private String userId;

    @Schema(description = "appid")
    @TableField("appid")
    private String appid;

    @Schema(description = "api列表ID")
    @TableField("api_id")
    private String apiId;

    @Schema(description = "api接地访问地址")
    @TableField("api_url")
    private String apiUrl;
}