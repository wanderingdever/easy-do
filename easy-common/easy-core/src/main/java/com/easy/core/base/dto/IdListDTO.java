package com.easy.core.base.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * ID请求参数ID请求参数
 * </p>
 *
 * @author Matt
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "ID请求参数")
public class IdListDTO {

    @NotNull(message = "id不能为空")
    @Schema(description = "id集合")
    private List<String> idList;
}