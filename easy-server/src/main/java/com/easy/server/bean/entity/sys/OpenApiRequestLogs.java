package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 开放api请求日志
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Getter
@Setter
@TableName("open_api_request_logs")
@Schema(name = "OpenApiRequestLogs", description = "开放api请求日志")
public class OpenApiRequestLogs extends BaseEntity {

    @Schema(description = "appid")
    @TableField("appid")
    private String appid;

    @Schema(description = "请求ID")
    @TableField("request_id")
    private String requestId;

    @Schema(description = "api地址")
    @TableField("api_url")
    private String apiUrl;

    @Schema(description = "请求头参数")
    @TableField("header_param")
    private String headerParam;

    @Schema(description = "请求时间")
    @TableField("request_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    private String requestTime;

    @Schema(description = "请求ip")
    @TableField("request_ip")
    private String requestIp;

    @Schema(description = "请求参数")
    @TableField("request_param")
    private String requestParam;

    @Schema(description = "响应时间")
    @TableField("response_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    private String responseTime;

    @Schema(description = "响应数据")
    @TableField("response_data")
    private String responseData;

    @Schema(description = "异常")
    @TableField("error_msg")
    private String errorMsg;
}