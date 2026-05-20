package com.easy.server.bean.dto.sys.dict;

import com.easy.datasource.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 字典搜索参数
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "字典搜索参数")
public class DictSearchDTO extends PageDTO {

    @Schema(description = "字典类型ID")
    private String dictTypeId;

    @Schema(description = "字典名称")
    private String dictName;

    @Schema(description = "字典类型")
    private String dictType;

    @Schema(description = "字典标签")
    private String dictLabel;

    @Schema(description = "是否启用")
    private Boolean enable;

    @Schema(description = "是否系统内置")
    private Boolean isSystem;
}