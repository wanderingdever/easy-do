package com.easy.api.server.web;

import com.easy.api.server.config.ApiServerProperties;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import org.jspecify.annotations.NonNull;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.Set;

public class ApiServerJsonAcceptFilter extends OncePerRequestFilter {

    private final ApiServerProperties properties;

    public ApiServerJsonAcceptFilter(ApiServerProperties properties) {
        this.properties = properties;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain) throws ServletException, IOException {
        if (request.getHeader(properties.getSignHeader()) == null) {
            filterChain.doFilter(request, response);
            return;
        }
        filterChain.doFilter(new JsonAcceptRequestWrapper(request), response);
    }

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

    private static final class ListHolder {

        private static final java.util.List<String> APPLICATION_JSON = java.util.List.of(MediaType.APPLICATION_JSON_VALUE);
    }
}
