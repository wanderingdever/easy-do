package com.easy.server.bean.dto.sys.config;

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
@Schema(name = "ConfigSearchDTO", description = "系统参数搜索")
public class ConfigSearchDTO extends PageDTO {

    @Schema(description = "id")
    private String id;

    @Schema(description = "参数名称")
    private String configName;

    @Schema(description = "参数键名")
    private String configKey;

    @Schema(description = "是否启用")
    private Boolean enable;

    @Schema(description = "是否系统内置")
    private Boolean isSystem;

}