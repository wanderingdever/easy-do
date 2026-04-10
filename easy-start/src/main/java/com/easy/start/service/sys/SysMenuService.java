package com.easy.start.service.sys;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.constant.Constants;
import com.easy.core.exception.CustomizeException;
import com.easy.start.bean.dto.sys.menu.MenuSearchDTO;
import com.easy.start.bean.entity.sys.SysMenu;
import com.easy.start.bean.entity.sys.SysRoleMenu;
import com.easy.start.bean.vo.router.MetaVo;
import com.easy.start.bean.vo.router.RouterVO;
import com.easy.start.dao.sys.SysMenuMapper;
import com.easy.start.enums.MenuType;
import com.easy.tool.lang.StringUtils;
import com.easy.tool.tree.TreeUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

/**
 * <p>
 * 菜单权限信息 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@Transactional(rollbackFor = Exception.class)
@AllArgsConstructor
public class SysMenuService extends ServiceImpl<SysMenuMapper, SysMenu> {

    private final SysRoleMenuService roleMenuService;

    /**
     * 新增菜单
     *
     * @param sysMenu 菜单信息
     */
    public void addMenu(SysMenu sysMenu) {
        save(sysMenu);
    }

    /**
     * 修改菜单
     *
     * @param sysMenu 菜单信息
     */
    public void updateMenu(SysMenu sysMenu) {
        // 如果新数据不是目录
        if (sysMenu.getMenuType() != MenuType.DIR) {
            SysMenu oldMenu = getById(sysMenu.getId());
            // 校验原来数据是否是目录以及是否有子集
            if (oldMenu.getMenuType() == MenuType.DIR && lambdaQuery().eq(SysMenu::getParentId, oldMenu.getId()).count() > 0) {
                throw new CustomizeException("目录下有子菜单,不能转换为页面");
            }
        }
        updateById(sysMenu);
    }

    /**
     * 删除菜单
     *
     * @param menuId 菜单ID
     */
    public void deleteMenu(String menuId) {
        if (roleMenuService.lambdaQuery().eq(SysRoleMenu::getMenuId, menuId).count() > 0) {
            throw new CustomizeException("菜单已被分配,无法删除");
        }
        if (lambdaQuery().eq(SysMenu::getParentId, menuId).count() > 0) {
            throw new CustomizeException("请先删除子菜单");
        }
        this.removeById(menuId);
    }

    /**
     * 根据角色ID查询菜单权限集合
     *
     * @param roleIdList 角色ID集合
     * @return 菜单权限集合
     */
    public List<String> getPermissionByRoleId(List<String> roleIdList) {
        // 查询角色->菜单权限关联表
        List<SysRoleMenu> list = roleMenuService.lambdaQuery().in(SysRoleMenu::getRoleId, roleIdList).list();
        if (list.isEmpty()) {
            return List.of();
        }
        // 提取菜单权限
        List<String> menuIds = list.stream().map(SysRoleMenu::getMenuId).toList();
        // 查询菜单信息
        List<SysMenu> menuList = lambdaQuery().in(SysMenu::getId, menuIds).list();
        // 提取菜单权限
        return menuList.stream().map(SysMenu::getPerms).toList().stream().filter(StringUtils::isNotBlank).toList();
    }

    /**
     * 获取所有菜单权限
     *
     * @return 菜单权限集合
     */
    public List<String> getAllPermission() {
        // 查询菜单信息
        List<SysMenu> menuList = lambdaQuery().list();
        // 提取菜单权限
        return menuList.stream().map(SysMenu::getPerms).toList().stream().filter(StringUtils::isNotBlank).toList();
    }

    public List<RouterVO> getUserRouter(String userId) {
        List<SysMenu> menuList = getMenuList(new MenuSearchDTO(userId, null, List.of(MenuType.DIR, MenuType.PAGE)));
        List<RouterVO> routerList = buildRouter(menuList);
        return TreeUtils.makeTree(routerList, x -> x.getParentId().equals(Constants.ROOT), (parent, child) -> parent.getId().equals(child.getParentId()), RouterVO::setChildren);
    }


    /**
     * 构建前端路由所需要的数据
     *
     * @param menuList 菜单数据
     * @return {@link List<RouterVO>}
     */
    public List<RouterVO> buildRouter(List<SysMenu> menuList) {
        List<RouterVO> routers = new LinkedList<RouterVO>();
        for (SysMenu menu : menuList) {
            RouterVO router = new RouterVO();
            router.setId(menu.getId());
            router.setParentId(menu.getParentId());
            router.setPath(getRouterPath(menu.getPath()));
            router.setName(getRouterName(menu.getPath()));
            router.setComponent(menu.getComponent());
            router.setRedirect(menu.getRedirect());
            router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), menu.getIsHide(), menu.getIsKeepAlive(),
                    menu.getIsIframe(), menu.getIsAffix(), menu.getLink()));
            routers.add(router);
        }
        return routers;
    }

    /**
     * 获取菜单树
     *
     * @param dto {@link MenuSearchDTO}}
     * @return {@link List <SysMenu>}
     */
    public List<SysMenu> getMenuList(MenuSearchDTO dto) {
        List<SysMenu> treeList;
        // 管理员角色
        if (StpUtil.getRoleList().contains(Constants.ADMIN_ROLE_KEY)) {
            treeList = this.lambdaQuery()
                    .eq(StringUtils.isNotBlank(dto.getMenuName()), SysMenu::getMenuName, dto.getMenuName())
                    .in(CollUtil.isNotEmpty(dto.getMenuType()), SysMenu::getMenuType, dto.getMenuType())
                    .orderByAsc(SysMenu::getOrderNum)
                    .list();
        } else {
            treeList = this.baseMapper.getMenuList(dto).stream().distinct().toList();
        }
        return treeList;
    }

    /**
     * 获取菜单树
     *
     * @param dto {@link MenuSearchDTO}}
     * @return {@link List <SysMenu>}
     */
    public List<SysMenu> getTreeMenu(MenuSearchDTO dto) {
        List<SysMenu> treeList = getMenuList(dto);
        return TreeUtils.makeTree(treeList, menu -> menu.getParentId().equals(Constants.ROOT), (parent, child) -> parent.getId().equals(child.getParentId()), SysMenu::setChildren);
    }

    /**
     * 获取路由地址
     *
     * @param path 路径
     * @return 路由地址
     */
    private String getRouterPath(String path) {
        return "/" + path;
    }

    /**
     * 获取路由名称
     *
     * @param path path
     * @return 路由名称
     */
    private String getRouterName(String path) {
        String replace = path.replace("/", "_");
        return StringUtils.toCamelCase(replace);
    }


}