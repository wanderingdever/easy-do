package com.easy.start.utils;


import cn.hutool.core.bean.BeanUtil;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.entity.Config;
import com.easy.start.bean.vo.config.ConfigVO;
import com.easy.utils.lang.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * 系统参数工具类
 * </p>
 *
 * @author Matt
 */
public class SystemUtils {

    public static String getConfigValue(String configKey) {
        ConfigVO config = getConfig(configKey);
        return config != null ? config.getConfigValue() : null;
    }

    public static String getConfigValueWithThrow(String configKey) {

        String configValue = getConfigValue(configKey);
        if (StringUtils.isBlank(configValue)) {
            throw new CustomizeException("configKey " + configKey + "未查询到结果");
        }
        return configValue;
    }

    public static ConfigVO getConfig(String configKey) {
        ConfigVO result = new ConfigVO();
        // 获取缓存数据
        List<ConfigVO> configList = getCacheConfigList();
        if (CollectionUtils.isNotEmpty(configList)) {
            // 筛选
            result = configList.stream().filter(config -> config.getConfigKey().equals(configKey)).findFirst().orElse(null);
        }
        return result;
    }

    public static List<ConfigVO> getCacheConfigList() {
        List<Config> cacheObject = RedisUtils.getCacheList(RedisConstants.SYSTEM_CONFIG);
        return BeanUtil.copyToList(cacheObject, ConfigVO.class);
    }
}