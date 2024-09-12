package com.easy.start.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.start.bean.entity.Role;

/**
 * 角色
 * </p>
 *
 * @author Matt
 */
public class RoleProvider extends BaseProvider<Role> {

    private static final RoleProvider PROVIDER = new RoleProvider();

    public static RoleProvider get() {
        return PROVIDER;
    }
}