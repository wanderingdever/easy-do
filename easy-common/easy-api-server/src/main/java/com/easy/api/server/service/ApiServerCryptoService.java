package com.easy.api.server.service;

import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.symmetric.AES;
import com.alibaba.fastjson2.JSON;
import com.easy.api.client.utils.ApiSignUtils;
import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;
import com.easy.api.server.model.ApiServerAuthInfo;

/**
 * 开放 API 加解密服务。
 * <p>
 * 请求参数使用 SM2 解密，响应数据使用 AES-CBC 加密，算法与 easy-api-client 保持一致。
 */
public class ApiServerCryptoService {

    /**
     * 解密客户端提交的业务参数，并转换为控制器方法期望的入参类型。
     *
     * @param encryptedData 加密后的业务参数
     * @param clazz         目标参数类型
     * @param authInfo      当前 appId 授权信息
     * @return 解密并反序列化后的业务参数
     */
    public <T> T decryptRequest(String encryptedData, Class<T> clazz, ApiServerAuthInfo authInfo) {
        try {
            String data = ApiSignUtils.decryptBizParameter(authInfo.getSm2PrivateKey(), authInfo.getSm2PublicKey(), encryptedData);
            return JSON.parseObject(data, clazz);
        } catch (Exception e) {
            throw new ApiServerException(ApiServerErrorCode.REQUEST_DECRYPT_ERROR, ApiServerErrorCode.REQUEST_DECRYPT_ERROR.getMessage(), e);
        }
    }

    /**
     * 加密响应 JSON 字符串。
     *
     * @param data     待加密的响应 JSON
     * @param authInfo 当前 appId 授权信息
     * @return AES 加密后的 Base64 字符串
     */
    public String encryptResponse(String data, ApiServerAuthInfo authInfo) {
        try {
            AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, authInfo.getAesKey().getBytes(), authInfo.getAesIv().getBytes());
            return aes.encryptBase64(data);
        } catch (Exception e) {
            throw new ApiServerException(ApiServerErrorCode.RESPONSE_ENCRYPT_ERROR, ApiServerErrorCode.RESPONSE_ENCRYPT_ERROR.getMessage(), e);
        }
    }
}
