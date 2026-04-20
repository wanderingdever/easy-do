package com.easy.start.bean.dto.sys.notice;

import com.easy.datasource.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 公告查询入参
 *
 * @author Matt
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "公告查询入参")
public class NoticeSearchDTO extends PageDTO {

    @Schema(description = "标题")
    private String title;

    @Schema(description = "状态")
    private String status;

    @Schema(description = "类型")
    private String noticeType;

    @Schema(description = "阅读状态：READ-已读，UNREAD-未读")
    private String readStatus;
}
