package com.easy.server.controller;


import cn.dev33.satoken.annotation.SaIgnore;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.server.bean.dto.sys.api.ApiManageDTO;
import com.easy.server.bean.entity.sys.OpenApiList;
import com.easy.server.dao.sys.OpenApiManageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * api管理
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/api_manage")
@RestController
@SaIgnore
@Tag(name = "API管理")
@AllArgsConstructor
public class ApiManageController {

    private final OpenApiManageService apiManageService;

    // 分页查询
    @PostMapping("/page")
    @Operation(summary = "分页查询API")
    public Page<OpenApiList> page(@RequestBody ApiManageDTO dto) {
        return apiManageService.page(dto);
    }

    // 查询所有API
    @PostMapping("/list")
    @Operation(summary = "查询所有API")
    public List<OpenApiList> getAllApis(@RequestBody ApiManageDTO dto) {
        return apiManageService.getAllApis(dto);
    }

    // 查询单个API
    @GetMapping("/get/{id}")
    @Operation(summary = "根据ID查询API")
    public OpenApiList getApiById(@PathVariable String id) {
        return apiManageService.getApiById(id);
    }

    // 新增API
    @PostMapping("/add")
    @Operation(summary = "新增API")
    public void createApi(@RequestBody OpenApiList apiInfo) {
        apiManageService.addApi(apiInfo);
    }

    // 更新API
    @PostMapping("/update")
    @Operation(summary = "更新API")
    public void updateApi(@RequestBody OpenApiList apiInfo) {
        apiManageService.updateApi(apiInfo);
    }

    /**
     * 删除API
     */
    @PostMapping("del")
    @Operation(summary = "删除API")
    public void deleteApi(@RequestBody IdDTO id) {
        apiManageService.deleteApi(id.getId());
    }

    /**
     * 获取用户授权的列表
     */
    @PostMapping("/get_user_api")
    @Operation(summary = "获取用户授权的列表")
    public List<OpenApiList> getUserApi(@RequestBody IdDTO id) {
        return apiManageService.getUserApi(id.getId());
    }
}