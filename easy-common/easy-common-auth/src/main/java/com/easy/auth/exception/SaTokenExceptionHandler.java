package com.easy.auth.exception;

import cn.dev33.satoken.exception.NotLoginException;
import com.easy.auth.enums.SaTokenException;
import com.easy.core.bean.base.R;
import com.easy.utils.enums.EnumUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * satoken异常处理
 * </p>
 *
 * @author Matt
 */
@Slf4j
@RestControllerAdvice(basePackages = "com.easy")
@Order(-1)
public class SaTokenExceptionHandler {

    /**
     * 登录异常拦截
     */
    @ExceptionHandler(value = NotLoginException.class)
    public R<String> handleNotLoginException(NotLoginException e) {
        log.error("satoken异常拦截->code={}, e={}", e.getCode(), e.getMessage());
        SaTokenException byClass = EnumUtils.getByClass(e.getCode(), SaTokenException.class);
        return R.fail(byClass.getCode(), byClass.getIntroduction());
    }
}