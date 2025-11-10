package com.easy.start.annotation;

import java.lang.annotation.*;

/**
 * api服务注解
 * </p>
 *
 * @author Matt
 */
@Inherited
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ApiServer {

    /**
     * 间隔时间(ms)，小于此时间视为重复提交
     *
     * @return interval
     */
    int interval() default 3000;


    /**
     * 是否响应加密
     *
     * @return responseEncrypt
     */
    boolean responseEncrypt() default true;

    /**
     * 提示信息
     *
     * @return message
     */
    String message() default "不允许重复提交，请稍后再试";
}