package com.easy.start.service.sys;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.datasource.utils.PageUtils;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.sys.config.ConfigSearchDTO;
import com.easy.start.bean.entity.sys.SysConfig;
import com.easy.start.bean.vo.sys.config.ConfigVO;
import com.easy.start.dao.sys.SysConfigMapper;
import com.easy.tool.lang.StringUtils;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 系统参数配置 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SysConfigService extends ServiceImpl<SysConfigMapper, SysConfig> {


    @PostConstruct
    public void loadConfigCache() {
        ConfigSearchDTO dto = new ConfigSearchDTO();
        // 默认缓存系统级别
        dto.setIsSystem(true);
        List<ConfigVO> list = getSysConfigVOList(dto);
        if (CollUtil.isNotEmpty(list)) {
            RedisUtils.setCacheList(RedisConstants.SYSTEM_CONFIG, list);
        }
    }

    /**
     * 获取系统参数配置列表
     *
     * @param dto 搜索参数
     * @return 系统参数配置列表 (VO)
     */
    private List<ConfigVO> getSysConfigVOList(ConfigSearchDTO dto) {
        return baseMapper.selectSysConfigVOList(dto);
    }

    /**
     * 新增系统参数配置
     *
     * @param sysConfig 系统参数配置
     * @return 新增结果
     */
    public boolean addSysConfig(SysConfig sysConfig) {
        // 校验参数键是否存在
        if (lambdaQuery().eq(SysConfig::getConfigKey, sysConfig.getConfigKey()).count() > 0) {
            throw new IllegalArgumentException("参数键已存在");
        }
        return save(sysConfig);
    }

    /**
     * 修改系统参数配置
     *
     * @param sysConfig 系统参数配置
     * @return 修改结果
     */
    public boolean updateSysConfig(SysConfig sysConfig) {
        return updateById(sysConfig);
    }

    /**
     * 删除系统参数配置
     *
     * @param idList 系统参数配置ID集合
     * @return 删除结果
     */
    public boolean deleteSysConfig(List<String> idList) {
        return removeBatchByIds(idList);
    }


    /**
     * 分页查询系统参数配置
     *
     * @param dto 搜索参数
     * @return 分页结果
     */
    public Page<SysConfig> pageSysConfig(ConfigSearchDTO dto) {
        return getSysConfigQueryWrapper(dto).page(PageUtils.getPage(dto));
    }

    /**
     * 根据查询条件查询系统参数集合
     *
     * @param dto 搜索参数
     * @return 系统参数集合
     */
    public List<SysConfig> listSysConfig(ConfigSearchDTO dto) {
        return getSysConfigQueryWrapper(dto).list();
    }

    private LambdaQueryChainWrapper<SysConfig> getSysConfigQueryWrapper(ConfigSearchDTO dto) {
        return lambdaQuery()
                .eq(StringUtils.isNotBlank(dto.getId()), SysConfig::getId, dto.getId())
                .like(StringUtils.isNotBlank(dto.getConfigName()), SysConfig::getConfigName, dto.getConfigName())
                .like(StringUtils.isNotBlank(dto.getConfigKey()), SysConfig::getConfigKey, dto.getConfigKey())
                .eq(dto.getEnable() != null, SysConfig::getEnable, dto.getEnable())
                .eq(dto.getIsSystem() != null, SysConfig::getIsSystem, dto.getIsSystem());
    }

    /**
     * 根据参数键名查询系统参数配置
     *
     * @param configKey 参数键名
     * @return 系统参数配置
     */
    public SysConfig getSysConfigByConfigKey(String configKey) {
        return lambdaQuery().eq(SysConfig::getConfigKey, configKey).eq(SysConfig::getEnable, true).one();
    }

    /**
     * 获取缓存的系统参数配置
     *
     * @param configKey 参数键名
     * @return 系统参数配置
     */
    public SysConfig getCacheSysConfigByConfigKey(String configKey) {
        return RedisUtils.getCacheObject(RedisConstants.SYSTEM_CONFIG + configKey);
    }

}