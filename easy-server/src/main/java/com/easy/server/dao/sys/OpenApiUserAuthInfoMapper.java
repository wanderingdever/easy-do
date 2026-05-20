package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.server.bean.entity.sys.OpenApiUserAuthInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户api授权信息 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Mapper
public interface OpenApiUserAuthInfoMapper extends BaseMapper<OpenApiUserAuthInfo> {

}