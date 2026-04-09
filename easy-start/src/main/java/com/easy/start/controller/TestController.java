package com.easy.start.controller;


import cn.dev33.satoken.annotation.SaIgnore;
import com.alibaba.fastjson2.JSON;
import com.easy.client.utils.ApiSignUtils;
import com.easy.core.base.R;
import com.easy.tool.http.OkHttpUtils;
import com.easy.web.annotation.ResultWrap;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import okhttp3.Response;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * </p>
 *
 * @author Matt
 */
@RequestMapping("/test")
@RestController
@AllArgsConstructor
@Tag(name = "测试")
@SaIgnore
public class TestController {


    @PostMapping("/api_test1")
    @Operation(summary = "获取请求公共参数")
    public String getApiTest(@RequestParam("appid") String appid) {
        return ApiSignUtils.generateReqParams(appid);
    }

    @PostMapping("/api_test")
    @Operation(summary = "api请求参数加密")
    @ResultWrap(disabled = true)
    public String apiTest(@RequestBody Map<String, Object> map) {
        String publicKeyStr = map.get("publicKey").toString();
        String privateKeyStr = map.get("privateKey").toString();
        Map<String, Object> params = (Map<String, Object>) map.get("params");
        params.put("pageNum", 1L);
        params.put("pageSize", 100L);
        String data = JSON.toJSONString(params);
        return ApiSignUtils.encryptBizParameter(privateKeyStr, publicKeyStr, data);
    }

    /**
     * 业务参数解密
     *
     * @param param         参数
     * @param sm2PrivateKey sm2私钥
     * @param sm2PublicKey  sm2公钥
     */
    @PostMapping("/api_test3")
    @Operation(summary = "业务参数解密")
    @ResultWrap(disabled = true)
    public String apiTest3(@RequestParam("param") String param, @RequestParam("sm2PrivateKey") String sm2PrivateKey, @RequestParam("sm2PublicKey") String sm2PublicKey) {
        return ApiSignUtils.decryptBizParameter(sm2PrivateKey, sm2PublicKey, param);
    }


    @PostMapping("/api_test2")
    @Operation(summary = "api响应参数解密")
    @ResultWrap(disabled = true)
    public String apiTest2(@RequestParam("param") String param, @RequestParam("aesKey") String aesKey, @RequestParam("aesIv") String aesIv) {
        return ApiSignUtils.decryptResponse(param, aesKey, aesIv);
    }

    /**
     * {
     * "appid": "umTaOMA2Nnp9WII4ebYsTts3",
     * "privateKey": "***REMOVE_SECRET***",
     * "publicKey": "***REMOVE_SECRET***",
     * "aesKey": "broQWbSlOhJwrKVj",
     * "aesIv": "hm2j0dFYL6PBZA9K",
     * "params": {
     * "date": "2025-06-28"
     * },
     * "url": "http://192.168.5.42:8082/api_v1/strategy_signal",
     * "reqParam": "***REMOVE_SECRET***"
     * }
     */
    @PostMapping(value = "/api")
    @Operation(summary = "api测试")
    @ResultWrap(disabled = true)
    public R<String> api(@RequestBody Map<String, Object> map) {
        String appid = map.get("appid").toString();
        String url = map.get("url").toString();
        // 业务参数加密
        String reqParam = apiTest(map);
        // 公共参数
        String signParam = getApiTest(appid);

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
                    fileName = "downloaded_file";
                }

                // 替换为实际的文件存储目录
                String savePath = "/Users/matt/Downloads/demo/" + fileName;
                File file = new File(savePath);

                // 创建文件所在目录
                File parentDir = file.getParentFile();
                if (parentDir != null && !parentDir.exists()) {
                    if (!parentDir.mkdirs()) {
                        return R.fail("无法创建文件目录");
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
                return R.success("文件下载成功，保存路径：" + savePath);
            } else {
                return R.fail("请求失败，状态码: " + response.code());
            }
        } catch (IOException e) {
            return R.fail("请求过程中出现 IO 异常: " + e.getMessage());
        }
    }

}