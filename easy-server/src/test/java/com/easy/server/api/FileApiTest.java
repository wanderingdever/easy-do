package com.easy.server.api;

import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.SmUtil;
import com.alibaba.fastjson2.JSON;
import com.easy.tool.http.OkHttpUtils;
import com.easy.tool.lang.IdUtils;
import lombok.extern.slf4j.Slf4j;
import okhttp3.Response;
import org.bouncycastle.util.Strings;
import org.bouncycastle.util.encoders.Hex;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * </p>
 *
 * @author Matt
 */
@SpringBootTest
@Slf4j
public class FileApiTest {

    @Test
    public void apiTestDemo() {
        String appid = "3e2Os7qvHi7WD8BTmrVlVCc8";
        String aesKey = "DmlWnj8DllyW2hrl";
        String aesIv = "dG7Kd4VgyXhy5B4Y";
        String privateKeyStr = "***REMOVE_SECRET***";
        String publicKeyStr = "***REMOVE_SECRET***";
        // 接口地址
        String url = "https://www.dawn-fintech.com/data-platform-api/api_v1/weather_file";
        // 业务参数
        Map<String, Object> params = new HashMap<>();
        // 业务参数，这里是对应接口的参数
        params.put("date", "20251022");
        params.put("area", "MENGXI");
        params.put("weatherType", "GDAS");
        params.put("utcType", "00");
        params.put("day", 1);

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
                // 获取文件名，若响应头中没有提供，则使用默认文件名
                String fileName = response.header("Content-Disposition");
                if (fileName != null && fileName.contains("filename=")) {
                    fileName = fileName.substring(fileName.indexOf("filename=") + 9);
                    fileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8);
                } else {
                    fileName = "downloaded_file.csv";
                }
                // TODO 下面已经是在做文件处理了，需要自己根据实际情况处理
                // 替换为实际的文件存储目录
                String savePath = "/Users/matt/Downloads/demo/" + fileName;
                File file = new File(savePath);
                // 创建文件所在目录
                File parentDir = file.getParentFile();
                if (parentDir != null && !parentDir.exists()) {
                    if (!parentDir.mkdirs()) {
                        throw new RuntimeException("无法创建文件目录");
                    }
                }
                // 使用缓冲流将文件内容写入本地文件
                try (InputStream inputStream = responseBody.source().inputStream();
                     FileOutputStream fileOutputStream = new FileOutputStream(file);
                     BufferedInputStream bis = new BufferedInputStream(inputStream);
                     BufferedOutputStream bos = new BufferedOutputStream(fileOutputStream)) {
                    byte[] buffer = new byte[8192];
                    int bytesRead;
                    while ((bytesRead = bis.read(buffer)) != -1) {
                        bos.write(buffer, 0, bytesRead);
                    }
                    bos.flush();
                }
                log.info("文件下载成功，保存路径：{}", savePath);
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
}