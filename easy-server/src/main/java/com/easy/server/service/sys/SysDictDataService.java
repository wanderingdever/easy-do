package com.easy.server.service.sys;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.datasource.utils.PageUtils;
import com.easy.server.bean.dto.sys.dict.DictSearchDTO;
import com.easy.server.bean.entity.sys.SysDictData;
import com.easy.server.dao.sys.SysDictDataMapper;
import com.easy.tool.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 字典数据 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
public class SysDictDataService extends ServiceImpl<SysDictDataMapper, SysDictData> {


    /**
     * 新增字典数据
     *
     * @param sysDictData 字典数据
     */
    public void addDictData(SysDictData sysDictData) {
        this.save(sysDictData);
    }

    /**
     * 修改字典数据
     *
     * @param sysDictData 字典数据
     */
    public void updateDictData(SysDictData sysDictData) {
        this.updateById(sysDictData);
    }

    /**
     * 删除字典数据
     *
     * @param ids 字典数据ID
     */
    public void deleteDictData(List<String> ids) {
        this.removeBatchByIds(ids);
    }

    /**
     * 分页查询字典数据
     *
     * @param dto 分页查询参数
     * @return 结果
     */
    public Page<SysDictData> pageDictData(DictSearchDTO dto) {
        return lambdaQuery()
                .eq(StringUtils.isNotBlank(dto.getDictTypeId()), SysDictData::getDictTypeId, dto.getDictTypeId())
                .like(StringUtils.isNotBlank(dto.getDictLabel()), SysDictData::getDictLabel, dto.getDictLabel())
                .eq(dto.getEnable() != null, SysDictData::getEnable, dto.getEnable())
                .page(PageUtils.getPage(dto));

    }
}