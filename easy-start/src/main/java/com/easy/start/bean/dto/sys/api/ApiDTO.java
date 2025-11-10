package com.easy.start.bean.dto.sys.api;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Schema(description = "API管理DTO")
@Data
public class ApiDTO extends ApiRequestParamDTO {

    @NotBlank(message = "用户不能为空")
    @Schema(description = "userId")
    private String userId;

    @NotBlank(message = "appid不能为空")
    @Schema(description = "appid")
    private String appid;

    @Schema(description = "接口ID集合")
    private List<String> apiIdList;
}