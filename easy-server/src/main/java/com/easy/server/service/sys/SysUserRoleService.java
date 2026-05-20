package com.easy.server.service.sys;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.server.bean.entity.sys.SysUserRole;
import com.easy.server.dao.sys.SysUserRoleMapper;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户->角色关联 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
public class SysUserRoleService extends ServiceImpl<SysUserRoleMapper, SysUserRole> {

    public List<SysUserRole> getList(String userId, List<String> roleList) {
        return roleList.stream().map(roleId -> new SysUserRole(userId, roleId)).collect(Collectors.toCollection(LinkedList::new));
    }
}