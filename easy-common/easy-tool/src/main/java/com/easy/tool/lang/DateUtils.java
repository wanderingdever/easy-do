package com.easy.tool.lang;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;

import java.util.Date;


/**
 * 时间工具
 * </p>
 *
 * @author Matt
 */
public class DateUtils extends DateUtil {

    public static final String DATE_PATH = "yyyy/MM/dd";

    public static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static final String[] PARSE_PATTERNS =
            {"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss",
                    "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};

    public static final String[] WEEK = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};
    public static final String[] HOUR_INDEX = {"0-6", "6-8", "8-10", "10-12", "12-14", "14-16", "16-18", "18-20", "20-22", "22-24"};

    private DateUtils() {
        throw new IllegalAccessError("DateUtils.class");
    }

    /**
     * 获取当前年月日
     *
     * @return 日期数字 即年月日 如20180808
     */
    public static String dateNum() {
        return format(new Date(), DatePattern.PURE_DATE_PATTERN);
    }

    /**
     * 获取当前 时 分 秒 毫秒
     *
     * @return 日期数字  如154320846
     */
    public static String timeNum() {
        return format(new Date(), DatePattern.PURE_TIME_FORMATTER);
    }

}