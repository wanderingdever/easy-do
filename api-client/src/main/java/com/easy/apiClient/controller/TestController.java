package com.easy.apiClient.controller;

import com.alibaba.fastjson2.JSON;
import com.easy.api.client.service.ApiClientService;
import com.easy.apiClient.entity.ApiTest;
import com.easy.core.base.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
@AllArgsConstructor
@Tag(name = "测试")
public class TestController {

    private final ApiClientService apiClientService;

    /**
     * 测试接口
     */
    @GetMapping("/api")
    @Operation(summary = "测试API功能")
    public R<String> testApi(@RequestParam("apiPath") String apiPath) {
        R<String> r = apiClientService.requestUrl(apiPath, null);
        ApiTest apiTest = JSON.parseObject(r.getData(), ApiTest.class);
        return r;
    }

}
