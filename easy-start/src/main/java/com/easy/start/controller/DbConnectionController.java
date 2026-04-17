package com.easy.start.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.start.bean.dto.sys.db.DbSearchDTO;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.service.sys.SysDbConnectionConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/db")
@AllArgsConstructor
@Tag(name = "数据库连接配置")
public class DbConnectionController {

    private final SysDbConnectionConfigService dbConnectionConfigService;

    @Operation(summary = "分页查询")
    @PostMapping("/page")
    public Page<SysDbConnectionConfig> pageDb(@RequestBody DbSearchDTO searchDTO) {
        return dbConnectionConfigService.pageDb(searchDTO);
    }


}
