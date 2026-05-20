package com.easy.server.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.core.base.dto.IdListDTO;
import com.easy.server.bean.dto.sys.dict.DictSearchDTO;
import com.easy.server.bean.entity.sys.SysDictData;
import com.easy.server.bean.entity.sys.SysDictType;
import com.easy.server.service.sys.SysDictDataService;
import com.easy.server.service.sys.SysDictTypeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 字典类型
 * <p>
 * 2022/1/13 18:05
 *
 * @author Matt
 */
@Tag(name = "字典类型")
@RestController
@RequestMapping("/dict")
@AllArgsConstructor
public class DictController {


    private final SysDictTypeService dictTypeService;
    private final SysDictDataService dictDataService;


    /**
     * 重载缓存
     */
    @GetMapping(value = "/overload")
    @Operation(summary = "重载字典缓存")
    public void overloadDict() {
        dictTypeService.loadingDictCache();
    }

    /**
     * 查询字典类型详细
     *
     * @param id 主键
     * @return 字典类型信息
     */
    @GetMapping(value = "/get")
    @Operation(summary = "获取字典类型详情")
    public SysDictType getDictTypeInfoById(@RequestParam("id") String id) {
        return dictTypeService.getDictTypeInfoById(id);
    }

    /**
     * 字典类型和字典数据集合查询
     *
     * @param dto 查询入参
     * @return 集合数据
     */
    @PostMapping(value = "/type_data_list")
    @Operation(summary = "集合查询")
    public List<SysDictType> listTypeAndData(@RequestBody DictSearchDTO dto) {
        return dictTypeService.getTypeAndDataList(dto);
    }

    /**
     * 字典类型-分页查询
     *
     * @param dto 查询入参
     * @return 分页数据
     */
    @PostMapping(value = "/type_page")
    @Operation(summary = "分页查询")
    public Page<SysDictType> pageDictType(@RequestBody DictSearchDTO dto) {
        return dictTypeService.pageDictType(dto);
    }


    /**
     * 字典类型-新增
     *
     * @param dto 新增入参
     */
    @PostMapping(value = "/type_add")
    @Operation(summary = "新增字典类型")
    public String addDictType(@Valid @RequestBody SysDictType dto) {
        dictTypeService.addDictType(dto);
        dictTypeService.loadingDictCache();
        return "新增类型成功";
    }

    /**
     * 字典类型-更新
     *
     * @param dto 字典信息
     */
    @PostMapping(value = "/type_update")
    @Operation(summary = "修改字典类型")
    public String updateDictType(@Valid @RequestBody SysDictType dto) {
        dictTypeService.updateDictType(dto);
        dictTypeService.loadingDictCache();
        return "更新类型成功";
    }

    /**
     * 字典类型-删除
     *
     * @param id 主键
     */
    @PostMapping(value = "/type_del")
    @Operation(summary = "删除字典类型")
    public String delDictType(@RequestBody IdDTO id) {
        dictTypeService.deleteDictType(id.getId());
        dictTypeService.loadingDictCache();
        return "删除类型成功";
    }


    /**
     * 字典类型-分页查询
     *
     * @param dto 查询入参
     * @return 分页数据
     */
    @PostMapping(value = "/data_page")
    @Operation(summary = "分页查询")
    public Page<SysDictData> pageDictData(@RequestBody DictSearchDTO dto) {
        return dictDataService.pageDictData(dto);
    }

    /**
     * 字典数据-新增
     *
     * @param dto 新增入参
     */
    @PostMapping(value = "/data_add")
    @Operation(summary = "新增字典数据")
    public String addDictData(@Valid @RequestBody SysDictData dto) {
        dictDataService.addDictData(dto);
        dictTypeService.loadingDictCache();
        return "新增数据成功";
    }

    /**
     * 字典数据-更新
     *
     * @param dto 字典信息
     */
    @PostMapping(value = "/data_update")
    @Operation(summary = "修改字典数据")
    public String updateDictData(@Valid @RequestBody SysDictData dto) {
        dictDataService.updateDictData(dto);
        dictTypeService.loadingDictCache();
        return "更新数据成功";
    }

    /**
     * 字典数据-删除
     *
     * @param dto 主键集合
     */
    @PostMapping(value = "/data_del")
    @Operation(summary = "删除字典数据")
    public String delDictData(@RequestBody IdListDTO dto) {
        dictDataService.deleteDictData(dto.getIdList());
        dictTypeService.loadingDictCache();
        return "删除数据成功";
    }
}