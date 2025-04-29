package com.easy.start.service;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.dto.user.UserDTO;
import com.easy.start.bean.dto.user.UserEditDTO;
import com.easy.start.bean.entity.UserInfo;
import com.easy.start.dao.UserInfoMapper;
import org.springframework.stereotype.Service;

/**
 * </p>
 *
 * @author Matt
 */
@Service
public class UserInfoService extends ServiceImpl<UserInfoMapper, UserInfo> {

    public void add(UserDTO dto, String userId) {
        // 额外信息
        UserInfo userInfo = BeanUtil.copyProperties(dto, UserInfo.class);
        userInfo.setUserId(userId);
        save(userInfo);
    }

    public void update(UserEditDTO dto) {
        // 用户信息
        UserInfo userInfo = BeanUtil.copyProperties(dto, UserInfo.class);
        userInfo.setUserId(dto.getId());
        // 更新用户信息
        String userInfoId = this.baseMapper.getIdByUserId(dto.getId());
        userInfo.setId(userInfoId);
        this.baseMapper.updateById(userInfo);
    }

    public void del(String userId) {
        lambdaUpdate()
                .in(UserInfo::getUserId, userId)
                .set(UserInfo::getDel, true)
                .update();
    }
}