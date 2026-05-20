package com.easy.server.service.sys;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.client.constant.ApiConstants;
import com.easy.client.utils.ApiSignUtils;
import com.easy.client.utils.SM2KeyPair;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.bean.entity.sys.OpenApiAuth;
import com.easy.server.bean.entity.sys.OpenApiList;
import com.easy.server.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.server.dao.sys.OpenApiUserAuthInfoMapper;
import com.easy.server.enums.ApiAuthStatus;
import com.easy.tool.lang.IdUtils;
import jakarta.annotation.PostConstruct;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 用户api授权信息 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Service
@AllArgsConstructor
public class OpenApiUserAuthInfoService extends ServiceImpl<OpenApiUserAuthInfoMapper, OpenApiUserAuthInfo> {

    private final OpenApiAuthService openApiAuthService;
    private final OpenApiListService openApiListService;


    /**
     * 初始化所有的appid到redis
     */
    @PostConstruct
    public void initAppid() {
        List<OpenApiUserAuthInfo> list = this.lambdaQuery().eq(OpenApiUserAuthInfo::getStatus, ApiAuthStatus.AUTHORIZED).list();
        if (list == null || list.isEmpty()) {
            return;
        }
        for (OpenApiUserAuthInfo userApiAuthInfo : list) {
            List<OpenApiList> appidApiList = new ArrayList<>();
            appidApiList.add(new OpenApiList("测试接口", "/api/test", 100, true));
            List<OpenApiList> authList = getAppidApiList(userApiAuthInfo.getAppid());
            if (authList != null && !authList.isEmpty()) {
                appidApiList.addAll(authList);
            }
            // 默认增加测试接口
            userApiAuthInfo.setOpenApiList(appidApiList);
            RedisUtils.setCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + userApiAuthInfo.getAppid(), userApiAuthInfo);
        }
    }

    /***
     * 查询用户api授权信息
     * @param userId 用户id
     * @return 用户api授权信息
     */
    public OpenApiUserAuthInfo getUserApiAuthInfo(String userId) {
        OpenApiUserAuthInfo one = this.lambdaQuery().eq(OpenApiUserAuthInfo::getUserId, userId).one();
        if (one == null) {
            return null;
        }
        if (one.getStatus() != ApiAuthStatus.AUTHORIZED) {
            throw new CustomizeException("用户授权状态异常:" + one.getStatus().getDesc());
        }
        one.setOpenApiList(getAppidApiList(one.getAppid()));
        return one;
    }


    /**
     * 授权给用户api权限
     *
     * @param userId 用户id
     */
    @Transactional(rollbackFor = Exception.class)
    public void grantUserApiPermission(String userId) {
        // 1. 生成aeskey和aesiv
        String[] strings = ApiSignUtils.generateAesKeyAndIv();
        // 2. 生成sm2密钥对
        SM2KeyPair sm2KeyPair = ApiSignUtils.generateSM2KeyPair();
        // 3. 生成appid
        String appid = getAppid();

        OpenApiUserAuthInfo userApiAuthInfo = new OpenApiUserAuthInfo();
        userApiAuthInfo.setUserId(userId);
        userApiAuthInfo.setAppid(appid);
        userApiAuthInfo.setAesKey(strings[0]);
        userApiAuthInfo.setAesIv(strings[1]);
        userApiAuthInfo.setSm2PrivateKey(sm2KeyPair.getPrivateKey());
        userApiAuthInfo.setSm2PublicKey(sm2KeyPair.getPublicKey());
        userApiAuthInfo.setStatus(ApiAuthStatus.AUTHORIZED);
        this.save(userApiAuthInfo);
        // 4. 放入redis
        RedisUtils.setCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + appid, userApiAuthInfo);
    }


    /**
     * 从redis获取一个appid，如果没有就生成一批appid放入redis
     */
    public String getAppid() {
        // 1. 从redis获取一个appid，如果没有就生成一批appid放入redis
        Set<String> appidList = RedisUtils.getCacheSet(ApiConstants.APPID_REDIS_KEY);
        if (appidList == null || appidList.isEmpty()) {
            appidList = generateAppid();
            RedisUtils.setCacheSet(ApiConstants.APPID_REDIS_KEY, appidList);
        }
        String appid = appidList.iterator().next();
        appidList.remove(appid);
        RedisUtils.setCacheNewSet(ApiConstants.APPID_REDIS_KEY, appidList);
        return appid;
    }

    /**
     * 批量生成一批appid，查询数据库有没有，如果存在就移除，返回不存在的。
     */
    private Set<String> generateAppid() {
        Set<String> appidSet = new LinkedHashSet<>();
        // 1. 生成appid
        while (appidSet.size() < 50) {
            String appid = IdUtils.generateCode(24);
            appidSet.add(appid);
        }
        // 2. 查询数据库有没有，如果存在就移除，返回不存在的。
        List<OpenApiUserAuthInfo> list = this.lambdaQuery().in(OpenApiUserAuthInfo::getAppid, appidSet).list();
        if (!list.isEmpty()) {
            list.stream().map(OpenApiUserAuthInfo::getAppid).forEach(appidSet::remove);
        }
        return appidSet;
    }

    /**
     * 申请api权限
     *
     * @param userId 用户id
     * @param apiIds api id集合
     */
    public void applyApi(String userId, String appid, List<String> apiIds) {
        OpenApiUserAuthInfo userApiAuthInfo = getUserApiAuthInfo(userId);
        List<OpenApiAuth> openApiAuthList = new ArrayList<>();
        List<OpenApiList> newList = new ArrayList<>();
        if (!apiIds.isEmpty()) {
            newList = openApiListService.lambdaQuery().in(OpenApiList::getId, apiIds).list();
            if (newList.isEmpty()) {
                throw new CustomizeException("api不存在");
            }
        }
        newList.forEach((OpenApiList apiList) -> {
            OpenApiAuth openApiAuth = new OpenApiAuth();
            openApiAuth.setApiId(apiList.getId());
            openApiAuth.setApiUrl(apiList.getApiUrl());
            openApiAuth.setUserId(userId);
            openApiAuth.setAppid(userApiAuthInfo.getAppid());
            openApiAuthList.add(openApiAuth);
        });
        // 删除原来的,保存新的
        QueryWrapper<OpenApiAuth> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        openApiAuthService.remove(queryWrapper);
        openApiAuthService.saveBatch(openApiAuthList);

    }

    /**
     * 获取用户授权的api列表
     *
     * @param appid appid
     * @return 用户授权的api列表
     */
    public List<OpenApiList> getAppidApiList(String appid) {
        List<OpenApiAuth> list = openApiAuthService.lambdaQuery().eq(OpenApiAuth::getAppid, appid).list();
        if (list == null || list.isEmpty()) {
            return null;
        }
        List<String> apiIdList = list.stream().map(OpenApiAuth::getApiId).toList();
        return openApiListService.lambdaQuery().in(OpenApiList::getId, apiIdList).list();
    }
}