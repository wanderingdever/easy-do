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
 * 公告通知
 * </p>
 *
 * @author Matt
 * @since 2026-04-17
 */
@Getter
@Setter
@ToString
@TableName("sys_notice")
@Schema(name = "SysNotice", description = "公告通知")
public class SysNotice extends BaseEntity {

    /**
     * 公告标题
     */
    @TableField("title")
    @Schema(description = "公告标题")
    private String title;

    /**
     * 公告内容
     */
    @TableField("content")
    @Schema(description = "公告内容")
    private String content;

    /**
     * 公告类型
     */
    @TableField("notice_type")
    @Schema(description = "公告类型")
    private String noticeType;

    /**
     * 状态：DRAFT-草稿，PUBLISHED-已发布，REVOKED-已撤回
     */
    @TableField("status")
    @Schema(description = "状态：DRAFT-草稿，PUBLISHED-已发布，REVOKED-已撤回")
    private String status;

    /**
     * 发送人ID
     */
    @TableField("sender_id")
    @Schema(description = "发送人ID")
    private String senderId;

    /**
     * 发布时间
     */
    @TableField("publish_time")
    @Schema(description = "发布时间")
    private String publishTime;

    /**
     * 撤回时间
     */
    @TableField("revoke_time")
    @Schema(description = "撤回时间")
    private String revokeTime;
}
