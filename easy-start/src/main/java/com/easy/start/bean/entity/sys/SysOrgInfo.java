package com.easy.start.bean.entity.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * <p>
 * 机构详细信息
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Getter
@Setter
@ToString
@TableName("sys_org_info")
@Schema(name = "SysOrgInfo", description = "机构详细信息")
public class SysOrgInfo extends BaseEntity {

    /**
     * 机构ID
     */
    @TableField("org_id")
    @Schema(description = "机构ID")
    private String orgId;

    /**
     * 组织级别
     */
    @TableField("org_level")
    @Schema(description = "组织级别")
    private String orgLevel;

    /**
     * 组织类型
     */
    @TableField("org_type")
    @Schema(description = "组织类型")
    private String orgType;

    /**
     * 组织性质
     */
    @TableField("org_nature")
    @Schema(description = "组织性质")
    private String orgNature;

    /**
     * 组织标签
     */
    @TableField("org_tag")
    @Schema(description = "组织标签")
    private String orgTag;

    /**
     * 省
     */
    @Schema(description = "省")
    @TableField("org_province")
    private String orgProvince;
    /**
     * 省
     */
    @TableField("org_province_code")
    @Schema(description = "省")
    private String orgProvinceCode;

    /**
     * 市
     */
    @TableField("org_city")
    @Schema(description = "市")
    private String orgCity;
    /**
     * 市
     */
    @TableField("org_city_code")
    @Schema(description = "市")
    private String orgCityCode;

    /**
     * 区
     */
    @Schema(description = "区")
    @TableField("org_district")
    private String orgDistrict;
    /**
     * 区
     */
    @TableField("org_district_code")
    @Schema(description = "区")
    private String orgDistrictCode;

    /**
     * 区划代码集
     */
    @TableField("org_area_code")
    @Schema(description = "区划代码集")
    private String orgAreaCode;

    /**
     * 详细地址
     */
    @TableField("org_address")
    @Schema(description = "详细地址")
    private String orgAddress;

    /**
     * 机构简介
     */
    @TableField("org_desc")
    @Schema(description = "机构简介")
    private String orgDesc;

    /**
     * logo
     */
    @TableField("org_logo")
    @Schema(description = "logo")
    private String orgLogo;
}