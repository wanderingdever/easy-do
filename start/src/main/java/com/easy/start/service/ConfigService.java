package com.easy.start.service;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.datasource.utils.PageUtils;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.config.ConfigAddDTO;
import com.easy.start.bean.dto.config.ConfigEditDTO;
import com.easy.start.bean.dto.config.ConfigSearchDTO;
import com.easy.start.bean.entity.Config;
import com.easy.start.bean.vo.config.ConfigVO;
import com.easy.start.dao.ConfigMapper;
import com.easy.start.utils.SystemUtils;
import com.easy.utils.json.JacksonUtils;
import com.easy.utils.lang.CollectionUtils;
import com.easy.utils.lang.StringUtils;
import jakarta.annotation.PostConstruct;
import jodd.util.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统参数配置
 * </p>
 *
 * @author Matt
 */
@Service
public class ConfigService extends ServiceImpl<ConfigMapper, Config> {


    /**
     * 缓存系统参数配置
     */
    @PostConstruct
    public void loadConfigCache() {
        ConfigSearchDTO dto = new ConfigSearchDTO();
        // 默认缓存系统级别
        dto.setIsSystem(true);
        List<Config> list = getList(dto);
        if (CollectionUtils.isNotEmpty(list)) {
            RedisUtils.setCacheObject(RedisConstants.SYSTEM_CONFIG, JacksonUtils.toJsonString(list));
        }
    }

    /**
     * 查询集合
     *
     * @param dto 入参
     * @return List<Config> {@link Config}
     */
    public List<Config> getList(ConfigSearchDTO dto) {
        LambdaQueryWrapper<Config> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StringUtil.isNotBlank(dto.getConfigName()), Config::getConfigName, dto.getConfigName())
                .eq(StringUtils.isNotBlank(dto.getConfigKey()), Config::getConfigKey, dto.getConfigKey())
                .eq(StringUtils.isNotNull(dto.getIsSystem()), Config::getIsSystem, dto.getIsSystem());
        return baseMapper.selectList(queryWrapper);
    }

    public Page<Config> pageConfig(ConfigSearchDTO dto) {
        return lambdaQuery().like(StringUtils.isNotBlank(dto.getConfigName()), Config::getConfigName, dto.getConfigName())
                .like(StringUtils.isNotBlank(dto.getConfigKey()), Config::getConfigKey, dto.getConfigKey())
                .eq(StringUtils.isNotNull(dto.getIsSystem()), Config::getIsSystem, dto.getIsSystem())
                .page(PageUtils.getPage(dto));
    }

    /**
     * 新增参数配置
     *
     * @param dto 入参
     */
    @Transactional(rollbackFor = Exception.class)
    public void addConfig(ConfigAddDTO dto) {
        Config newConfig = new Config();
        newConfig.setConfigName(dto.getConfigName());
        newConfig.setConfigKey(dto.getConfigKey());
        newConfig.setConfigValue(dto.getConfigValue());
        newConfig.setIsSystem(dto.getIsSystem());
        this.save(newConfig);
        // 更新系统参数缓存
        if (dto.getIsSystem()) {
            loadConfigCache();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateConfig(ConfigEditDTO config) {
        Config newConfig = new Config();
        BeanUtils.copyProperties(config, newConfig);
        this.updateById(newConfig);
    }

    @Transactional(rollbackFor = Exception.class)
    public void delConfig(List<String> ids) {
        this.removeByIds(ids);
    }

    /**
     * 获取参数配置
     *
     * @param configKey key
     * @return {@link ConfigVO}
     */
    public ConfigVO getConfig(String configKey) {
        ConfigVO result = new ConfigVO();
        // 获取缓存数据
        List<ConfigVO> configList = getCacheConfigList();
        if (CollectionUtils.isNotEmpty(configList)) {
            // 筛选
            result = configList.stream().filter(config -> config.getConfigKey().equals(configKey)).findFirst().orElse(null);
        }
        // 未筛选到就查询数据库
        if (result == null) {
            LambdaQueryWrapper<Config> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Config::getConfigKey, configKey);
            Config selectOne = baseMapper.selectOne(queryWrapper);
            if (selectOne != null) {
                BeanUtil.copyProperties(selectOne, result);
            }
        }
        return result;
    }

    public List<ConfigVO> getCacheConfigList() {
        return SystemUtils.getCacheConfigList();
    }
}