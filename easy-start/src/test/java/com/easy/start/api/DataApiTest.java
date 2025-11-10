package com.easy.start.api;

import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.SmUtil;
import cn.hutool.crypto.symmetric.AES;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.easy.tool.http.OkHttpUtils;
import com.easy.tool.lang.IdUtils;
import lombok.extern.slf4j.Slf4j;
import okhttp3.Response;
import org.bouncycastle.util.Strings;
import org.bouncycastle.util.encoders.Hex;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * </p>
 *
 * @author Matt
 */
@SpringBootTest
@Slf4j
public class DataApiTest {

    @Test
    public void apiTestDemo() {
        String appid = "umTaOMA2Nnp9WII4ebYsTts3";
        String aesKey = "broQWbSlOhJwrKVj";
        String aesIv = "hm2j0dFYL6PBZA9K";
        String publicKeyStr = "***REMOVE_SECRET***";
        String privateKeyStr = "***REMOVE_SECRET***";
        // 接口地址
        String url = "http://127.0.0.1:8081/api/get";
        // 业务参数
        Map<String, Object> params = new HashMap<>();
        // 业务参数，这里是对应接口的参数
        params.put("userId", "20250718");
        // 业务参数加密
        String reqParam = getReqParam(privateKeyStr, publicKeyStr, params);
        // 请求头公共参数生成
        String signParam = generateReqParams(appid);
        // 发送请求
        try (Response response = OkHttpUtils.builder()
                .url(url)
                .addHeader("signParam", signParam)
                .addParam("reqParam", reqParam)
                .post(true)
                .syncResponse()) {
            if (response.isSuccessful()) {
                okhttp3.ResponseBody responseBody = response.body();
                String ciphertext = response.body().string();
                JSONObject jsonObject = JSONObject.parseObject(ciphertext);
                String plaintext = decryptResponse(jsonObject.getString("data"), aesKey, aesIv);
                jsonObject.put("data", plaintext);
                log.info("请求成功：{}", jsonObject);
            } else {
                log.error("请求失败，状态码: {}", response.code());
            }
        } catch (IOException e) {
            log.error("请求过程中出现 IO 异常: {}", e.getMessage());
        }
    }

    /**
     * 加密业务参数
     *
     * @return 密文
     */
    public static String getReqParam(String privateKeyStr, String publicKeyStr, Map<String, Object> params) {
        // 公共参数，选填
        params.put("pageNum", 1L);
        params.put("pageSize", 100L);
        String data = JSON.toJSONString(params);
        // 加密业务参数
        return encryptBizParameter(privateKeyStr, publicKeyStr, data);
    }

    /**
     * 加密业务参数bizParameter
     *
     * @param data 业务参数
     */
    public static String encryptBizParameter(String privateKey, String publicKey, String data) {
        byte[] msg = Strings.toUTF8ByteArray(data);
        byte[] encrypt = SmUtil.sm2(privateKey, publicKey).encrypt(msg);
        return Strings.fromUTF8ByteArray(Hex.encode(encrypt));
    }

    /**
     * 公共参数 reqParams
     * reqParamter:{"APPID": "5T6U3BU78COS897", "TIMESTAMP": 1584502672530, "RANDOMSTR": "L58Ece1W", "TOKEN": "***REMOVE_SECRET***"}
     * TOKEN是SHA1生成16位小写签名串。将AppSecret参数拼接到timestamp头部、randomStr拼接到timestamp参数字符串尾部,SHA1加密后格式是示例：SHA1(AppSecret+timestamp+randomStr)。
     */
    public static String generateReqParams(String appid) {
        long timestamp = System.currentTimeMillis();
        String randomStr = IdUtils.generateCode(8);
        return "{\"APPID\":\"" + appid + "\",\"TIMESTAMP\":" + timestamp + ",\"RANDOMSTR\":\"" + randomStr + "\",\"TOKEN\":\"" + generateToken(appid, timestamp, randomStr) + "\"}";
    }

    /**
     * TOKEN是SHA1生成16位小写签名串。将AppSecret参数拼接到timestamp头部、randomStr拼接到timestamp参数字符串尾部,SHA1加密后格式是示例：SHA1(AppSecret+timestamp+randomStr)。
     *
     * @param timestamp 时间戳
     * @param randomStr 随机字符串
     * @return token
     */
    public static String generateToken(String appid, Long timestamp, String randomStr) {
        return SecureUtil.sha1().digestHex(appid + timestamp + randomStr).toLowerCase();
    }

    /**
     * 解密响应参数
     * 使用AES对称加解密工具文件中AESUtils类的decrypt方法对加密文本进行解密，其中密钥secretKey和向量偏移量ivKey
     */
    public static String decryptResponse(String data, String aesKey, String aesIv) {
        AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, aesKey.getBytes(), aesIv.getBytes());
        return aes.decryptStr(data);
    }
}