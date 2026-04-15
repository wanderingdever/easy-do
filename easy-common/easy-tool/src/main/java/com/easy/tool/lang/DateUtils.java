package com.easy.tool.lang;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


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

    /**
     * 获取当前年月日
     *
     * @return 日期路径 即年/月/日 如2018/08/08
     */
    public static String datePath() {
        return format(new Date(), DATE_PATH);
    }

    /**
     * 获取当前时间到次日时间还有多少分钟
     *
     * @return 分钟数
     */
    public static long getMinutesToNextDay() {
        // 获取当前时间
        Date now = new Date();
        // 获取次日时间
        Date nextDay = DateUtil.offset(now, DateField.DAY_OF_MONTH, 1);
        // 计算分钟数
        return DateUtil.between(now, nextDay, DateUnit.MINUTE);
    }

    /**
     * 找出两个日期间的所有日期
     *
     * @param beginTime 开始日期
     * @param endTime   结束日期
     * @param formatter 格式化
     * @param reverse   是否反转日期
     * @return 日期集合
     */
    public static List<String> findEveryDay(String beginTime, String endTime, String formatter, boolean reverse) {
        List<String> dates = findEveryDay(beginTime, endTime, formatter);
        if (reverse) {
            java.util.Collections.reverse(dates);
        }
        return dates;
    }

    /**
     * 传入两个时间范围，返回这两个时间范围内的所有日期，并保存在一个集合中
     */
    public static List<String> findEveryDay(String beginTime, String endTime, String formatter) {
        List<String> dates = new ArrayList<>();
        Date dBegin = parse(beginTime, formatter);
        Date dEnd = parse(endTime, formatter);

        if (dBegin.after(dEnd)) {
            Date temp = dBegin;
            dBegin = dEnd;
            dEnd = temp;
        }

        dates.add(format(dBegin, formatter));
        Calendar calBegin = Calendar.getInstance();
        calBegin.setTime(dBegin);

        while (dEnd.after(calBegin.getTime())) {
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            dates.add(format(calBegin.getTime(), formatter));
        }
        return dates;
    }
}