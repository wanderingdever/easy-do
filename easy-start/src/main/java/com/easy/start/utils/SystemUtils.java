package com.easy.start.utils;


import cn.hutool.core.collection.CollUtil;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.entity.sys.SysDictData;
import com.easy.start.bean.entity.sys.SysDictType;
import com.easy.start.bean.vo.sys.config.ConfigVO;
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
        ConfigVO result = null;
        // 获取缓存数据
        List<ConfigVO> configList = getCacheConfigList();
        if (CollUtil.isNotEmpty(configList)) {
            // 筛选
            result = configList.stream().filter(config -> config.getConfigKey().equals(configKey)).findFirst().orElse(null);
        }
        return result;
    }

    public static List<ConfigVO> getCacheConfigList() {
        return RedisUtils.getCacheList(RedisConstants.SYSTEM_CONFIG);
    }


    /**
     * 根据字典类型和字典标签获取值
     *
     * @param dictType  字典类型
     * @param dictLabel 字典标签
     */
    public static String getDictLabel(String dictType, String dictLabel) {
        List<SysDictData> dictList = getDictList(dictType);
        for (SysDictData dict : dictList) {
            if (dict.getDictLabel().equals(dictLabel)) {
                return dict.getDictValue();
            }
        }
        return null;
    }

    /**
     * 根据字典类型获取所有的字典数据
     *
     * @param dictType 字典类型
     */
    public static List<SysDictData> getDictList(String dictType) {
        List<SysDictType> dictList = getCacheDictList();
        if (CollUtil.isEmpty(dictList)) {
            throw new RuntimeException("字典数据为空");
        }
        return dictList.stream().filter(type -> type.getDictType().equals(dictType)).findFirst().orElseThrow(() -> new RuntimeException("字典数据为空")).getDictDataList();
    }


    /**
     * 获取全部字典缓存
     *
     * @return List<SysDictType>
     */
    public static List<SysDictType> getCacheDictList() {
        List<SysDictType> cacheObject = RedisUtils.getCacheList(RedisConstants.SYSTEM_DICT);
        if (CollUtil.isNotEmpty(cacheObject)) {
            return cacheObject;
        }
        return null;
    }
}