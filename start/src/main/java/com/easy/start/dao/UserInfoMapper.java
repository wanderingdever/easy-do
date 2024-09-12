package com.easy.start.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.start.bean.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    @Select("SELECT id FROM sys_user_info WHERE del = 0 AND user_id = #{userId} LIMIT 1")
    String getIdByUserId(@Param("userId") String userId);
}