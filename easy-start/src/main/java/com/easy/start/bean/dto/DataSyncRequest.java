package com.easy.start.bean.dto;

import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
@Schema(description = "数据同步请求")
public class DataSyncRequest {

    @NotBlank(message = "secretKey 不能为空")
    @Schema(description = "数据库密钥，用于匹配系统中保存的目标数据库连接信息", example = "demo-key-001")
    private String secretKey;

    @NotBlank(message = "tableName 不能为空")
    @Schema(description = "目标数据库中的表名", example = "orders")
    private String tableName;

    @NotEmpty(message = "records 不能为空")
    @ArraySchema(schema = @Schema(description = "待写入数据记录，每个元素为一行数据的键值对"))
    private List<Map<String, Object>> records;
}
