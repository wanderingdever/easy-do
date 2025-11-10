package com.easy.start.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.sys.api.ApiDTO;
import com.easy.start.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.start.service.sys.OpenApiUserAuthInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * api授权
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/api_auth")
@RestController
@SaIgnore
@Tag(name = "API授权管理")
@AllArgsConstructor
public class ApiAuthController {

    private final OpenApiUserAuthInfoService userApiAuthInfoService;

    /**
     * 初始化所有的appid到redis
     */
    @GetMapping("/init_appid")
    @Operation(summary = "初始化所有的appid到redis")
    @SaIgnore
    public void initAppid() {
        userApiAuthInfoService.initAppid();
    }

    /**
     * 用户授权
     */
    @PostMapping("/apply_for")
    @Operation(summary = "生成用户授权信息")
    public void userApiAuth(@RequestBody IdDTO dto) {
        userApiAuthInfoService.grantUserApiPermission(dto.getId());
    }


    /**
     * 授权调用api列表
     */
    @PostMapping("/apply_api")
    @Operation(summary = "授权调用api列表")
    public void applyApi(@RequestBody ApiDTO dto) {
        userApiAuthInfoService.applyApi(dto.getUserId(), dto.getAppid(), dto.getApiIdList());
    }

    /**
     * 用户获取授权信息
     */
    @PostMapping("/get")
    @Operation(summary = "用户获取授权信息")
    public OpenApiUserAuthInfo getUserApiAuthInfo(@RequestBody IdDTO dto) {
        return userApiAuthInfoService.getUserApiAuthInfo(dto.getId());
    }
}