package com.easy.server.dao.sys;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.utils.PageUtils;
import com.easy.server.bean.dto.sys.api.ApiManageDTO;
import com.easy.server.bean.entity.sys.OpenApiAuth;
import com.easy.server.bean.entity.sys.OpenApiList;
import com.easy.server.service.sys.OpenApiAuthService;
import com.easy.server.service.sys.OpenApiListService;
import com.easy.tool.lang.StringUtils;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class OpenApiManageService {

    private final OpenApiListService openApiListService;
    private final OpenApiAuthService openApiAuthService;

    public List<OpenApiList> getAllApis(ApiManageDTO dto) {
        return openApiListService.lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getApiName()), OpenApiList::getApiName, dto.getApiName())
                .like(StringUtils.isNotBlank(dto.getApiUrl()), OpenApiList::getApiUrl, dto.getApiUrl())
                .eq(StringUtils.isNotNull(dto.getEnable()), OpenApiList::getEnable, dto.getEnable())
                .list();
    }

    public OpenApiList getApiById(String id) {
        return openApiListService.getById(id);
    }

    public void addApi(OpenApiList apiInfo) {
        openApiListService.save(apiInfo);
    }

    public void updateApi(OpenApiList apiInfo) {
        openApiListService.updateById(apiInfo);
    }

    public void deleteApi(String id) {
        // FIXME 需要先查询授权，没有授权才能删除
        List<OpenApiAuth> list = openApiAuthService.lambdaQuery().eq(OpenApiAuth::getApiId, id).list();
        if (list != null && !list.isEmpty()) {
            Set<String> userIdSet = list.stream().map(OpenApiAuth::getUserId).collect(Collectors.toSet());
            throw new RuntimeException("该接口已授权，请先取消授权，关联用户ID: " + userIdSet);
        }
        openApiListService.removeById(id);
    }

    public Page<OpenApiList> page(ApiManageDTO dto) {

        return openApiListService.lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getApiName()), OpenApiList::getApiName, dto.getApiName())
                .like(StringUtils.isNotBlank(dto.getApiUrl()), OpenApiList::getApiUrl, dto.getApiUrl())
                .eq(StringUtils.isNotNull(dto.getEnable()), OpenApiList::getEnable, dto.getEnable())
                .page(PageUtils.getPage(dto));
    }

    public List<OpenApiList> getUserApi(@NotBlank(message = "userId不能为空") String userId) {
        List<OpenApiAuth> list = openApiAuthService.lambdaQuery().eq(OpenApiAuth::getUserId, userId).list();
        if (list == null || list.isEmpty()) {
            return null;
        }
        List<String> apiIdList = list.stream().map(OpenApiAuth::getApiId).toList();
        return openApiListService.lambdaQuery().in(OpenApiList::getId, apiIdList).list();
    }
}