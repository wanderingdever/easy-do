package com.easy.datasource.utils;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.dto.PageDTO;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 分页工具
 * </p>
 *
 * @author Matt
 */
public class PageUtils {

    public static <T> Page<T> getPage(IPage<?> pageInterface, List<T> list) {

        Page<T> page = new Page<>();
        BeanUtils.copyProperties(pageInterface, page);
        page.setRecords(list);
        return page;
    }

    public static <T> Page<T> getPage(IPage<?> pageInterface, Class<T> clazz) {

        Page<T> page = new Page<>();
        BeanUtil.copyProperties(pageInterface, page);
        List<T> list = BeanUtil.copyToList(pageInterface.getRecords(), clazz);
        page.setRecords(list);
        return page;
    }

    public static <T, R> Page<R> getPage(IPage<T> pageInterface, Function<? super T, ? extends R> mapper) {

        Page<R> page = new Page<>();
        BeanUtil.copyProperties(pageInterface, page);
        List<R> collect = pageInterface.getRecords().stream().map(mapper).collect(Collectors.toList());
        page.setRecords(collect);
        return page;
    }

    public static <T> Page<T> getPage(PageDTO dto) {

        Page<T> page = new Page<>();
        page.setSize(dto.getSize());
        page.setCurrent(dto.getCurrent());
        if (dto.getOrders() != null && !dto.getOrders().isEmpty()) {
            page.addOrder(dto.getOrders());
        }
        return page;
    }

    /**
     * 对列表进行分页处理。
     *
     * @param list 原始列表
     * @param dto  分页信息
     * @return 分页后的列表及分页信息
     */
    public static <T> Page<T> paginate(List<T> list, PageDTO dto) {
        Page<T> page = getPage(dto);
        if (list == null || list.isEmpty()) {
            return page;
        }

        // 计算起始索引
        int startIndex = (int) ((dto.getCurrent() - 1) * dto.getSize());
        int endIndex = (int) Math.min(startIndex + dto.getSize(), list.size());

        // 截取列表
        List<T> subList = list.subList(startIndex, endIndex);

        // 计算总页数
        int totalPages = (int) Math.ceil((double) list.size() / dto.getSize());
        page.setPages(totalPages);
        page.setRecords(subList);
        return page;
    }
}