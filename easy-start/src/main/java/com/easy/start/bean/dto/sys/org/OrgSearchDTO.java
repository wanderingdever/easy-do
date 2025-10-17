package com.easy.start.bean.dto.sys.org;


import com.easy.datasource.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "组织分页-入参")
public class OrgSearchDTO extends PageDTO {

    @Schema(description = "组织id")
    private String orgId;

    @Schema(description = "上级id")
    private String orgParentId;

    @Schema(description = "组织名称")
    private String orgName;

    @Schema(description = "机构编码")
    private String orgCode;

    @Schema(description = "组织状态")
    private String orgStatus;
}