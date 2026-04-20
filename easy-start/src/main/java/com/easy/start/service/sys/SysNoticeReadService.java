package com.easy.start.service.sys;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.entity.sys.SysNoticeRead;
import com.easy.start.dao.sys.SysNoticeReadMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 公告阅读记录服务
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class SysNoticeReadService extends ServiceImpl<SysNoticeReadMapper, SysNoticeRead> {

}
