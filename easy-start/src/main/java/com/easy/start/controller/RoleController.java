package com.easy.start.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.sys.role.RoleDTO;
import com.easy.start.bean.dto.sys.role.RoleEditDTO;
import com.easy.start.bean.dto.sys.role.RoleSearchDTO;
import com.easy.start.bean.entity.sys.SysRole;
import com.easy.start.service.sys.SysRoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 角色控制器
 * <p>
 */
@RestController
@RequestMapping("/role")
@Tag(name = "角色管理")
@AllArgsConstructor
public class RoleController {

    private final SysRoleService roleService;

    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<SysRole> page(@RequestBody RoleSearchDTO dto) {
        return roleService.pageRole(dto);
    }

    @PostMapping("/add")
    @Operation(summary = "新增角色")
    public String addRole(@RequestBody RoleDTO dto) {
        roleService.addRole(dto);
        return "新增成功";
    }

    @PostMapping("/update")
    @Operation(summary = "修改角色")
    public String updateRole(@RequestBody RoleEditDTO dto) {
        roleService.updateRole(dto);
        return "修改成功";
    }

    @PostMapping("/delete")
    @Operation(summary = "删除角色")
    public String deleteRole(@RequestBody IdDTO dto) {
        roleService.deleteRole(dto.getId());
        return "删除成功";
    }

    @PostMapping(value = "/role_menu_ids")
    @Operation(summary = "角色菜单集合")
    public List<String> roleMenuIds(@RequestBody IdDTO dto) {
        return roleService.roleMenuIds(dto);
    }
}
