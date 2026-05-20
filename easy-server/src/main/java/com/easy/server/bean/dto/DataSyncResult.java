package com.easy.server.bean.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Schema(description = "数据同步结果")
public class DataSyncResult {

    @Schema(description = "目标数据库类型", example = "MYSQL")
    private String dbType;

    @Schema(description = "目标数据库名称", example = "business_db")
    private String databaseName;

    @Schema(description = "目标表名", example = "orders")
    private String tableName;

    @Schema(description = "写入条数", example = "2")
    private Integer insertedCount;
}
