package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.server.bean.entity.sys.OpenApiRequestLogs;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 开放api请求日志 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Mapper
public interface OpenApiRequestLogsMapper extends BaseMapper<OpenApiRequestLogs> {

}