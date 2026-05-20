package com.easy.server.service.sys;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.redis.constant.SystemConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.bean.dto.sys.dict.DictSearchDTO;
import com.easy.server.bean.entity.sys.SysDictData;
import com.easy.server.bean.entity.sys.SysDictType;
import com.easy.server.dao.sys.SysDictTypeMapper;
import com.easy.tool.lang.StringUtils;
import jakarta.annotation.PostConstruct;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * <p>
 * 字典类型 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@AllArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class SysDictTypeService extends ServiceImpl<SysDictTypeMapper, SysDictType> {

    private final SysDictDataService dictDataService;

    /**
     * 初始化系统启用字典到缓存
     */
    @PostConstruct
    public void loadingDictCache() {
        DictSearchDTO dto = new DictSearchDTO();
        dto.setEnable(true);
        dto.setIsSystem(true);
        List<SysDictType> dictTypeList = getTypeAndDataList(dto);
        if (CollUtil.isNotEmpty(dictTypeList)) {
            // 设置缓存
            RedisUtils.setCacheNewList(SystemConstants.SYSTEM_DICT, dictTypeList);
        }
    }


    /**
     * 获取字典集合-包含dict data数据
     *
     * @param search 查询条件
     * @return {@link List<SysDictType>}
     */
    public List<SysDictType> getTypeAndDataList(DictSearchDTO search) {
        // 查询出字典类型
        List<SysDictType> dictTypeList = lambdaQuery()
                .like(StringUtils.isNotBlank(search.getDictName()), SysDictType::getDictName, search.getDictName())
                .eq(StringUtils.isNotBlank(search.getDictType()), SysDictType::getDictType, search.getDictType())
                .eq(search.getIsSystem() != null, SysDictType::getIsSystem, search.getIsSystem())
                .eq(search.getEnable() != null, SysDictType::getEnable, search.getEnable())
                .list();
        if (CollUtil.isEmpty(dictTypeList)) {
            return null;
        }
        // 查询出所有关联的data
        LambdaQueryWrapper<SysDictData> dictDataQueryWrapper = new LambdaQueryWrapper<>();
        dictDataQueryWrapper.in(SysDictData::getDictTypeId, dictTypeList.stream().map(SysDictType::getId).collect(Collectors.toList()));
        List<SysDictData> dictDataList = dictDataService.list(dictDataQueryWrapper);
        // 组装数据
        dictTypeList.forEach(type ->
                type.setDictDataList(dictDataList.stream().filter(data ->
                        data.getDictTypeId().equals(type.getId())).collect(Collectors.toList())));
        return dictTypeList;
    }

    /**
     * 新增字典类型
     *
     * @param sysDictType 字典类型
     */
    public void addDictType(SysDictType sysDictType) {
        save(sysDictType);
    }

    /**
     * 修改字典类型
     *
     * @param sysDictType 字典类型
     */
    public void updateDictType(SysDictType sysDictType) {
        updateById(sysDictType);
    }

    /**
     * 删除字典类型
     *
     * @param dictId 字典类型ID
     */
    public void deleteDictType(String dictId) {
        // 获取type
        SysDictType dictType = this.getById(dictId);
        // 查询出所有关联的data
        LambdaQueryWrapper<SysDictData> dictDataRmQueryWrapper = new LambdaQueryWrapper<>();
        dictDataRmQueryWrapper.eq(SysDictData::getDictTypeId, dictType.getId());
        if (dictDataService.lambdaQuery().eq(SysDictData::getDictTypeId, dictType.getId()).count() > 0) {
            throw new CustomizeException(String.format("%1$s已分配数据,不能删除", dictType.getDictName()));
        } else {
            // 删除字典类型
            this.removeById(dictId);
        }
    }

    /**
     * 分页查询字典类型
     *
     * @param dto 分页查询参数
     * @return 结果
     */
    public Page<SysDictType> pageDictType(DictSearchDTO dto) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getDictName()), SysDictType::getDictName, dto.getDictName())
                .like(StringUtils.isNotBlank(dto.getDictType()), SysDictType::getDictType, dto.getDictType())
                .eq(dto.getEnable() != null, SysDictType::getEnable, dto.getEnable())
                .eq(dto.getIsSystem() != null, SysDictType::getIsSystem, dto.getIsSystem())
                .page(PageUtils.getPage(dto));
    }

    /**
     * 更具字典类型ID获取字典类型和下属数据
     *
     * @param id 字典类型ID
     * @return {@link SysDictType}
     */
    public SysDictType getDictTypeInfoById(String id) {
        SysDictType dictType = this.baseMapper.selectById(id);
        if (dictType == null) {
            return null;
        }
        // 获取字典数据
        List<SysDictData> dataList = dictDataService.lambdaQuery().eq(SysDictData::getDictTypeId, dictType.getId()).list();
        dictType.setDictDataList(dataList);
        return dictType;
    }


    /**
     * 获取缓存的字典数据
     *
     * @return {@link List<SysDictType>}
     */
    public List<SysDictType> getCacheDictList() {
        List<SysDictType> cacheList = RedisUtils.getCacheList(SystemConstants.SYSTEM_DICT);
        if (CollUtil.isEmpty(cacheList)) {
            return cacheList;
        }
        return null;
    }


    /**
     * 根据字典类型从缓存获取字典
     *
     * @param dictType 字典类型
     * @return {@link SysDictType}
     */
    public SysDictType getDictByDictTypeFromCache(String dictType) {
        // 获取缓存
        List<SysDictType> dictDataCacheList = getCacheDictList();
        // 缓存没有获取到就查询数据库
        if (CollUtil.isEmpty(dictDataCacheList)) {
            DictSearchDTO search = new DictSearchDTO();
            search.setEnable(true);
            search.setIsSystem(true);
            search.setDictType(dictType);
            dictDataCacheList = getTypeAndDataList(search);
        }
        // 筛选
        Optional<SysDictType> first = dictDataCacheList.parallelStream().filter(dict -> dict.getDictType().equals(dictType)).findFirst();
        return first.orElse(null);
    }
}