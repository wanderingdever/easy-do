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

@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
public class ApiServerResponseBodyAdvice implements ResponseBodyAdvice<Object> {

    private final ApiServerCryptoService cryptoService;

    public ApiServerResponseBodyAdvice(ApiServerCryptoService cryptoService) {
        this.cryptoService = cryptoService;
    }

    @Override
    public boolean supports(@NonNull MethodParameter returnType, @NonNull Class<? extends HttpMessageConverter<?>> converterType) {
        ApiServer apiServer = getApiServerAnnotation(returnType);
        return apiServer != null && apiServer.responseEncrypt();
    }

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

    private ApiServer getApiServerAnnotation(MethodParameter returnType) {
        ApiServer methodAnnotation = returnType.getMethodAnnotation(ApiServer.class);
        if (methodAnnotation != null) {
            return methodAnnotation;
        }
        Class<?> containingClass = returnType.getContainingClass();
        return AnnotationUtils.findAnnotation(containingClass, ApiServer.class);
    }
}
