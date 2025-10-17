package com.easy.start.controller;


import cn.dev33.satoken.stp.StpUtil;
import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.sys.menu.MenuSearchDTO;
import com.easy.start.bean.entity.sys.SysMenu;
import com.easy.start.bean.vo.router.RouterVO;
import com.easy.start.service.sys.SysMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单管理
 *
 * @author Matt
 */
@RestController
@RequestMapping("/menu")
@AllArgsConstructor
@Tag(name = "菜单管理")
public class MenuController {

    private final SysMenuService menuService;


    /**
     * 获取用户路由
     *
     * @return Menu
     */
    @GetMapping(value = "/user_router")
    @Operation(summary = "获取用户路由")
    public List<RouterVO> getUserRouter() {
        return menuService.getUserRouter(StpUtil.getLoginIdAsString());
    }

    /**
     * 获取树形菜单
     *
     * @param dto 查询条件
     * @return MenuTree
     */
    @PostMapping(value = "/tree")
    @Operation(summary = "树形菜单")
    public List<SysMenu> getTreeMenu(@RequestBody MenuSearchDTO dto) {
        return menuService.getTreeMenu(dto);
    }

    /**
     * 新增菜单
     *
     * @param dto 菜单信息
     */
    @PostMapping(value = "/add")
    @Operation(summary = "新增菜单")
    public String addMenu(@Valid @RequestBody SysMenu dto) {
        menuService.addMenu(dto);
        return "新增成功";
    }

    /**
     * 修改菜单
     *
     * @param menu 菜单信息
     */
    @PostMapping(value = "/update")
    @Operation(summary = "修改菜单")
    public String updateMenu(@Valid @RequestBody SysMenu menu) {
        menuService.updateMenu(menu);
        return "修改成功";
    }

    /**
     * 删除菜单
     *
     * @param id 菜单id
     */
    @PostMapping(value = "/del")
    @Operation(summary = "删除菜单")
    public String delMenu(@RequestBody IdDTO id) {
        menuService.deleteMenu(id.getId());
        return "删除成功";
    }
}