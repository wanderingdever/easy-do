package com.easy.start.enums;

import com.easy.core.exception.CustomizeException;

public enum DatabaseType {
    MYSQL,
    POSTGRESQL;

    public static DatabaseType from(String value) {
        if (value == null || value.isBlank()) {
            throw new CustomizeException("目标数据库类型为空");
        }
        for (DatabaseType type : values()) {
            if (type.name().equalsIgnoreCase(value.trim())) {
                return type;
            }
        }
        throw new CustomizeException("暂不支持的数据库类型: " + value);
    }
}
