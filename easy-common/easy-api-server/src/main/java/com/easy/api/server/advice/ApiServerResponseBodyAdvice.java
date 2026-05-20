package com.easy.api.server.advice;

import com.alibaba.fastjson2.JSONObject;
import com.easy.api.client.annotation.ApiServer;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.service.ApiServerCryptoService;

import com.easy.core.base.R;
import jakarta.servlet.http.HttpServletRequest;
import org.jspecify.annotations.NonNull;
import org.springframework.core.MethodParameter;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.core.annotation.Order;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * 开放 API 响应加密处理器。
 * <p>
 * 仅处理标记了 {@code @ApiServer(responseEncrypt = true)} 的接口，
 * 将原始业务返回值序列化为 JSON 后加密，并包装为 {@code R<String>} 返回。
 */
@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
public class ApiServerResponseBodyAdvice implements ResponseBodyAdvice<Object> {

    /**
     * 响应加密服务。
     */
    private final ApiServerCryptoService cryptoService;

    public ApiServerResponseBodyAdvice(ApiServerCryptoService cryptoService) {
        this.cryptoService = cryptoService;
    }

    /**
     * 判断当前返回值是否需要加密。
     */
    @Override
    public boolean supports(@NonNull MethodParameter returnType, @NonNull Class<? extends HttpMessageConverter<?>> converterType) {
        ApiServer apiServer = getApiServerAnnotation(returnType);
        return apiServer != null && apiServer.responseEncrypt();
    }

    /**
     * 加密响应体，并统一输出 JSON 响应结构。
     */
    @Override
    public Object beforeBodyWrite(Object body,
                                  @NonNull MethodParameter returnType,
                                  @NonNull MediaType selectedContentType,
                                  @NonNull Class<? extends HttpMessageConverter<?>> selectedConverterType,
                                  @NonNull ServerHttpRequest request,
                                  @NonNull ServerHttpResponse response) {
        if (!(request instanceof ServletServerHttpRequest servletRequest)) {
            return body;
        }
        HttpServletRequest httpServletRequest = servletRequest.getServletRequest();
        Object authInfo = httpServletRequest.getAttribute(ApiServerAuthInfo.class.getName());
        if (!(authInfo instanceof ApiServerAuthInfo apiServerAuthInfo)) {
            return body;
        }
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
        String encryptedResponse = cryptoService.encryptResponse(JSONObject.toJSONString(body), apiServerAuthInfo);
        return R.success(encryptedResponse);
    }

    /**
     * 兼容方法注解和类注解两种 {@code @ApiServer} 使用方式。
     */
    private ApiServer getApiServerAnnotation(MethodParameter returnType) {
        ApiServer methodAnnotation = returnType.getMethodAnnotation(ApiServer.class);
        if (methodAnnotation != null) {
            return methodAnnotation;
        }
        Class<?> containingClass = returnType.getContainingClass();
        return AnnotationUtils.findAnnotation(containingClass, ApiServer.class);
    }
}
