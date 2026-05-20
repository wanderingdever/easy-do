package com.easy.server.bean.dto.sys.db;

import com.easy.datasource.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统参数搜索
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(name = "DbSearchDTO", description = "数据库连接配置搜索")
public class DbSearchDTO extends PageDTO {

    @Schema(description = "id")
    private String id;

    @Schema(description = "数据库名称")
    private String dbName;

    @Schema(description = "数据库主机")
    private String host;

    @Schema(description = "数据库键名")
    private String dbKey;

    @Schema(description = "是否启用")
    private Boolean enable;

}