package com.easy.core.bean.base;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;

/**
 * </p>
 *
 * @author Matt
 */
@Data
@Tag(name = "搜索数据")
public class SearchDTO {

    @Schema(description = "搜索关键字")
    private String keyword;
}