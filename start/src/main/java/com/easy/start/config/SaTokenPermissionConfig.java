package com.easy.start.config;

import cn.dev33.satoken.stp.StpInterface;
import com.easy.core.exception.CustomizeException;
import com.easy.start.bean.vo.login.UserRoleAndPermissionVO;
import com.easy.start.bean.vo.role.RoleVO;
import com.easy.start.service.RoleService;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * satoken权限认证的接口实现类
 * </p>
 *
 * @author Matt
 */
@Component
public class SaTokenPermissionConfig implements StpInterface {


    private final RoleService roleService;

    public SaTokenPermissionConfig(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        UserRoleAndPermissionVO userRoleAndPermission = roleService.getUserRoleKeyList((String) loginId);
        if (userRoleAndPermission == null) {
            throw new CustomizeException("用户权限异常");
        }
        return userRoleAndPermission.getPermissions();
    }

    /**
     * 返回一个账号所拥有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        UserRoleAndPermissionVO userRoleAndPermission = roleService.getUserRoleKeyList((String) loginId);
        if (userRoleAndPermission == null) {
            throw new CustomizeException("用户角色异常");
        }
        return userRoleAndPermission.getRoles().stream().map(RoleVO::getRoleKey).toList();
    }
}