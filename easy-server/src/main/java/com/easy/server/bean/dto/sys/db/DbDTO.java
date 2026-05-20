package com.easy.server.bean.dto.sys.db;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 数据库连接配置DTO
 * </p>
 * 用于新增和更新数据库连接配置信息
 *
 * @author Matt
 */
@Data
@Schema(name = "DbDTO", description = "数据库连接配置DTO")
public class DbDTO {

    @Schema(description = "主键ID（新增时不传，更新时必传）")
    private String id;

    @Schema(description = "数据库连接配置ID", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库连接配置ID不能为空")
    private String secretKey;

    @Schema(description = "数据库类型", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库类型不能为空")
    private String dbType;

    @Schema(description = "数据库主机", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库主机不能为空")
    private String host;

    @Schema(description = "数据库端口", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "数据库端口不能为空")
    private Integer port;

    @Schema(description = "数据库名称", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库名称不能为空")
    private String databaseName;

    @Schema(description = "数据库用户名", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库用户名不能为空")
    private String username;

    @Schema(description = "数据库密码", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库密码不能为空")
    private String password;

    @Schema(description = "是否启用（1:启用 0:禁用）", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "启用状态不能为空")
    private Integer enabled;
}
