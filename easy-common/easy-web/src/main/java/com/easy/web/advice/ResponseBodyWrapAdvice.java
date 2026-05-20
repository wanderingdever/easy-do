package com.easy.web.advice;


import com.alibaba.fastjson2.JSON;
import com.easy.core.base.R;
import com.easy.web.annotation.ResultWrap;
import org.jspecify.annotations.NonNull;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import java.util.Objects;

/**
 * <p>自动包装</p>
 *
 * @author 小徐
 * @since 2023/9/12 14:43
 */
@RestControllerAdvice(annotations = RequestMapping.class)
public class ResponseBodyWrapAdvice implements ResponseBodyAdvice<Object> {

    /**
     * 该组件是否支持给定的控制器方法返回类型
     *
     * @param converterType 选择的转换器类型
     * @return {@code true} {@link #beforeBodyWrite}应该被调用;
     * {@code false}否则无任何操作
     */
    @Override
    public boolean supports(@NonNull MethodParameter returnType, @NonNull Class<? extends HttpMessageConverter<?>> converterType) {
        return needWrapper(returnType);
    }

    /**
     * 确认需要拦截后执行此方法对 Response 返回值进行拦截处理
     * 在{@code HttpMessageConverter}被选中之后和之前调用
     * 它的 write 方法被调用。
     *
     * @param body                要写入的主体
     * @param returnType          通过内容协商选择的内容类型
     * @param selectedContentType 选择写入响应的转换器类型
     * @param request             当前请求
     * @param response            当前响应
     * @return 传入的主体或修改过的(可能是新的)实例
     */
    @Override
    @SuppressWarnings("unchecked")
    public Object beforeBodyWrite(Object body, @NonNull MethodParameter returnType, @NonNull MediaType selectedContentType,
                                  @NonNull Class<? extends HttpMessageConverter<?>> selectedConverterType,
                                  @NonNull ServerHttpRequest request, @NonNull ServerHttpResponse response) {
        boolean bodyIsString = returnType.getParameterType() == String.class;
        R<Object> r;
        if (body instanceof R) {
            r = (R<Object>) body;
        } else {
            r = R.success(body);
        }
        return bodyIsString ? JSON.toJSONString(r) : r;
    }

    private boolean needWrapper(MethodParameter methodParameter) {
        // 解析方法上的注解
        if (methodParameter.getAnnotatedElement().isAnnotationPresent(ResultWrap.class)) {
            ResultWrap wrap = Objects.requireNonNull(methodParameter.getMethod()).getAnnotation(ResultWrap.class);
            // 输出注解属性
            return !wrap.disabled();
        }
        return true;
    }
}