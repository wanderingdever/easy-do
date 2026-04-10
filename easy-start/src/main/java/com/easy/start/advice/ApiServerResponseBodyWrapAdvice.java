package com.easy.start.advice;

import com.alibaba.fastjson2.JSONObject;
import com.easy.client.annotation.ApiServer;
import com.easy.client.constant.ApiConstants;
import com.easy.start.utils.ApiServerUtils;
import jakarta.validation.constraints.NotNull;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * <p>自动包装</p>
 *
 * @author matt
 */
@RestControllerAdvice(annotations = RequestMapping.class)
public class ***REMOVE_SECRET*** implements ResponseBodyAdvice<Object> {

    /**
     * 该组件是否支持给定的控制器方法返回类型
     *
     * @param converterType 选择的转换器类型
     * @return {@code true} {@link #beforeBodyWrite}应该被调用;
     * {@code false}否则无任何操作
     */
    @Override
    public boolean supports(@NotNull MethodParameter returnType, @NotNull Class<? extends HttpMessageConverter<?>> converterType) {
        ApiServer methodAnnotation = returnType.getMethodAnnotation(ApiServer.class);
        // 如果有注解ApiServer，就对响应参数进行加密返回
        return methodAnnotation != null && methodAnnotation.responseEncrypt();
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
    public Object beforeBodyWrite(Object body, @NotNull MethodParameter returnType, @NotNull MediaType selectedContentType,
                                  @NotNull Class<? extends HttpMessageConverter<?>> selectedConverterType,
                                  @NotNull ServerHttpRequest request, @NotNull ServerHttpResponse response) {
        String reqParams = request.getHeaders().getFirst(ApiConstants.SIGN_KEY);
        return ApiServerUtils.encryptResponse(reqParams, JSONObject.toJSONString(body));
    }

}