package com.easy.start.service.sys;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.start.bean.dto.sys.org.OrgDTO;
import com.easy.start.bean.dto.sys.org.OrgEditDTO;
import com.easy.start.bean.entity.sys.SysOrg;
import com.easy.start.bean.entity.sys.SysOrgInfo;
import com.easy.start.bean.entity.sys.SysUserOrg;
import com.easy.start.dao.sys.SysOrgMapper;
import com.easy.tool.tree.TreeUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * <p>
 * 机构基本信息 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@AllArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class SysOrgService extends ServiceImpl<SysOrgMapper, SysOrg> {

    private final SysUserOrgService userOrgService;
    private final SysOrgInfoService orgInfoService;

    /**
     * 新增机构
     *
     * @param dto 机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void addOrg(OrgDTO dto) {
        SysOrg sysOrg = BeanUtil.copyProperties(dto, SysOrg.class);
        this.save(sysOrg);

        SysOrgInfo sysOrgInfo = BeanUtil.copyProperties(dto, SysOrgInfo.class);
        sysOrgInfo.setOrgId(sysOrg.getId());
        orgInfoService.save(sysOrgInfo);
    }

    /**
     * 修改机构
     *
     * @param dto 机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateOrg(OrgEditDTO dto) {
        SysOrg sysOrg = BeanUtil.copyProperties(dto, SysOrg.class);
        this.updateById(sysOrg);

        SysOrgInfo sysOrgInfo = BeanUtil.copyProperties(dto, SysOrgInfo.class);
        sysOrgInfo.setOrgId(sysOrg.getId());
        orgInfoService.updateById(sysOrgInfo);
    }

    /**
     * 删除机构
     *
     * @param orgId 机构ID
     * @return 结果
     */
    public boolean deleteOrg(String orgId) {
        Long child = lambdaQuery().in(SysOrg::getParentId, orgId).count();
        if (child > 0) {
            throw new CustomizeException("所选组织存在下级组织,无法被删除");
        }
        Long user = userOrgService.lambdaQuery().in(SysUserOrg::getOrgId, orgId).count();
        if (user > 0) {
            throw new CustomizeException("所选组织已与用户关联,无法被删除");
        }
        return removeById(orgId);
    }


    public List<SysOrg> getOrg(List<String> idList) {
        HashSet<String> idSet = new HashSet<>(idList);
        List<SysOrg> list = lambdaQuery()
                .in(SysOrg::getId, idSet)
                .list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("组织不存在");
        }
        return list;
    }

    /**
     * 构建详细数据的机构树形
     *
     * @return {@link List<SysOrg>}
     */
    public List<SysOrg> treeOrg() {
        LambdaQueryWrapper<SysOrg> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.orderByAsc(SysOrg::getOrgSort);
        List<SysOrg> list = list(lambdaQueryWrapper);
        if (CollUtil.isEmpty(list)) {
            return new ArrayList<>();
        }
        return TreeUtils.makeTree(list, x -> "0".equals(x.getParentId()), (x, y) -> x.getId().equals(y.getParentId()), SysOrg::setChildren);
    }

}