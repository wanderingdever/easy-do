package com.easy.start.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.start.bean.entity.Org;

/**
 * 机构
 * </p>
 *
 * @author Matt
 */
public class OrgProvider extends BaseProvider<Org> {

    private static final OrgProvider PROVIDER = new OrgProvider();

    public static OrgProvider get() {
        return PROVIDER;
    }
}