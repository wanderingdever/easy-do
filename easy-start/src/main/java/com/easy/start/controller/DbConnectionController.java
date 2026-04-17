package com.easy.start.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.core.base.dto.IdListDTO;
import com.easy.start.bean.dto.sys.db.DbDTO;
import com.easy.start.bean.dto.sys.db.DbSearchDTO;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.service.sys.SysDbConnectionConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 数据库连接配置控制器
 * </p>
 * 提供数据库连接配置的增删改查接口
 *
 * @author Matt
 */
@RestController
@RequestMapping("/db")
@AllArgsConstructor
@Tag(name = "数据库连接配置")
public class DbConnectionController {

    private final SysDbConnectionConfigService dbConnectionConfigService;

    /**
     * 分页查询数据库连接配置
     *
     * @param searchDTO 查询条件
     * @return 分页数据
     */
    @Operation(summary = "分页查询")
    @PostMapping("/page")
    public Page<SysDbConnectionConfig> pageDb(@RequestBody DbSearchDTO searchDTO) {
        return dbConnectionConfigService.pageDb(searchDTO);
    }

    /**
     * 根据ID查询数据库连接配置详情
     *
     * @param id 配置ID
     * @return 数据库连接配置详情
     */
    @Operation(summary = "根据ID查询详情")
    @GetMapping("/get/{id}")
    public SysDbConnectionConfig getDbById(@PathVariable("id") String id) {
        return dbConnectionConfigService.getDbById(id);
    }

    /**
     * 新增数据库连接配置
     *
     * @param dto 数据库连接配置信息
     * @return 新增成功的配置ID
     */
    @Operation(summary = "新增数据库连接配置")
    @PostMapping("/add")
    public String addDb(@Valid @RequestBody DbDTO dto) {
        return dbConnectionConfigService.addDb(dto);
    }

    /**
     * 更新数据库连接配置
     *
     * @param dto 数据库连接配置信息
     * @return 操作结果
     */
    @Operation(summary = "更新数据库连接配置")
    @PostMapping("/update")
    public String updateDb(@Valid @RequestBody DbDTO dto) {
        dbConnectionConfigService.updateDb(dto);
        return "更新成功";
    }

    /**
     * 删除数据库连接配置
     *
     * @param dto 配置ID
     * @return 操作结果
     */
    @Operation(summary = "删除数据库连接配置")
    @PostMapping("/del")
    public String deleteDb(@RequestBody IdDTO dto) {
        dbConnectionConfigService.deleteDb(dto.getId());
        return "删除成功";
    }

    /**
     * 批量删除数据库连接配置
     *
     * @param dto 配置ID列表
     * @return 操作结果
     */
    @Operation(summary = "批量删除数据库连接配置")
    @PostMapping("/del_batch")
    public String deleteBatch(@RequestBody IdListDTO dto) {
        dbConnectionConfigService.deleteBatch(dto.getIdList());
        return "批量删除成功";
    }
}
