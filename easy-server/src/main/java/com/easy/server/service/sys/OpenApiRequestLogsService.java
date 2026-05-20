package com.easy.server.service.sys;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.server.bean.entity.sys.OpenApiRequestLogs;
import com.easy.server.dao.sys.OpenApiRequestLogsMapper;
import com.easy.tool.lang.DateUtils;
import com.easy.tool.lang.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 开放api请求日志 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-04-24
 */
@Service
public class OpenApiRequestLogsService extends ServiceImpl<OpenApiRequestLogsMapper, OpenApiRequestLogs> {

    public void insertLog(String appId, String requestId, String requestURI, String ipAddress, String headerParam, String reqParam, String errMsg) {
        OpenApiRequestLogs openApiRequestLogs = new OpenApiRequestLogs();
        openApiRequestLogs.setAppid(appId);
        openApiRequestLogs.setRequestId(requestId);
        openApiRequestLogs.setApiUrl(requestURI);
        openApiRequestLogs.setRequestIp(ipAddress);
        openApiRequestLogs.setHeaderParam(headerParam);
        openApiRequestLogs.setRequestParam(reqParam);
        openApiRequestLogs.setErrorMsg(errMsg);
        openApiRequestLogs.setRequestTime(DateUtils.now());
        save(openApiRequestLogs);
    }


    public void updateByAppidAndRequestId(String appId, String requestId, String result, String errMsg) {
        lambdaUpdate().eq(OpenApiRequestLogs::getAppid, appId)
                .eq(OpenApiRequestLogs::getRequestId, requestId)
                .set(OpenApiRequestLogs::getResponseTime, DateUtils.now())
                .set(StringUtils.isNotBlank(result), OpenApiRequestLogs::getResponseData, result)
                .set(StringUtils.isNotBlank(errMsg), OpenApiRequestLogs::getErrorMsg, errMsg)
                .update();

    }
}