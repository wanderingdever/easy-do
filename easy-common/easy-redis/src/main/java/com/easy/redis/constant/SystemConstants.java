package com.easy.redis.constant;

/**
 * 缓存相关静态常量
 * </p>
 *
 * @author Matt
 */
public interface SystemConstants {

    /**
     * 防重提交 redis key
     */
    String REPEAT_SUBMIT = "repeat_submit:";

    /**
     * 图形验证码 redis key
     */
    String CAPTCHA_CODE = "captcha_code:";

    /**
     * 登录验证码 redis key
     */
    String LOGIN_CODE = "login_code:";

    /**
     * 系统配置参数
     */
    String SYSTEM_CONFIG = "system_config";

    /**
     * 系统字典
     */
    String SYSTEM_DICT = "system_dict";

    /**
     * 是否开启验证码
     */
    String SYSTEM_CONFIG_CAPTCHA_ENABLE = "captcha_enable";

}