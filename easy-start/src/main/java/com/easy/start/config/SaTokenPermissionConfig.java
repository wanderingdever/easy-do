package com.easy.start.config;


import cn.dev33.satoken.stp.StpInterface;
import com.easy.start.bean.entity.sys.SysRole;
import com.easy.start.bean.vo.sys.UserRoleAndPermissionVO;
import com.easy.start.service.sys.SysRoleService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * satoken权限认证的接口实现类
 * </p>
 *
 * @author Matt
 */
@Component
@Slf4j
public class SaTokenPermissionConfig implements StpInterface {

    @Resource
    private SysRoleService roleService;


    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        UserRoleAndPermissionVO userRoleAndPermission = roleService.getUserRoleKeyList((String) loginId);
        if (userRoleAndPermission == null) {
            log.error("获取用权限异常，无权限数据。用户ID：{}", loginId);
            return new ArrayList<>();
        }
        return userRoleAndPermission.getPermissions();
    }

    /**
     * 返回一个账号所拥有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        List<SysRole> userRoleList = roleService.getUserRoleList((String) loginId);
        if (userRoleList == null) {
            log.error("获取用户角色异常，无角色数据。用户ID：{}", loginId);
            return new ArrayList<>();
        }
        return userRoleList.stream().map(SysRole::getRoleKey).toList();
    }
}