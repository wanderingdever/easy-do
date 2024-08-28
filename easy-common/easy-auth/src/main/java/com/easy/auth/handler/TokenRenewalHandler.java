package com.easy.auth.handler;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.exception.BackResultException;
import cn.dev33.satoken.exception.StopMatchException;
import cn.dev33.satoken.fun.SaParamFunction;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.strategy.SaStrategy;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import java.lang.reflect.Method;

/**
 * token自动续期
 * </p>
 *
 * @author Matt
 */
public class TokenRenewalHandler implements HandlerInterceptor {
    public boolean isAnnotation = true;
    public SaParamFunction<Object> auth = (handler) -> {
    };

    public TokenRenewalHandler(SaParamFunction<Object> auth) {
        this.auth = auth;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            if (this.isAnnotation && handler instanceof HandlerMethod) {
                Method method = ((HandlerMethod) handler).getMethod();
                if ((Boolean) SaStrategy.instance.isAnnotationPresent.apply(method, SaIgnore.class)) {
                    return true;
                }
                // 获取当前token的过期时间
                long tokenTimeout = StpUtil.getTokenTimeout();
                if (tokenTimeout > 0) {
                    // 续满
                    StpUtil.renewTimeout(SaManager.getConfig().getTimeout());
                }
            }
            this.auth.run(handler);
        } catch (StopMatchException ignored) {
        } catch (BackResultException var6) {
            if (response.getContentType() == null) {
                response.setContentType("text/plain; charset=utf-8");
            }
            response.getWriter().print(var6.getMessage());
            return false;
        }
        return true;
    }
}