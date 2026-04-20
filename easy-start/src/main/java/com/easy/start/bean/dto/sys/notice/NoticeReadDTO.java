package com.easy.start.bean.dto.sys.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 公告阅读入参
 *
 * @author Matt
 */
@Data
@Schema(description = "公告阅读入参")
public class NoticeReadDTO {

    @NotBlank(message = "公告ID不能为空")
    @Schema(description = "公告ID")
    private String noticeId;
}
