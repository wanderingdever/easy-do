package com.easy.start.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.start.bean.entity.UserOrg;

/**
 * 用户机构
 * </p>
 *
 * @author Matt
 */
public class UserOrgProvider extends BaseProvider<UserOrg> {

    private static final UserOrgProvider PROVIDER = new UserOrgProvider();

    public static UserOrgProvider get() {
        return PROVIDER;
    }
}