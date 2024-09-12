package com.easy.start.service;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.constant.Constants;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.start.bean.dto.menu.MenuAddDTO;
import com.easy.start.bean.dto.menu.MenuEditDTO;
import com.easy.start.bean.dto.menu.MenuListDTO;
import com.easy.start.bean.entity.Menu;
import com.easy.start.bean.entity.RoleMenu;
import com.easy.start.bean.vo.menu.MenuTreeVO;
import com.easy.start.bean.vo.router.MetaVo;
import com.easy.start.bean.vo.router.RouterVO;
import com.easy.start.dao.MenuMapper;
import com.easy.start.enums.MenuType;
import com.easy.utils.lang.StringUtils;
import com.easy.utils.tree.TreeUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class MenuService extends ServiceImpl<MenuMapper, Menu> {
    private final RoleMenuService roleMenuService;

    public MenuService(RoleMenuService roleMenuService) {
        this.roleMenuService = roleMenuService;
    }

    /**
     * 获取菜单树
     *
     * @param dto {@link MenuListDTO}}
     * @return {@link List<MenuTreeVO>}
     */
    public List<MenuTreeVO> getTreeMenu(MenuListDTO dto) {
        dto.setUserId(StpUtil.getLoginId().toString());
        List<MenuTreeVO> treeList;
        if (StpUtil.getRoleList().contains(Constants.ADMIN_ROLE)) {
            treeList = this.baseMapper.getAllMenuList(dto);
        } else {
            treeList = this.baseMapper.getMenuList(dto);
        }
        return TreeUtils.makeTree(treeList, menu -> menu.getParentId().equals(Constants.ROOT), (parent, child) -> parent.getId().equals(child.getParentId()), MenuTreeVO::setChildren);
    }

    /**
     * 更新菜单
     *
     * @param dto {@link MenuEditDTO}
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateMenu(MenuEditDTO dto) {
        Menu menu = new Menu();
        BeanUtils.copyProperties(dto, menu);
        this.updateById(menu);
    }

    /**
     * 新增菜单
     *
     * @param dto {@link MenuAddDTO}
     */
    @Transactional(rollbackFor = Exception.class)
    public void addMenu(MenuAddDTO dto) {
        Menu menu = new Menu();
        BeanUtils.copyProperties(dto, menu);
        this.save(menu);
    }

    /**
     * 删除菜单
     *
     * @param id id
     */
    @Transactional(rollbackFor = Exception.class)
    public void delMenu(IdDTO id) {
        if (roleMenuService.lambdaQuery().eq(RoleMenu::getMenuId, id.getId()).count() > 0) {
            throw new CustomizeException("菜单已被分配,无法删除");
        }
        if (lambdaQuery().eq(Menu::getParentId, id.getId()).count() > 0) {
            throw new CustomizeException("请先删除子菜单");
        }
        this.removeById(id.getId());
    }

    /**
     * 获取登录用户的菜单列表
     *
     * @return {@link  List< RouterVO >}
     */
    public List<RouterVO> getUserRouter() {
        String userId = StpUtil.getLoginId().toString();
        List<MenuTreeVO> menuList;
        if (StpUtil.getRoleList().contains(Constants.ADMIN_ROLE)) {
            menuList = this.baseMapper.getAllMenuList(new MenuListDTO()).stream().filter(menu -> menu.getMenuType() != MenuType.BUTTON).toList();
        } else {
            menuList = this.baseMapper.getMenuList(new MenuListDTO(userId, null)).stream().filter(menu -> menu.getMenuType() != MenuType.BUTTON).toList();
        }
        List<RouterVO> routerList = buildRouter(menuList);
        return TreeUtils.makeTree(routerList, x -> x.getParentId().equals(Constants.ROOT), (parent, child) -> parent.getId().equals(child.getParentId()), RouterVO::setChildren);
    }

    /**
     * 构建前端路由所需要的数据
     *
     * @param menuList 菜单数据
     * @return {@link List<RouterVO>}
     */
    public List<RouterVO> buildRouter(List<MenuTreeVO> menuList) {
        List<RouterVO> routers = new LinkedList<>();
        for (MenuTreeVO menu : menuList) {
            RouterVO router = new RouterVO();
            router.setId(menu.getId());
            router.setParentId(menu.getParentId());
            router.setPath(getRouterPath(menu));
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
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return 路由地址
     */
    private String getRouterPath(MenuTreeVO menu) {
        return "/" + menu.getPath();
    }

    /**
     * 获取路由名称
     *
     * @param path path
     * @return 路由名称
     */
    private String getRouterName(String path) {
        String replace = path.replace("/", "_");
        return StringUtils.toUnderScoreCase(replace);
    }
}