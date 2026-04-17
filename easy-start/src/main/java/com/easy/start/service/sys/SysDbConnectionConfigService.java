package com.easy.start.service.sys;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.start.bean.dto.sys.db.DbDTO;
import com.easy.start.bean.dto.sys.db.DbSearchDTO;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.dao.sys.SysDbConnectionConfigMapper;
import com.easy.tool.lang.StringUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 数据库连接配置服务实现类
 * </p>
 * 提供数据库连接配置的增删改查业务逻辑
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class SysDbConnectionConfigService extends ServiceImpl<SysDbConnectionConfigMapper, SysDbConnectionConfig> {

    /**
     * 分页查询数据库连接配置
     *
     * @param searchDTO 查询条件
     * @return 分页数据
     */
    public Page<SysDbConnectionConfig> pageDb(DbSearchDTO searchDTO) {
        // 构建分页查询条件
        return lambdaQuery()
                .eq(StringUtils.isNotBlank(searchDTO.getId()), SysDbConnectionConfig::getId, searchDTO.getId())
                .like(StringUtils.isNotBlank(searchDTO.getHost()), SysDbConnectionConfig::getHost, searchDTO.getHost())
                .like(StringUtils.isNotBlank(searchDTO.getDbName()), SysDbConnectionConfig::getDatabaseName, searchDTO.getDbName())
                .like(StringUtils.isNotBlank(searchDTO.getDbKey()), SysDbConnectionConfig::getSecretKey, searchDTO.getDbKey())
                .eq(searchDTO.getEnable() != null, SysDbConnectionConfig::getEnabled, searchDTO.getEnable())
                .page(PageUtils.getPage(searchDTO));
    }

    /**
     * 新增数据库连接配置
     *
     * @param dto 数据库连接配置信息
     * @return 新增成功的配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public String addDb(DbDTO dto) {
        // 校验：新增操作id必须为空
        if (StringUtils.isNotBlank(dto.getId())) {
            throw new CustomizeException("新增操作不能指定ID");
        }

        // 校验secretKey是否已存在
        long count = lambdaQuery()
                .eq(SysDbConnectionConfig::getSecretKey, dto.getSecretKey())
                .count();
        if (count > 0) {
            throw new CustomizeException("数据库连接配置ID已存在");
        }

        // 创建实体并保存
        SysDbConnectionConfig entity = new SysDbConnectionConfig();
        BeanUtil.copyProperties(dto, entity);
        save(entity);

        return entity.getId();
    }

    /**
     * 更新数据库连接配置
     *
     * @param dto 数据库连接配置信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDb(DbDTO dto) {
        // 校验：更新操作id不能为空
        if (StringUtils.isBlank(dto.getId())) {
            throw new CustomizeException("更新操作ID不能为空");
        }

        // 校验数据是否存在
        SysDbConnectionConfig existing = getById(dto.getId());
        if (existing == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }
        // 更新实体
        SysDbConnectionConfig entity = new SysDbConnectionConfig();
        BeanUtil.copyProperties(dto, entity);
        updateById(entity);
    }

    /**
     * 删除数据库连接配置
     *
     * @param id 配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteDb(String id) {
        // 校验数据是否存在
        SysDbConnectionConfig existing = getById(id);
        if (existing == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }

        // 删除数据
        removeById(id);
    }

    /**
     * 批量删除数据库连接配置
     *
     * @param idList 配置ID列表
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatch(List<String> idList) {
        // 批量删除
        removeByIds(idList);
    }

    /**
     * 根据ID查询数据库连接配置详情
     *
     * @param id 配置ID
     * @return 数据库连接配置详情
     */
    public SysDbConnectionConfig getDbById(String id) {
        SysDbConnectionConfig config = getById(id);
        if (config == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }
        return config;
    }
}
