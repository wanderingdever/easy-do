package com.easy.start.dao.sys;

import com.easy.start.bean.dto.sys.config.ConfigSearchDTO;
import com.easy.tool.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

/**
 * 参数配置sql
 * </p>
 *
 * @author Matt
 */
public class SysConfigSqlProvider {

    /**
     * 查询参数配置列表
     *
     * @param dto 参数配置查询dto
     * @return 参数配置sql
     */
    public String selectSysConfigVOList(@Param("dto") ConfigSearchDTO dto) {
        SQL sql = new SQL();
        sql.SELECT("t.id, t.config_name, t.config_key, t.config_value, t.is_system, t.enable, t.create_time, t.update_time");
        sql.FROM("sys_config t");
        if (StringUtils.isNotBlank(dto.getId())) {
            sql.WHERE("t.id = #{dto.id}");
        }
        if (StringUtils.isNotBlank(dto.getConfigName())) {
            sql.WHERE("t.config_name like concat('%', #{dto.configName}, '%')");
        }
        if (StringUtils.isNotBlank(dto.getConfigKey())) {
            sql.WHERE("t.config_key like concat('%', #{dto.configKey}, '%')");
        }
        if (dto.getIsSystem() != null) {
            sql.WHERE("t.is_system = #{dto.isSystem}");
        }
        if (dto.getEnable() != null) {
            sql.WHERE("t.enable = #{dto.enable}");
        }
        sql.ORDER_BY("t.update_time desc");
        return sql.toString();
    }
}