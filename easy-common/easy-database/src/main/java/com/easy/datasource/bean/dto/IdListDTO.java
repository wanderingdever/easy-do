package com.easy.datasource.bean.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * id 集合请求参数
 * </p>
 *
 * @author Matt
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "id 集合请求参数")
public class IdListDTO {

    @Schema(description = "id集合")
    private List<String> idList;
}