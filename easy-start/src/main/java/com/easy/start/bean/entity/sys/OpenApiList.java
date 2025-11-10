package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
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
@TableName("open_api_list")
@Schema(name = "OpenApiList", description = "")
public class OpenApiList extends BaseEntity {

    @Schema(description = "接口名称")
    @TableField("api_name")
    private String apiName;

    @Schema(description = "接口地址")
    @TableField("api_url")
    private String apiUrl;

    @Schema(description = "限制次数")
    @TableField("limit_num")
    private Integer limitNum;

    @Schema(description = "是否启用")
    @TableField("enable")
    private Boolean enable;
}