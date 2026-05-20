package com.easy.server.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 字典数据
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_dict_data")
@Schema(name = "SysDictData", description = "字典数据")
public class SysDictData extends BaseEntity {

    /**
     * 字典类型ID easy_dict_type=>id
     */
    @TableField("dict_type_id")
    @Schema(description = "字典类型ID easy_dict_type=>id")
    private String dictTypeId;

    /**
     * 字典标签
     */
    @TableField("dict_label")
    @Schema(description = "字典标签")
    private String dictLabel;

    /**
     * 字典键值
     */
    @TableField("dict_value")
    @Schema(description = "字典键值")
    private String dictValue;

    /**
     * 字典排序
     */
    @TableField("dict_sort")
    @Schema(description = "字典排序")
    private Integer dictSort;

    /**
     * 样式属性（其他样式扩展）
     */
    @TableField("css_class")
    @Schema(description = "样式属性（其他样式扩展）")
    private String cssClass;

    /**
     * 表格回显样式
     */
    @TableField("list_class")
    @Schema(description = "表格回显样式")
    private String listClass;

    /**
     * 是否启用
     */
    @TableField("enable")
    @Schema(description = "是否启用")
    private Boolean enable;
}