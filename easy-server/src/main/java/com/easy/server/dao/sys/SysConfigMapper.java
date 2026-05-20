package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.server.bean.dto.sys.config.ConfigSearchDTO;
import com.easy.server.bean.entity.sys.SysConfig;
import com.easy.server.bean.vo.sys.config.ConfigVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

/**
 * <p>
 * 系统参数配置 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Mapper
public interface SysConfigMapper extends BaseMapper<SysConfig> {

    @SelectProvider(type = SysConfigSqlProvider.class, method = "selectSysConfigVOList")
    List<ConfigVO> selectSysConfigVOList(@Param("dto") ConfigSearchDTO dto);
}