package com.easy.web.annotation;


import java.lang.annotation.*;

/**
 * <p>用于将 controller 返回值用包裹</p>
 *
 * @author matt
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ResultWrap {

    /**
     * 是否禁用
     */
    boolean disabled() default false;
}