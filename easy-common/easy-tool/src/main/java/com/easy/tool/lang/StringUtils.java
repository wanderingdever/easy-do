package com.easy.tool.lang;


import cn.hutool.core.util.StrUtil;


/**
 * 字符串工具类
 * </p>
 *
 * @author Matt
 */
public class StringUtils extends StrUtil {

    private StringUtils() {
        throw new IllegalAccessError("StringUtil.class");
    }

    /**
     * http
     */
    private static final String HTTP = "http://";

    /**
     * https
     */
    private static final String HTTPS = "https://";

    /**
     * 是否为http(s)://开头
     *
     * @param link 链接
     * @return 结果
     */
    public static boolean isHttp(String link) {
        return startWithAny(link, HTTP, HTTPS);
    }

    /**
     * * 判断一个对象是否为空
     *
     * @param object Object
     * @return true：为空 false：非空
     */
    public static boolean isNull(Object object) {
        return object == null;
    }

    /**
     * * 判断一个对象是否非空
     *
     * @param object Object
     * @return true：非空 false：空
     */
    public static boolean isNotNull(Object object) {
        return !isNull(object);
    }
}