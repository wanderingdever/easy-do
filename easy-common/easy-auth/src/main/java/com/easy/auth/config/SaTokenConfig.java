package com.easy.auth.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.jwt.StpLogicJwtForSimple;
import cn.dev33.satoken.stp.StpLogic;
import cn.dev33.satoken.stp.StpUtil;
import com.easy.auth.handler.TokenRenewalHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;

/**
 * 路由权限拦截
 * </p>
 *
 * @author Matt
 */
@Configuration
@Slf4j
public class SaTokenConfig implements WebMvcConfigurer {

    private final ApiWhiteListProperties whiteList;

    @Value("${sa-token.automatic-renewal:false}")
    private boolean automaticRenewal;

    public SaTokenConfig(ApiWhiteListProperties whiteList) {
        this.whiteList = whiteList;
    }

    // 注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.warn("API WHITE LIST:{}", Arrays.stream(whiteList.getUrlAllArray()).toList());
        // 注册 Sa-Token 拦截器，校验规则为 StpUtil.checkLogin() 登录校验。
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns(whiteList.getUrlAllArray())
                // 手动放行
                .excludePathPatterns("/**/*.js", "/lang/*.json", "/**/*.css", "/**/*.js", "/**/*.map", "/**/*.html", "/**/*.png",
                        "/**/*.ico", "/**/*.jpg", "/favicon.ico", "/doc.html", "/webjars/**", "/swagger**/**", "/v2/**", "/v3/**", "/error");
        // 开启自动续期
        if (automaticRenewal) {
            // token续期功能
            registry.addInterceptor(new TokenRenewalHandler(handle -> StpUtil.checkLogin()))
                    .addPathPatterns("/**")
                    .excludePathPatterns(whiteList.getUrlAllArray())
                    // 手动放行
                    .excludePathPatterns("/**/*.js", "/lang/*.json", "/**/*.css", "/**/*.js", "/**/*.map", "/**/*.html", "/**/*.png",
                            "/**/*.ico", "/**/*.jpg", "/favicon.ico", "/doc.html", "/webjars/**", "/swagger**/**", "/v2/**", "/v3/**", "/error");
        }

    }

    @Bean
    public StpLogic getStpLogicJwt() {
        return new StpLogicJwtForSimple();
    }
}