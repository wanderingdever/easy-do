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
 * 公告阅读记录
 * </p>
 *
 * @author Matt
 * @since 2026-04-17
 */
@Getter
@Setter
@ToString
@TableName("sys_notice_read")
@Schema(name = "SysNoticeRead", description = "公告阅读记录")
public class SysNoticeRead extends BaseEntity {

    /**
     * 公告ID
     */
    @TableField("notice_id")
    @Schema(description = "公告ID")
    private String noticeId;

    /**
     * 用户ID
     */
    @TableField("user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * 阅读时间
     */
    @TableField("read_time")
    @Schema(description = "阅读时间")
    private String readTime;

    /**
     * 是否删除：0-否，1-是
     */
    @TableField("is_deleted")
    @Schema(description = "是否删除：0-否，1-是")
    private Integer isDeleted;
}
