package com.easy.start.service.sys;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.start.bean.dto.sys.notice.NoticeDTO;
import com.easy.start.bean.dto.sys.notice.NoticeSearchDTO;
import com.easy.start.bean.entity.sys.SysNotice;
import com.easy.start.bean.entity.sys.SysNoticeRead;
import com.easy.start.bean.vo.sys.notice.NoticeDetailVO;
import com.easy.start.bean.vo.sys.notice.NoticeVO;
import com.easy.start.dao.sys.SysNoticeMapper;
import com.easy.tool.lang.DateUtils;
import com.easy.tool.lang.StringUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 公告通知服务
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class SysNoticeService extends ServiceImpl<SysNoticeMapper, SysNotice> {

    private static final String STATUS_DRAFT = "DRAFT";
    private static final String STATUS_PUBLISHED = "PUBLISHED";
    private static final String STATUS_REVOKED = "REVOKED";
    private static final String READ_STATUS_READ = "READ";
    private static final String READ_STATUS_UNREAD = "UNREAD";
    private static final int DELETED_NO = 0;
    private static final int DELETED_YES = 1;

    private final SysNoticeReadService noticeReadService;

    public void addNotice(NoticeDTO dto) {
        SysNotice notice = BeanUtil.copyProperties(dto, SysNotice.class);
        notice.setSenderId(StpUtil.getLoginIdAsString());
        notice.setNoticeType(StringUtils.isBlank(dto.getNoticeType()) ? "ANNOUNCEMENT" : dto.getNoticeType());
        notice.setStatus(StringUtils.isBlank(dto.getStatus()) ? STATUS_DRAFT : dto.getStatus());
        save(notice);
    }

    public void updateNotice(NoticeDTO dto) {
        if (StringUtils.isBlank(dto.getId())) {
            throw new CustomizeException("公告ID不能为空");
        }
        SysNotice old = getById(dto.getId());
        if (old == null) {
            throw new CustomizeException("公告不存在");
        }
        old.setTitle(dto.getTitle());
        old.setContent(dto.getContent());
        old.setNoticeType(StringUtils.isBlank(dto.getNoticeType()) ? old.getNoticeType() : dto.getNoticeType());
        updateById(old);
    }

    public void publishNotice(String id) {
        SysNotice notice = getById(id);
        if (notice == null) {
            throw new CustomizeException("公告不存在");
        }
        notice.setStatus(STATUS_PUBLISHED);
        notice.setPublishTime(DateUtils.now());
        notice.setRevokeTime(null);
        updateById(notice);
    }

    public void revokeNotice(String id) {
        SysNotice notice = getById(id);
        if (notice == null) {
            throw new CustomizeException("公告不存在");
        }
        notice.setStatus(STATUS_REVOKED);
        notice.setRevokeTime(DateUtils.now());
        updateById(notice);
    }

    public void deleteNotice(String id) {
        removeById(id);
        noticeReadService.lambdaUpdate().eq(SysNoticeRead::getNoticeId, id).remove();
    }

    public Page<NoticeVO> pageNotice(NoticeSearchDTO dto) {
        Page<SysNotice> page = lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getTitle()), SysNotice::getTitle, dto.getTitle())
                .eq(StringUtils.isNotBlank(dto.getStatus()), SysNotice::getStatus, dto.getStatus())
                .eq(StringUtils.isNotBlank(dto.getNoticeType()), SysNotice::getNoticeType, dto.getNoticeType())
                .orderByDesc(SysNotice::getCreateTime)
                .page(PageUtils.getPage(dto));
        return PageUtils.getPage(page, notice -> BeanUtil.copyProperties(notice, NoticeVO.class));
    }

    public Page<NoticeVO> pageUserNotice(NoticeSearchDTO dto, String userId) {
        List<SysNoticeRead> userRecords = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getUserId, userId)
                .list();
        Set<String> deletedIds = userRecords.stream()
                .filter(item -> DELETED_YES == defaultDeleted(item))
                .map(SysNoticeRead::getNoticeId)
                .collect(Collectors.toSet());
        Set<String> readIds = userRecords.stream()
                .filter(item -> DELETED_YES != defaultDeleted(item))
                .map(SysNoticeRead::getNoticeId)
                .collect(Collectors.toSet());

        Page<SysNotice> page = lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getTitle()), SysNotice::getTitle, dto.getTitle())
                .eq(SysNotice::getStatus, STATUS_PUBLISHED)
                .eq(StringUtils.isNotBlank(dto.getNoticeType()), SysNotice::getNoticeType, dto.getNoticeType())
                .notIn(CollUtil.isNotEmpty(deletedIds), SysNotice::getId, deletedIds)
                .in(READ_STATUS_READ.equals(dto.getReadStatus()) && CollUtil.isNotEmpty(readIds), SysNotice::getId, readIds)
                .eq(READ_STATUS_READ.equals(dto.getReadStatus()) && CollUtil.isEmpty(readIds), SysNotice::getId, "-1")
                .notIn(READ_STATUS_UNREAD.equals(dto.getReadStatus()) && CollUtil.isNotEmpty(readIds), SysNotice::getId, readIds)
                .orderByDesc(SysNotice::getPublishTime)
                .orderByDesc(SysNotice::getCreateTime)
                .page(PageUtils.getPage(dto));

        List<String> noticeIds = page.getRecords().stream().map(SysNotice::getId).toList();
        Map<String, SysNoticeRead> readMap = noticeIds.isEmpty()
                ? Collections.emptyMap()
                : noticeReadService.lambdaQuery()
                  .eq(SysNoticeRead::getUserId, userId)
                  .in(SysNoticeRead::getNoticeId, noticeIds)
                  .list()
                  .stream()
                  .collect(Collectors.toMap(SysNoticeRead::getNoticeId, Function.identity(), (left, right) -> left));

        return PageUtils.getPage(page, notice -> {
            NoticeVO vo = BeanUtil.copyProperties(notice, NoticeVO.class);
            SysNoticeRead read = readMap.get(notice.getId());
            boolean isRead = read != null && DELETED_YES != defaultDeleted(read);
            vo.setIsRead(isRead ? 1 : 0);
            vo.setReadTime(isRead ? read.getReadTime() : null);
            return vo;
        });
    }

    public NoticeDetailVO detail(String id) {
        SysNotice notice = getById(id);
        if (notice == null) {
            throw new CustomizeException("公告不存在");
        }
        return BeanUtil.copyProperties(notice, NoticeDetailVO.class);
    }

    public List<NoticeVO> unreadNotices(String userId, int limit) {
        List<SysNoticeRead> userRecords = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getUserId, userId)
                .list();
        List<String> readIds = userRecords.stream()
                .filter(item -> DELETED_YES != defaultDeleted(item))
                .map(SysNoticeRead::getNoticeId)
                .toList();
        List<String> deletedIds = userRecords.stream()
                .filter(item -> DELETED_YES == defaultDeleted(item))
                .map(SysNoticeRead::getNoticeId)
                .toList();

        List<SysNotice> notices = lambdaQuery()
                .eq(SysNotice::getStatus, STATUS_PUBLISHED)
                .notIn(CollUtil.isNotEmpty(readIds), SysNotice::getId, readIds)
                .notIn(CollUtil.isNotEmpty(deletedIds), SysNotice::getId, deletedIds)
                .orderByDesc(SysNotice::getPublishTime)
                .last("limit " + limit)
                .list();

        return notices.stream().map(item -> BeanUtil.copyProperties(item, NoticeVO.class)).toList();
    }

    public int unreadNoticeCount(String userId) {
        List<String> publishedIds = lambdaQuery()
                .eq(SysNotice::getStatus, STATUS_PUBLISHED)
                .list()
                .stream()
                .map(SysNotice::getId)
                .toList();
        if (CollUtil.isEmpty(publishedIds)) {
            return 0;
        }
        long readCount = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getUserId, userId)
                .in(SysNoticeRead::getNoticeId, publishedIds)
                .ne(SysNoticeRead::getIsDeleted, DELETED_YES)
                .count();
        long deletedCount = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getUserId, userId)
                .in(SysNoticeRead::getNoticeId, publishedIds)
                .eq(SysNoticeRead::getIsDeleted, DELETED_YES)
                .count();
        return (int) (publishedIds.size() - readCount - deletedCount);
    }

    public void markRead(String noticeId, String userId) {
        SysNotice notice = getById(noticeId);
        if (notice == null || !STATUS_PUBLISHED.equals(notice.getStatus())) {
            throw new CustomizeException("公告不存在或不可阅读");
        }
        SysNoticeRead read = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getNoticeId, noticeId)
                .eq(SysNoticeRead::getUserId, userId)
                .one();
        if (read != null) {
            if (read.getReadTime() == null) {
                read.setReadTime(DateUtils.now());
                noticeReadService.updateById(read);
            }
            return;
        }
        SysNoticeRead saveData = new SysNoticeRead();
        saveData.setNoticeId(noticeId);
        saveData.setUserId(userId);
        saveData.setReadTime(DateUtils.now());
        saveData.setIsDeleted(DELETED_NO);
        noticeReadService.save(saveData);
    }

    public void batchRead(List<String> ids, String userId) {
        if (CollUtil.isEmpty(ids)) {
            return;
        }
        ids.forEach(id -> markRead(id, userId));
    }

    public void batchDeleteForUser(List<String> ids, String userId) {
        if (CollUtil.isEmpty(ids)) {
            return;
        }
        ids.forEach(id -> markDeleted(id, userId));
    }

    public void readAll(String userId) {
        listVisibleNoticeIds(userId).forEach(id -> markRead(id, userId));
    }

    public void deleteAllForUser(String userId) {
        listVisibleNoticeIds(userId).forEach(id -> markDeleted(id, userId));
    }

    private void markDeleted(String noticeId, String userId) {
        SysNotice notice = getById(noticeId);
        if (notice == null || !STATUS_PUBLISHED.equals(notice.getStatus())) {
            throw new CustomizeException("公告不存在或不可删除");
        }
        SysNoticeRead read = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getNoticeId, noticeId)
                .eq(SysNoticeRead::getUserId, userId)
                .one();
        if (read == null) {
            SysNoticeRead saveData = new SysNoticeRead();
            saveData.setNoticeId(noticeId);
            saveData.setUserId(userId);
            saveData.setReadTime(DateUtils.now());
            saveData.setIsDeleted(DELETED_YES);
            noticeReadService.save(saveData);
            return;
        }
        read.setIsDeleted(DELETED_YES);
        if (read.getReadTime() == null) {
            read.setReadTime(DateUtils.now());
        }
        noticeReadService.updateById(read);
    }

    private List<String> listVisibleNoticeIds(String userId) {
        List<String> deletedIds = noticeReadService.lambdaQuery()
                .eq(SysNoticeRead::getUserId, userId)
                .eq(SysNoticeRead::getIsDeleted, DELETED_YES)
                .list()
                .stream()
                .map(SysNoticeRead::getNoticeId)
                .toList();
        return lambdaQuery()
                .eq(SysNotice::getStatus, STATUS_PUBLISHED)
                .notIn(CollUtil.isNotEmpty(deletedIds), SysNotice::getId, deletedIds)
                .list()
                .stream()
                .map(SysNotice::getId)
                .toList();
    }

    private int defaultDeleted(SysNoticeRead read) {
        return read.getIsDeleted() == null ? DELETED_NO : read.getIsDeleted();
    }
}
