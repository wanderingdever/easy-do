package com.easy.api.server.web;

import com.easy.api.server.config.ApiServerProperties;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 开放 API JSON 响应过滤器。
 * <p>
 * 当请求包含签名头时，将 Accept 头统一改为 application/json，
 * 防止客户端声明 XML 优先后触发 Spring 的 XML 响应转换器。
 */
public class ApiServerJsonAcceptFilter extends OncePerRequestFilter {

    /**
     * 开放 API 服务端配置。
     */
    private final ApiServerProperties properties;

    public ApiServerJsonAcceptFilter(ApiServerProperties properties) {
        this.properties = properties;
    }

    /**
     * 仅处理带签名头的开放 API 请求。
     */
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        if (request.getHeader(properties.getSignHeader()) == null) {
            filterChain.doFilter(request, response);
            return;
        }
        filterChain.doFilter(new JsonAcceptRequestWrapper(request), response);
    }

    /**
     * 包装请求头读取逻辑，将 Accept 统一暴露为 application/json。
     */
    private static class JsonAcceptRequestWrapper extends HttpServletRequestWrapper {

        JsonAcceptRequestWrapper(HttpServletRequest request) {
            super(request);
        }

        @Override
        public String getHeader(String name) {
            if (HttpHeaders.ACCEPT.equalsIgnoreCase(name)) {
                return MediaType.APPLICATION_JSON_VALUE;
            }
            return super.getHeader(name);
        }

        @Override
        public Enumeration<String> getHeaders(String name) {
            if (HttpHeaders.ACCEPT.equalsIgnoreCase(name)) {
                return Collections.enumeration(ListHolder.APPLICATION_JSON);
            }
            return super.getHeaders(name);
        }

        @Override
        public Enumeration<String> getHeaderNames() {
            Set<String> names = new LinkedHashSet<>();
            Enumeration<String> headerNames = super.getHeaderNames();
            while (headerNames.hasMoreElements()) {
                names.add(headerNames.nextElement());
            }
            names.add(HttpHeaders.ACCEPT);
            return Collections.enumeration(names);
        }
    }

    /**
     * 避免每次请求重复创建 application/json 列表。
     */
    private static final class ListHolder {

        private static final java.util.List<String> APPLICATION_JSON = java.util.List.of(MediaType.APPLICATION_JSON_VALUE);
    }
}
