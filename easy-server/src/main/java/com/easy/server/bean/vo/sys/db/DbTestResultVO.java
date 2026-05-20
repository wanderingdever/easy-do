package com.easy.server.bean.vo.sys.db;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 数据库连接测试结果VO
 * </p>
 * 用于返回数据库连接测试的结果信息
 *
 * @author Matt
 */
@Data
@Schema(description = "数据库连接测试结果")
public class DbTestResultVO implements Serializable {

    /**
     * 连接是否成功
     */
    @Schema(description = "连接是否成功")
    private Boolean success;

    /**
     * 测试消息（成功或失败原因）
     */
    @Schema(description = "测试消息（成功或失败原因）")
    private String message;

    /**
     * 连接耗时（毫秒）
     */
    @Schema(description = "连接耗时（毫秒）")
    private Long connectionTime;

    /**
     * 数据库版本
     */
    @Schema(description = "数据库版本")
    private String databaseVersion;

    /**
     * 数据库产品名称
     */
    @Schema(description = "数据库产品名称")
    private String databaseProductName;

    /**
     * JDBC连接URL
     */
    @Schema(description = "JDBC连接URL")
    private String jdbcUrl;
}
