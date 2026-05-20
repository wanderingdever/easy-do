package com.easy.server.bean.vo.sys.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 公告列表VO
 *
 * @author Matt
 */
@Data
@Schema(description = "公告列表VO")
public class NoticeVO implements Serializable {

    @Schema(description = "主键ID")
    private String id;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "类型")
    private String noticeType;

    @Schema(description = "状态")
    private String status;

    @Schema(description = "发送人ID")
    private String senderId;

    @Schema(description = "发布时间")
    private String publishTime;

    @Schema(description = "创建时间")
    private String createTime;

    @Schema(description = "是否已读：0-未读，1-已读")
    private Integer isRead;

    @Schema(description = "阅读时间")
    private String readTime;
}
