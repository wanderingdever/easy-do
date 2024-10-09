package com.easy.start.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.entity.LoginLogs;
import com.easy.start.bean.vo.login.LoginLogsVO;
import com.easy.start.dao.LoginLogsMapper;
import org.dromara.hutool.core.bean.BeanUtil;
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
        LoginLogs loginLogs = new LoginLogs();
        BeanUtil.copyProperties(loginLogsVO, loginLogs);
        loginLogs.setCreateBy(loginLogsVO.getUserId());
        save(loginLogs);
    }
}