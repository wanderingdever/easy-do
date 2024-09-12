package com.easy.start.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.start.bean.entity.UserInfo;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
public class UserInfoProvider extends BaseProvider<UserInfo> {

    private static final UserInfoProvider PROVIDER = new UserInfoProvider();

    public static UserInfoProvider get() {
        return PROVIDER;
    }
}