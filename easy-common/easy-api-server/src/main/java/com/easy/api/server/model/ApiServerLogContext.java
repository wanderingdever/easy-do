package com.easy.api.server.model;

import com.easy.api.client.entity.ApiHeaderParam;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.Setter;

/**
 * 开放 API 访问日志上下文。
 * <p>
 * 模块只负责构造上下文并回调 {@code ApiServerAccessLogger}，具体是否落库、写文件或发送消息由接入方决定。
 */
@Setter
@Getter
public class ApiServerLogContext {

    /**
     * 调用方 appId。
     */
    private String appId;

    /**
     * 当前请求唯一 ID。
     */
    private String requestId;

    /**
     * 当前请求 API 路径。
     */
    private String apiPath;

    /**
     * 调用方 IP。
     */
    private String requestIp;

    /**
     * 解析后的签名请求头。
     */
    private ApiHeaderParam headerParam;

    /**
     * 解密后的业务请求参数。
     */
    private Object requestParam;

    /**
     * 原始 Servlet 请求对象，供业务侧日志实现读取额外上下文。
     */
    private HttpServletRequest request;

    /**
     * 当前 appId 对应的授权信息。
     */
    private ApiServerAuthInfo authInfo;

    /**
     * 当前命中的 API 授权项。
     */
    private ApiServerApiInfo apiInfo;

}
