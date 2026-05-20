package com.easy.api.server.model;

import com.easy.api.client.entity.ApiHeaderParam;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ApiServerLogContext {

    private String appId;

    private String requestId;

    private String apiPath;

    private String requestIp;

    private ApiHeaderParam headerParam;

    private Object requestParam;

    private HttpServletRequest request;

    private ApiServerAuthInfo authInfo;

    private ApiServerApiInfo apiInfo;

}
