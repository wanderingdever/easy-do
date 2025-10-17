package com.easy.start.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.start.bean.entity.sys.SysUserOrg;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户->机构关联 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Mapper
public interface SysUserOrgMapper extends BaseMapper<SysUserOrg> {

}