package com.easy.start.api;


import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.client.constant.ApiConstants;
import com.easy.client.entity.ApiHeaderParam;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.annotation.ApiServer;
import com.easy.start.bean.dto.sys.api.ApiDTO;
import com.easy.start.bean.entity.sys.OpenApiList;
import com.easy.start.bean.entity.sys.OpenApiUserAuthInfo;
import com.easy.start.utils.ApiServerUtils;
import com.easy.web.annotation.ResultWrap;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.stream.Collectors;

/**
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/api")
@RestController
@AllArgsConstructor
@Tag(name = "API测试")
@SaIgnore
public class ApiTestController {

    /**
     * 测试
     *
     * @return 测试结果
     */
    @ApiServer
    @ResultWrap
    @PostMapping(value = "/test", headers = ApiConstants.SIGN_KEY)
    public ApiDTO apiTest(HttpServletRequest request) {
        ApiDTO dto = new ApiDTO();
        ApiHeaderParam apiHeaderParam = ApiServerUtils.getApiHeaderParam();
        // 验证appid是否正确
        OpenApiUserAuthInfo authInfo = RedisUtils.getCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + apiHeaderParam.getAppId());
        dto.setAppid(authInfo.getAppid());
        dto.setApiIdList(authInfo.getOpenApiList().stream().map(OpenApiList::getApiUrl).collect(Collectors.toList()));
        return dto;
    }

}