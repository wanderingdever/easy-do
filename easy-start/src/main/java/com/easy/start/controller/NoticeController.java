package com.easy.start.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.sys.notice.NoticeBatchDTO;
import com.easy.start.bean.dto.sys.notice.NoticeDTO;
import com.easy.start.bean.dto.sys.notice.NoticeReadDTO;
import com.easy.start.bean.dto.sys.notice.NoticeSearchDTO;
import com.easy.start.bean.vo.sys.notice.NoticeDetailVO;
import com.easy.start.bean.vo.sys.notice.NoticeVO;
import com.easy.start.service.sys.SysNoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 公告管理
 *
 * @author Matt
 */
@RestController
@RequestMapping("/notice")
@Tag(name = "公告管理")
@AllArgsConstructor
public class NoticeController {

    private final SysNoticeService noticeService;

    @PostMapping("/page")
    @Operation(summary = "分页查询公告")
    public Page<NoticeVO> page(@RequestBody NoticeSearchDTO dto) {
        return noticeService.pageNotice(dto);
    }

    @PostMapping("/user/page")
    @Operation(summary = "用户侧分页查询公告")
    public Page<NoticeVO> userPage(@RequestBody NoticeSearchDTO dto) {
        return noticeService.pageUserNotice(dto, StpUtil.getLoginIdAsString());
    }

    @PostMapping("/add")
    @Operation(summary = "新增公告")
    public String add(@Valid @RequestBody NoticeDTO dto) {
        noticeService.addNotice(dto);
        return "新增成功";
    }

    @PostMapping("/update")
    @Operation(summary = "编辑公告")
    public String update(@Valid @RequestBody NoticeDTO dto) {
        noticeService.updateNotice(dto);
        return "修改成功";
    }

    @PostMapping("/publish")
    @Operation(summary = "发布公告")
    public String publish(@RequestBody IdDTO dto) {
        noticeService.publishNotice(dto.getId());
        return "发布成功";
    }

    @PostMapping("/revoke")
    @Operation(summary = "撤回公告")
    public String revoke(@RequestBody IdDTO dto) {
        noticeService.revokeNotice(dto.getId());
        return "撤回成功";
    }

    @PostMapping("/delete")
    @Operation(summary = "删除公告")
    public String delete(@RequestBody IdDTO dto) {
        noticeService.deleteNotice(dto.getId());
        return "删除成功";
    }

    @GetMapping("/detail/{id}")
    @Operation(summary = "公告详情")
    public NoticeDetailVO detail(@PathVariable("id") String id) {
        return noticeService.detail(id);
    }

    @PostMapping("/read")
    @Operation(summary = "标记公告已读")
    public String read(@Valid @RequestBody NoticeReadDTO dto) {
        noticeService.markRead(dto.getNoticeId(), StpUtil.getLoginIdAsString());
        return "已读";
    }

    @GetMapping("/unread/count")
    @Operation(summary = "未读公告数量")
    public Object unreadCount() {
        int count = noticeService.unreadNoticeCount(StpUtil.getLoginIdAsString());
        return java.util.Map.of("unreadNoticeCount", count, "unreadCount", count);
    }

    @GetMapping("/unread/list")
    @Operation(summary = "未读公告列表")
    public Object unreadList(@RequestParam(value = "limit", required = false, defaultValue = "50") Integer limit) {
        return noticeService.unreadNotices(StpUtil.getLoginIdAsString(), limit);
    }

    @PostMapping("/read/batch")
    @Operation(summary = "批量标记已读")
    public String batchRead(@Valid @RequestBody NoticeBatchDTO dto) {
        noticeService.batchRead(dto.getIds(), StpUtil.getLoginIdAsString());
        return "批量已读成功";
    }

    @PostMapping("/read/all")
    @Operation(summary = "全部标记已读")
    public String readAll() {
        noticeService.readAll(StpUtil.getLoginIdAsString());
        return "全部已读成功";
    }

    @PostMapping("/delete/batch")
    @Operation(summary = "批量删除（用户维度）")
    public String batchDelete(@Valid @RequestBody NoticeBatchDTO dto) {
        noticeService.batchDeleteForUser(dto.getIds(), StpUtil.getLoginIdAsString());
        return "批量删除成功";
    }

    @PostMapping("/delete/all")
    @Operation(summary = "全部删除（用户维度）")
    public String deleteAll() {
        noticeService.deleteAllForUser(StpUtil.getLoginIdAsString());
        return "全部删除成功";
    }
}
