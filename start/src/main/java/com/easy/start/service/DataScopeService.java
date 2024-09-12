package com.easy.start.service;


import com.easy.start.utils.TempCacheUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@Service("dataScopeService")
public class DataScopeService {


    private final UserService serService;

    public DataScopeService(UserService serService) {
        this.serService = serService;
    }

    public List<String> authorizedOrgIdListOneSelf() {
        List<String> orgIdList = TempCacheUtil.getShortTimeCache(serService::authorizedOrgIdListOneSelf);
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }

    public List<String> authorizedOrgIdList() {

        List<String> orgIdList = TempCacheUtil.getShortTimeCache(() -> serService.authorizedOrgIdList());
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }
}