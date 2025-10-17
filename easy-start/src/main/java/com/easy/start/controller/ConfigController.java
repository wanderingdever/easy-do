package com.easy.start.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdListDTO;
import com.easy.start.bean.dto.sys.config.ConfigSearchDTO;
import com.easy.start.bean.entity.sys.SysConfig;
import com.easy.start.service.sys.SysConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 参数配置
 * <p>
 * 2022/1/13 18:05
 *
 * @author Matt
 */
@RestController
@RequestMapping("/config")
@AllArgsConstructor
@Tag(name = "参数配置")
public class ConfigController {

    private final SysConfigService configService;


    /**
     * 重载缓存
     */
    @GetMapping(value = "/overload")
    @Operation(summary = "重载参数缓存")
    public void overloadConfig() {
        configService.loadConfigCache();
    }

    /**
     * 获取参数配置
     *
     * @param configKey key
     * @return ConfigCache
     */
    @GetMapping("/get")
    @Operation(summary = "获取参数配置")
    @SaIgnore
    public SysConfig getConfig(@RequestParam("configKey") String configKey) {
        return configService.getSysConfigByConfigKey(configKey);
    }


    /**
     * 分页查询
     *
     * @param dto 查询入参
     * @return IPage<Config>
     */
    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<SysConfig> pageConfig(@RequestBody ConfigSearchDTO dto) {
        return configService.pageSysConfig(dto);
    }

    /**
     * 新增参数配置
     *
     * @param dto 入参
     */
    @PostMapping("/add")
    @Operation(summary = "新增参数配置")
    public String addConfig(@Valid @RequestBody SysConfig dto) {
        configService.addSysConfig(dto);
        configService.loadConfigCache();
        return "新增成功";
    }

    /**
     * 更新参数配置
     *
     * @param config 入参
     */
    @PostMapping("/update")
    @Operation(summary = "更新参数配置")
    public String updateConfig(@Valid @RequestBody SysConfig config) {
        configService.updateSysConfig(config);
        configService.loadConfigCache();
        return "更新成功";
    }

    /**
     * 删除参数配置
     *
     * @param dto 主键集合
     */
    @PostMapping("/del")
    @Operation(summary = "删除参数配置")
    public String delConfig(@RequestBody IdListDTO dto) {
        configService.deleteSysConfig(dto.getIdList());
        configService.loadConfigCache();
        return "删除成功";
    }
}