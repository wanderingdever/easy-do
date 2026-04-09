package com.easy.client.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 *
 * </p>
 *
 * @author Matt
 * @since 2025-07-18
 */
@Getter
@Setter
@Schema(name = "OpenApiList", description = "")
public class OpenApiList {

    @Schema(description = "接口名称")
    private String apiName;

    @Schema(description = "接口地址")
    private String apiUrl;

    @Schema(description = "限制次数")
    private Integer limitNum;

    @Schema(description = "是否启用")
    private Boolean enable;
}