package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 系统参数配置
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_config")
@Schema(name = "SysConfig", description = "系统参数配置")
public class SysConfig extends BaseEntity {

    /**
     * 参数名称
     */
    @TableField("config_name")
    @Schema(description = "参数名称")
    @NotBlank(message = "参数名称不能为空")
    private String configName;

    /**
     * 参数键名
     */
    @TableField("config_key")
    @Schema(description = "参数键名")
    @NotBlank(message = "参数键不能为空")
    private String configKey;

    /**
     * 参数键值
     */
    @TableField("config_value")
    @Schema(description = "参数键值")
    @NotBlank(message = "参数值不能为空")
    private String configValue;

    /**
     * 是否是系统内置
     */
    @TableField("is_system")
    @Schema(description = "是否是系统内置")
    @NotNull(message = "是否是系统内置不能为空")
    private Boolean isSystem;

    /**
     * 是否启用
     */
    @TableField("enable")
    @Schema(description = "是否启用")
    @NotNull(message = "是否启用不能为空")
    private Boolean enable;
}