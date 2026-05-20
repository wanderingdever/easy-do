package com.easy.api.client.service;


import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.easy.api.client.config.ApiClientProperties;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.client.utils.ApiSignUtils;
import com.easy.core.base.R;
import com.easy.tool.http.OkHttpUtils;
import lombok.AllArgsConstructor;
import okhttp3.Response;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@AllArgsConstructor
public class ApiClientService {

    private final ApiClientProperties properties;

    public R<String> requestUrl(String apiPath, Object param) {
        String appid = properties.getAppid();
        String url = properties.getBaseUrl() + apiPath;
        // 生成请求头
        String signParam = ApiSignUtils.generateReqParams(appid);
        // 加密业务参数
        String encryptedParam = null;
        if (param != null) {
            encryptedParam = encryptBizParameter(param);
        }

        try (Response response = OkHttpUtils.builder()
                .url(url)
                .addHeader(ApiConstants.SIGN_KEY, signParam)
                .addParam(ApiConstants.REQ_PARAM_KEY, encryptedParam)
                .post(true)
                .syncResponse()) {

            if (response.isSuccessful()) {
                String responseBody = response.body().string();
                R<String> result = JSON.parseObject(responseBody, new TypeReference<>() {
                });
                String decryptedResponse;
                if (result.getCode() != R.SUCCESS) {
                    return result;
                }
                if (result.getData() != null) {
                    // 解密响应体
                    try {
                        decryptedResponse = ApiSignUtils.decryptResponse(result.getData(), properties.getAesKey(), properties.getAesIv());
                        result.setData(decryptedResponse);
                    } catch (Exception e) {
                        throw new RuntimeException("解密响应体失败: " + e.getMessage(), e);
                    }
                }
                return result;
            } else {
                throw new RuntimeException("请求失败，状态码: " + response.code());
            }
        } catch (IOException e) {
            throw new RuntimeException("请求过程中出现 IO 异常: " + e.getMessage());
        }
    }

    /**
     * 加密业务参数
     *
     * @param param 业务参数
     * @return 加密后的业务参数
     */
    public String encryptBizParameter(Object param) {
        return ApiSignUtils.encryptBizParameter(
                properties.getPrivateKey(),
                properties.getPublicKey(),
                JSON.toJSONString(param)
        );
    }
}