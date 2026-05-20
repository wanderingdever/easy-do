package com.easy.server.dao.sys;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

public class SysUserSqlProvider {

    public String selectUserAndInfo(@Param("userId") String userId) {
        SQL sql = new SQL();
        sql.SELECT("u.id AS userId, u.username AS username, u.email AS email, CONCAT(phone_prefix, '****', phone_suffix) AS phone, u.client AS client, u.`status` AS status, u.create_time AS createTime");
        sql.SELECT("ui.id  AS userInfoId, ui.avatar AS avatar, ui.nickname AS nickname, ui.sex  AS sex");
        sql.FROM("sys_user u");
        sql.LEFT_OUTER_JOIN("sys_user_info ui on u.id = ui.user_id");
        sql.WHERE("u.id = #{userId}");
        return sql.toString();
    }
}
