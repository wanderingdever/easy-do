package com.easy.start.service.sys;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.entity.sys.SysLoginLogs;
import com.easy.start.dao.sys.SysLoginLogsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 系统访问记录 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SysLoginLogsService extends ServiceImpl<SysLoginLogsMapper, SysLoginLogs> {

}