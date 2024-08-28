package com.easy.redis.constant;

/**
 * 缓存相关静态常量
 * </p>
 *
 * @author Matt
 */
public interface RedisConstants {

    /**
     * 防重提交 redis key
     */
    String REPEAT_SUBMIT = "repeat_submit:";

    /**
     * 验证码 redis key
     */
    String CAPTCHA_CODE = "captcha_code:";

}