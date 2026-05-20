package com.easy.api.client.entity;

import com.alibaba.fastjson2.annotation.JSONField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * api公共参数
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "api公共请求头参数")
public class ApiHeaderParam implements Serializable {

    @Schema(description = "appId")
    @JSONField(name = "APPID")
    private String appId;

    @Schema(description = "时间戳")
    @JSONField(name = "TIMESTAMP")
    private Long timestamp;

    @Schema(description = "随机数")
    @JSONField(name = "RANDOMSTR")
    private String randomStr;

    @Schema(description = "token")
    @JSONField(name = "TOKEN")
    private String token;
}