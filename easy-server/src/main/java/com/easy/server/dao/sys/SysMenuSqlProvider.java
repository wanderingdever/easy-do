package com.easy.server.dao.sys;

import cn.hutool.core.collection.CollUtil;
import com.easy.server.bean.dto.sys.menu.MenuSearchDTO;
import com.easy.tool.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

public class SysMenuSqlProvider {


    public String getMenuList(@Param("dto") MenuSearchDTO dto) {
        SQL sql = new SQL();
        sql.SELECT("m.*");
        sql.FROM("sys_menu m");
        sql.LEFT_OUTER_JOIN("sys_role_menu rm ON rm.menu_id = m.id ");
        sql.LEFT_OUTER_JOIN("sys_user_role ur ON ur.role_id = rm.role_id ");
        sql.ORDER_BY("m.order_num");
        if (StringUtils.isNotBlank(dto.getUserId())) {
            sql.WHERE("ur.user_id = #{dto.userId}");
        }
        if (StringUtils.isNotBlank(dto.getMenuName())) {
            sql.WHERE("m.menu_name LIKE  CONCAT('%', #{dto.menuName}, '%') ");
        }
        if (CollUtil.isNotEmpty(dto.getMenuType())) {
            sql.WHERE("m.menu_type IN ( " + String.join(",", dto.getMenuType().stream().map(s -> "'" + s.getValue() + "'").toList()) + ") ");
        }
        return sql.toString();
    }
}
