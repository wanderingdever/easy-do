package com.easy.start.service.sys;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.base.dto.IdDTO;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.start.bean.dto.sys.role.RoleDTO;
import com.easy.start.bean.dto.sys.role.RoleEditDTO;
import com.easy.start.bean.dto.sys.role.RoleSearchDTO;
import com.easy.start.bean.entity.sys.SysRole;
import com.easy.start.bean.entity.sys.SysRoleMenu;
import com.easy.start.bean.entity.sys.SysUserRole;
import com.easy.start.bean.vo.sys.UserRoleAndPermissionVO;
import com.easy.start.dao.sys.SysRoleMapper;
import com.easy.tool.lang.StringUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 角色信息 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@AllArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class SysRoleService extends ServiceImpl<SysRoleMapper, SysRole> {

    private final SysUserRoleService userRoleService;
    private final SysMenuService menuService;
    private final SysRoleMenuService roleMenuService;

    /**
     * 新增角色
     *
     * @param dto 角色信息
     */
    public void addRole(RoleDTO dto) {
        SysRole sysRole = BeanUtil.copyProperties(dto, SysRole.class);
        save(sysRole);
        // 新增角色菜单关联
        saveOrUpdateRoleMenu(sysRole.getId(), dto.getMenuList());
    }

    /**
     * 构建角色菜单关联实体集合
     *
     * @param roleId  角色ID
     * @param menuIdS 菜单ID数组
     * @return List<RoleMenu>
     */
    public List<SysRoleMenu> getRoleMenuList(String roleId, List<String> menuIdS) {
        if (CollUtil.isEmpty(menuIdS)) {
            return null;
        }
        List<SysRoleMenu> roleMenuList = new ArrayList<>();
        menuIdS.forEach(menuId -> {
            SysRoleMenu roleMenu = new SysRoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenuList.add(roleMenu);
        });
        return roleMenuList;
    }


    /**
     * 修改角色
     *
     * @param dto 角色信息
     */
    public void updateRole(RoleEditDTO dto) {
        SysRole sysRole = BeanUtil.copyProperties(dto, SysRole.class);
        updateById(sysRole);
        // 更新角色菜单关联
        saveOrUpdateRoleMenu(dto.getId(), dto.getMenuList());
    }

    /**
     * 删除角色
     *
     * @param roleId 角色ID
     */
    public void deleteRole(String roleId) {
        long userRole = userRoleService.lambdaQuery().eq(SysUserRole::getRoleId, roleId).count();
        if (userRole > 0) {
            throw new CustomizeException("所选角色已被分配,无法删除");
        } else {
            // 删除角色
            this.removeById(roleId);
            // 删除角色菜单关联
            roleMenuService.lambdaUpdate()
                    .eq(SysRoleMenu::getRoleId, roleId)
                    .remove();
        }
        removeById(roleId);
    }

    public Page<SysRole> pageRole(RoleSearchDTO dto) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getRoleName()), SysRole::getRoleName, dto.getRoleName())
                .like(StringUtils.isNotBlank(dto.getRoleKey()), SysRole::getRoleKey, dto.getRoleKey())
                .eq(dto.getAuthorityLevel() != null, SysRole::getAuthorityLevel, dto.getAuthorityLevel())
                .eq(dto.getEnable() != null, SysRole::getEnable, dto.getEnable())
                .page(PageUtils.getPage(dto));
    }

    /**
     * 根据用户ID获取用户的角色列表KEY
     *
     * @param userId 用户ID
     * @return {@link  List <String>} 用户的角色key
     */
    public UserRoleAndPermissionVO getUserRoleKeyList(String userId) {
        // 查询用户角色关联
        List<SysUserRole> userRoleList = userRoleService.lambdaQuery().eq(SysUserRole::getUserId, userId).list();
        if (CollUtil.isEmpty(userRoleList)) {
            return null;
        }
        // 查询role id
        List<String> roleIdList = userRoleList.stream().map(SysUserRole::getRoleId).toList();
        // 查询权限集合
        List<String> permissions = menuService.getPermissionByRoleId(roleIdList);
        // 查询角色key集合
        List<SysRole> roles = baseMapper.selectByIds(roleIdList);
        return new UserRoleAndPermissionVO(roles, permissions);
    }

    /**
     * 构建并保存角色菜单关联信息
     *
     * @param roleId  角色id
     * @param menuIdS 菜单ID数组
     */
    private void saveOrUpdateRoleMenu(String roleId, List<String> menuIdS) {
        // 更新角色菜单关联
        roleMenuService.lambdaUpdate()
                .eq(SysRoleMenu::getRoleId, roleId)
                .remove();
        List<SysRoleMenu> roleMenuList = getRoleMenuList(roleId, menuIdS);
        roleMenuService.saveBatch(roleMenuList);
    }

    public List<String> roleMenuIds(IdDTO dto) {
        List<SysRoleMenu> list = roleMenuService.lambdaQuery().eq(SysRoleMenu::getRoleId, dto.getId()).list();
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return list.stream().map(SysRoleMenu::getMenuId).collect(Collectors.toList());
    }
}