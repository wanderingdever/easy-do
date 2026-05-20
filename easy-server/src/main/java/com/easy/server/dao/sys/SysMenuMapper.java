package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.server.bean.dto.sys.menu.MenuSearchDTO;
import com.easy.server.bean.entity.sys.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

/**
 * <p>
 * 菜单权限信息 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 获取菜单列表
     *
     * @param dto 查询条件
     * @return 菜单列表
     */
    @SelectProvider(type = SysMenuSqlProvider.class, method = "getMenuList")
    List<SysMenu> getMenuList(@Param("dto") MenuSearchDTO dto);
}