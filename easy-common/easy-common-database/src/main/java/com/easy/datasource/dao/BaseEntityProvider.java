package com.easy.datasource.dao;


import com.easy.core.bean.base.BaseEntity;

/**
 * Provider
 * </p>
 *
 * @author Matt
 */
public class BaseEntityProvider extends BaseProvider<BaseEntity> {

    private static final BaseEntityProvider PROVIDER = new BaseEntityProvider();

    public static BaseEntityProvider get() {
        return PROVIDER;
    }
}