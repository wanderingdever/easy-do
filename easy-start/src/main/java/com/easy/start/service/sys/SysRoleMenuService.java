package com.easy.start.service.sys;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.entity.sys.SysRoleMenu;
import com.easy.start.dao.sys.SysRoleMenuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色->菜单权限关联表 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@AllArgsConstructor
public class SysRoleMenuService extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> {

}