package com.easy.server.utils;


import com.easy.core.exception.CustomizeException;

import java.util.regex.Pattern;

public final class SqlIdentifierUtil {

    private static final Pattern IDENTIFIER_PATTERN = Pattern.compile("^[A-Za-z_][A-Za-z0-9_]*$");

    private SqlIdentifierUtil() {
    }

    public static void validate(String identifier, String fieldName) {
        if (identifier == null || identifier.isBlank()) {
            throw new CustomizeException(fieldName + " 不能为空");
        }
        if (!IDENTIFIER_PATTERN.matcher(identifier).matches()) {
            throw new CustomizeException(fieldName + " 非法，仅允许字母数字下划线，且不能数字开头: " + identifier);
        }
    }
}
