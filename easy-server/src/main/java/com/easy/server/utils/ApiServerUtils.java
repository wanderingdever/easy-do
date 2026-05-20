package com.easy.server.utils;

import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.symmetric.AES;
import com.alibaba.fastjson2.JSON;
import com.easy.api.client.constant.ApiConstants;
import com.easy.api.client.entity.ApiHeaderParam;
import com.easy.api.client.utils.ApiSignUtils;
import com.easy.core.enums.REnum;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.bean.entity.sys.OpenApiUserAuthInfo;
import jakarta.servlet.http.HttpServletRequest;
import jodd.util.StringUtil;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * API服务端工具类
 */
public class ApiServerUtils {

    /**
     * 获取API请求头参数
     *
     * @return API请求头参数
     */
    public static ApiHeaderParam getApiHeaderParam() {
        HttpServletRequest request = getRequest();
        String reqParams = request.getHeader(ApiConstants.SIGN_KEY);
        if (StringUtil.isBlank(reqParams)) {
            throw new CustomizeException(REnum.SIGN_NULL);
        }
        ApiHeaderParam apiHeaderParam;
        try {
            apiHeaderParam = JSON.parseObject(reqParams, ApiHeaderParam.class);
            return apiHeaderParam;
        } catch (Exception e) {
            throw new CustomizeException(REnum.SIGN_ERROR);
        }
    }

    /**
     * 获取当前请求对象
     *
     * @return 请求对象
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes == null) {
            throw new CustomizeException(REnum.RUNTIME_EXCEPTION);
        }
        return attributes.getRequest();
    }

    /**
     * 获取授权信息
     *
     * @param reqParams 请求头参数
     * @return 授权信息
     */
    private static OpenApiUserAuthInfo getAuthInfo(String reqParams) {
        ApiHeaderParam apiHeaderParam = JSON.parseObject(reqParams, ApiHeaderParam.class);
        OpenApiUserAuthInfo apiAuthInfo = RedisUtils.getCacheObject(ApiConstants.USER_API_AUTH_INFO_REDIS_KEY + apiHeaderParam.getAppId());
        if (apiAuthInfo == null) {
            throw new CustomizeException("授权信息错误");
        }
        return apiAuthInfo;
    }

    /**
     * 解密请求参数
     * <p>
     * 公钥加密，私钥解密
     *
     * @param request 请求对象
     * @param data    加密后的字符串
     * @param clazz   解密后的对象类型
     * @return 解密后的对象
     */
    public static <T> T decryptRequest(HttpServletRequest request, String data, Class<T> clazz) {
        String reqParams = request.getHeader(ApiConstants.SIGN_KEY);
        OpenApiUserAuthInfo apiAuthInfo = getAuthInfo(reqParams);
        String reqParam;
        try {
            reqParam = ApiSignUtils.decryptBizParameter(apiAuthInfo.getSm2PrivateKey(), apiAuthInfo.getSm2PublicKey(), data);
        } catch (Exception e) {
            throw new CustomizeException("业务参数加密验证失败");
        }
        return JSON.parseObject(reqParam, clazz);
    }


    /**
     * 加密响应参数
     * 使用AES对称加解密工具文件中AESUtils类的encrypt方法对加密文本进行加密，其中密钥secretKey和向量偏移量ivKey
     *
     * @param data      加密文本
     * @param reqParams 请求头参数
     */
    public static String encryptResponse(String reqParams, String data) {
        OpenApiUserAuthInfo apiAuthInfo = getAuthInfo(reqParams);
        AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, apiAuthInfo.getAesKey().getBytes(), apiAuthInfo.getAesIv().getBytes());
        return aes.encryptBase64(data);
    }

}
