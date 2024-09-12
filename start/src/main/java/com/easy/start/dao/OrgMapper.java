package com.easy.start.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.start.bean.entity.Org;
import com.easy.start.bean.vo.org.OrgUserTreeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface OrgMapper extends BaseMapper<Org> {

    List<OrgUserTreeVO> selectTheOrgInfoInTheUserOrg();
}