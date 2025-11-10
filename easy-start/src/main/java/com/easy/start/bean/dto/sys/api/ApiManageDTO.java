package com.easy.start.bean.dto.sys.api;

import com.easy.datasource.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Schema(description = "API管理DTO")
@Data
public class ApiManageDTO extends PageDTO {

    @Schema(description = "API名称")
    private String apiName;
    @Schema(description = "API地址")
    private String apiUrl;
    @Schema(description = "是否启用")
    private Boolean enable;
}