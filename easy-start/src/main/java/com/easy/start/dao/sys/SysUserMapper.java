package com.easy.start.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.start.bean.entity.sys.SysUser;
import com.easy.start.bean.vo.sys.user.UserExpandVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

/**
 * <p>
 * 账号信息 Mapper 接口
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 根据ID查询用户信息
     *
     * @param userId 登录ID
     * @return 用户信息
     */
    @SelectProvider(type = SysUserSqlProvider.class, method = "selectUserAndInfo")
    UserExpandVO selectUserAndInfo(@Param("userId") String userId);
}