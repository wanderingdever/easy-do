package com.easy.server.bean.dto.sys.notice;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

/**
 * 公告批量操作 DTO
 */
@Data
public class NoticeBatchDTO {
    @NotEmpty(message = "公告ID列表不能为空")
    private List<String> ids;
}
