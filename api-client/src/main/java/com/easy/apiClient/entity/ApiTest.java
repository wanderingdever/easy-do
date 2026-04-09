package com.easy.apiClient.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@Schema(description = "API测试响应")
@Data
public class ApiTest {


    @NotBlank(message = "appid不能为空")
    @Schema(description = "appid")
    private String appid;

    @Schema(description = "接口ID集合")
    private List<String> apiIdList;
}