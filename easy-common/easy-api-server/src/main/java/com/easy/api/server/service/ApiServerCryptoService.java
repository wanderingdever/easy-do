package com.easy.api.server.service;

import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.symmetric.AES;
import com.alibaba.fastjson2.JSON;
import com.easy.api.client.utils.ApiSignUtils;
import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;
import com.easy.api.server.model.ApiServerAuthInfo;

public class ApiServerCryptoService {

    public <T> T decryptRequest(String encryptedData, Class<T> clazz, ApiServerAuthInfo authInfo) {
        try {
            String data = ApiSignUtils.decryptBizParameter(authInfo.getSm2PrivateKey(), authInfo.getSm2PublicKey(), encryptedData);
            return JSON.parseObject(data, clazz);
        } catch (Exception e) {
            throw new ApiServerException(ApiServerErrorCode.REQUEST_DECRYPT_ERROR, ApiServerErrorCode.REQUEST_DECRYPT_ERROR.getMessage(), e);
        }
    }

    public String encryptResponse(String data, ApiServerAuthInfo authInfo) {
        try {
            AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, authInfo.getAesKey().getBytes(), authInfo.getAesIv().getBytes());
            return aes.encryptBase64(data);
        } catch (Exception e) {
            throw new ApiServerException(ApiServerErrorCode.RESPONSE_ENCRYPT_ERROR, ApiServerErrorCode.RESPONSE_ENCRYPT_ERROR.getMessage(), e);
        }
    }
}
