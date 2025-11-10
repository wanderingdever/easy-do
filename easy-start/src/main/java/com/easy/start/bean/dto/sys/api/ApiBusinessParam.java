package com.easy.start.bean.dto.sys.api;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 业务参数
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "业务参数")
public class ApiBusinessParam extends ApiRequestParamDTO {


    /**
     * 页码
     */
    @Schema(description = "页码", example = "1", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long pageNum;

    /**
     * 每页数量
     */
    @Schema(description = "每页数量", example = "10", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long pageSize;
}