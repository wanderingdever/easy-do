package com.easy.start.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.entity.LoginLogs;
import com.easy.start.bean.vo.login.LoginLogsVO;
import com.easy.start.dao.LoginLogsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class LoginLogsService extends ServiceImpl<LoginLogsMapper, LoginLogs> {

    @Transactional(rollbackFor = Exception.class)
    public void saveLoginLogs(LoginLogsVO loginLogsVO) {
        LoginLogs loginLogs = BeanUtil.copyProperties(loginLogsVO, LoginLogs.class);
        loginLogs.setCreateBy(loginLogsVO.getUserId());
        save(loginLogs);
    }
}