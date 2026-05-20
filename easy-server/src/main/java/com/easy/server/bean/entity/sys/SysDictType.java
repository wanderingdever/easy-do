package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;


/**
 * <p>
 * 字典类型
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_dict_type")
@Schema(name = "SysDictType", description = "字典类型")
public class SysDictType extends BaseEntity {

    /**
     * 字典名称
     */
    @TableField("dict_name")
    @Schema(description = "字典名称")
    private String dictName;

    /**
     * 字典类型
     */
    @TableField("dict_type")
    @Schema(description = "字典类型")
    private String dictType;

    /**
     * 字典描述
     */
    @TableField("description")
    @Schema(description = "字典描述")
    private String description;

    /**
     * 是否是系统内置
     */
    @TableField("is_system")
    @Schema(description = "是否是系统内置")
    private Boolean isSystem;

    /**
     * 是否启用
     */
    @TableField("enable")
    @Schema(description = "是否启用")
    private Boolean enable;

    @TableField(exist = false)
    @Schema(description = "字典数据")
    private List<SysDictData> dictDataList;
}