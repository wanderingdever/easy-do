package com.easy.start.bean.vo.sys.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 公告详情VO
 *
 * @author Matt
 */
@Data
@Schema(description = "公告详情VO")
public class NoticeDetailVO implements Serializable {

    @Schema(description = "主键ID")
    private String id;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "内容")
    private String content;

    @Schema(description = "类型")
    private String noticeType;

    @Schema(description = "状态")
    private String status;

    @Schema(description = "发送人ID")
    private String senderId;

    @Schema(description = "发布时间")
    private String publishTime;

    @Schema(description = "撤回时间")
    private String revokeTime;

    @Schema(description = "创建时间")
    private String createTime;
}
