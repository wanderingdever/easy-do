package com.easy.server.bean.dto.sys.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 公告新增/编辑入参
 *
 * @author Matt
 */
@Data
@Schema(description = "公告新增/编辑入参")
public class NoticeDTO {

    @Schema(description = "公告ID")
    private String id;

    @Schema(description = "标题", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "公告标题不能为空")
    private String title;

    @Schema(description = "内容", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "公告内容不能为空")
    private String content;

    @Schema(description = "类型")
    private String noticeType;

    @Schema(description = "状态：DRAFT/PUBLISHED/REVOKED")
    private String status;
}
