package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.server.bean.entity.sys.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色->菜单权限关联表 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

}