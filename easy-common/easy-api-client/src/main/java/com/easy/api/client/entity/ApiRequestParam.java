package com.easy.api.client.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.io.Serializable;

/**
 * API公共请求参数
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "API公共请求参数")
public class ApiRequestParam implements Serializable {

    @Schema(description = "SM2加密参数")
    @NotBlank(message = "请求参数错误")
    private String reqParam;
}