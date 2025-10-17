package com.easy.tool.http;

import com.alibaba.fastjson2.JSONObject;
import okhttp3.*;

import javax.net.ssl.*;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * OkHttpUtils工具类 - 支持多种Content-Type类型
 *
 * @author matt
 */
public class OkHttpUtils {

    // 静态 OkHttpClient 实例（单例复用，OkHttp 5 推荐单例模式）
    private static final OkHttpClient client;

    // 静态初始化：配置客户端（OkHttp 5 对 Builder 兼容性良好）
    static {
        try {
            // 创建一个信任所有证书的TrustManager
            TrustManager[] trustAllCerts = new TrustManager[]{
                    new X509TrustManager() {
                        public X509Certificate[] getAcceptedIssuers() {
                            return new X509Certificate[0];
                        }

                        public void checkClientTrusted(X509Certificate[] certs, String authType) {
                        }

                        public void checkServerTrusted(X509Certificate[] certs, String authType) {
                        }
                    }
            };

            // 安装信任所有证书的TrustManager
            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(null, trustAllCerts, new SecureRandom());

            // 创建SSLSocketFactory
            SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();

            // 创建HostnameVerifier，信任所有主机名
            HostnameVerifier hostnameVerifier = (hostname, session) -> {
                return true; // 信任所有主机名
            };

            client = new OkHttpClient.Builder()
                    .connectTimeout(10, TimeUnit.SECONDS)    // 连接超时
                    .readTimeout(30, TimeUnit.SECONDS)       // 读取超时
                    .writeTimeout(10, TimeUnit.SECONDS)      // 写入超时
                    .retryOnConnectionFailure(false)         // 禁用默认重试，使用自定义逻辑
                    .sslSocketFactory(sslSocketFactory, (X509TrustManager) trustAllCerts[0])
                    .hostnameVerifier(hostnameVerifier)
                    .build();

        } catch (Exception e) {
            throw new RuntimeException("Failed to create SSL context", e);
        }
    }

    public static String get(String url, Map<String, String> headers, Map<String, String> cookies, Integer maxRetries) throws IOException {
        return getWithParams(url, null, headers, cookies, maxRetries);
    }

    /**
     * 发送 GET 请求（支持URL参数）
     *
     * @param url        请求地址
     * @param params     URL参数（可为 null）
     * @param headers    请求头（可为 null，使用默认值）
     * @param cookies    Cookie 键值对（可为 null）
     * @param maxRetries 最大重试次数（null 则默认 3 次）
     * @return 响应字符串
     * @throws IOException 最终失败时抛出异常
     */
    public static String getWithParams(String url, Map<String, String> params, Map<String, String> headers, Map<String, String> cookies, Integer maxRetries) throws IOException {

        // 处理默认重试次数
        int retryCount = (maxRetries == null || maxRetries < 0) ? 3 : maxRetries;
        int currentRetry = 0;
        IOException lastException = null;

        // 构建完整的URL（包含参数）
        String fullUrl = buildUrlWithParams(url, params);

        // 重试循环
        while (currentRetry <= retryCount) {
            try {
                // 构建请求并执行
                Request request = buildGetRequest(fullUrl, headers, cookies);
                Response response = client.newCall(request).execute();

                // 响应成功（200-299 状态码）
                if (response.isSuccessful()) {
                    return response.body().string();
                }

                // 响应失败（非 2xx 状态码），记录异常并重试
                String errorMsg = "GET请求失败，状态码：" + response.code();
                lastException = new IOException(errorMsg);
                response.close();

            } catch (IOException e) {
                // 网络异常（连接超时、断开等），记录异常并重试
                lastException = e;
            }

            currentRetry++;
            // 重试前休眠（可选：添加退避策略，如指数退避）
            if (currentRetry <= retryCount) {
                try {
                    Thread.sleep(1000L * currentRetry); // 每次重试间隔递增（1s, 2s, 3s...）
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new IOException("重试被中断", ie);
                }
            }
        }

        // 超过最大重试次数，抛出最后一次异常
        throw new IOException("超过最大重试次数（" + retryCount + "次），最终失败", lastException);
    }

    /**
     * 构建GET请求对象
     */
    private static Request buildGetRequest(String url, Map<String, String> headers, Map<String, String> cookies) throws IOException {

        // 处理默认 Header
        Map<String, String> defaultHeaders = new HashMap<>();
        defaultHeaders.put("Connection", "keep-alive");

        // 合并用户传入的 Header（用户传入的会覆盖默认值）
        if (headers != null) {
            defaultHeaders.putAll(headers);
        }

        // 构建请求头
        Headers.Builder headerBuilder = new Headers.Builder();
        defaultHeaders.forEach(headerBuilder::add);

        // 处理 Cookie（拼接为 "key1=value1; key2=value2" 格式）
        if (cookies != null && !cookies.isEmpty()) {
            StringBuilder cookieBuilder = new StringBuilder();
            cookies.forEach((k, v) -> cookieBuilder.append(k).append("=").append(v).append("; "));
            String cookieStr = cookieBuilder.toString().trim().replaceAll(";$", ""); // 移除末尾分号
            headerBuilder.add("Cookie", cookieStr);
        }

        // 构建最终请求
        return new Request.Builder()
                .url(url)
                .headers(headerBuilder.build())
                .get()
                .build();
    }

    /**
     * 构建带参数的URL
     *
     * @param url:   请求地址
     * @param params URL参数（Map格式）
     * @return 包含参数的URL字符串
     */
    private static String buildUrlWithParams(String url, Map<String, String> params) {
        if (params == null || params.isEmpty()) {
            return url;
        }

        StringBuilder urlBuilder = new StringBuilder(url);

        // 检查URL是否已有参数
        boolean hasParams = url.contains("?");
        if (!hasParams) {
            urlBuilder.append("?");
        } else {
            urlBuilder.append("&");
        }

        // 添加参数
        boolean first = true;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (entry.getKey() != null && entry.getValue() != null) {
                if (!first) {
                    urlBuilder.append("&");
                }
                first = false;

                String encodedKey = URLEncoder.encode(entry.getKey(), StandardCharsets.UTF_8);
                String encodedValue = URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8);
                urlBuilder.append(encodedKey).append("=").append(encodedValue);
            }
        }

        return urlBuilder.toString();
    }


    /**
     * 发送 POST 请求（支持多种Content-Type类型）
     *
     * @param url        请求地址
     * @param headers    请求头（可为 null，使用默认值）
     * @param cookies    Cookie 键值对（可为 null）
     * @param bodyParams 请求体参数（Map格式，根据Content-Type自动处理）
     * @param maxRetries 最大重试次数（null 则默认 3 次）
     * @return 响应字符串
     * @throws IOException 最终失败时抛出异常
     */
    public static String post(String url, Map<String, String> headers, Map<String, String> cookies,
                              Map<String, Object> bodyParams, Integer maxRetries) throws IOException {
        return postWithContentType(url, headers, cookies, bodyParams, null, maxRetries);
    }

    /**
     * 发送 POST 请求（指定Content-Type）
     *
     * @param url         请求地址
     * @param headers     请求头（可为 null，使用默认值）
     * @param cookies     Cookie 键值对（可为 null）
     * @param bodyParams  请求体参数（Map格式）
     * @param contentType Content-Type类型（如：application/json、application/x-www-form-urlencoded、multipart/form-data）
     * @param maxRetries  最大重试次数（null 则默认 3 次）
     * @return 响应字符串
     * @throws IOException 最终失败时抛出异常
     */
    public static String postWithContentType(String url, Map<String, String> headers, Map<String, String> cookies,
                                             Map<String, Object> bodyParams, String contentType, Integer maxRetries) throws IOException {

        // 处理默认重试次数
        int retryCount = (maxRetries == null || maxRetries < 0) ? 3 : maxRetries;
        int currentRetry = 0;
        IOException lastException = null;

        // 重试循环
        while (currentRetry <= retryCount) {
            try {
                // 构建请求并执行
                Request request = buildRequest(url, headers, cookies, bodyParams, contentType);
                Response response = client.newCall(request).execute();

                // 响应成功（200-299 状态码）
                if (response.isSuccessful()) {
                    return response.body().string();
                }

                // 响应失败（非 2xx 状态码），记录异常并重试
                String errorMsg = "请求失败，状态码：" + response.code();
                lastException = new IOException(errorMsg);
                response.close();

            } catch (IOException e) {
                // 网络异常（连接超时、断开等），记录异常并重试
                lastException = e;
            }

            currentRetry++;
            // 重试前休眠（可选：添加退避策略，如指数退避）
            if (currentRetry <= retryCount) {
                try {
                    Thread.sleep(1000L * currentRetry); // 每次重试间隔递增（1s, 2s, 3s...）
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new IOException("重试被中断", ie);
                }
            }
        }

        // 超过最大重试次数，抛出最后一次异常
        throw new IOException("超过最大重试次数（" + retryCount + "次），最终失败", lastException);
    }

    /**
     * 发送 JSON 格式的 POST 请求
     *
     * @param url        请求地址
     * @param headers    请求头（可为 null，使用默认值）
     * @param cookies    Cookie 键值对（可为 null）
     * @param jsonParams 请求体参数（Map格式，根据Content-Type自动处理）
     * @param maxRetries 最大重试次数（null 则默认 3 次）
     * @return 响应字符串
     * @throws IOException 最终失败时抛出异常
     */
    public static String postJson(String url, Map<String, String> headers, Map<String, String> cookies,
                                  Map<String, Object> jsonParams, Integer maxRetries) throws IOException {
        Map<String, String> jsonHeaders = headers != null ? new HashMap<>(headers) : new HashMap<>();
        jsonHeaders.put("Content-Type", "application/json");
        return postWithContentType(url, jsonHeaders, cookies, jsonParams, "application/json", maxRetries);
    }

    /**
     * 发送表单格式的 POST 请求（支持URL编码）
     *
     * @param url        请求地址
     * @param headers    请求头（可为 null，使用默认值）
     * @param cookies    Cookie 键值对（可为 null）
     * @param formParams 请求体参数（Map格式，根据Content-Type自动处理）
     * @param maxRetries 最大重试次数（null 则默认 3 次）
     * @return 响应字符串
     * @throws IOException 最终失败时抛出异常
     */
    public static String postForm(String url, Map<String, String> headers, Map<String, String> cookies,
                                  Map<String, Object> formParams, Integer maxRetries) throws IOException {
        Map<String, String> formHeaders = headers != null ? new HashMap<>(headers) : new HashMap<>();
        formHeaders.put("Content-Type", "application/x-www-form-urlencoded");
        return postWithContentType(url, formHeaders, cookies, formParams, "application/x-www-form-urlencoded", maxRetries);
    }

    /**
     * 构建请求对象（支持多种Content-Type类型）
     */
    private static Request buildRequest(String url,
                                        Map<String, String> headers,
                                        Map<String, String> cookies,
                                        Map<String, Object> bodyParams,
                                        String contentType) throws IOException {

        // 处理默认 Header
        Map<String, String> defaultHeaders = new HashMap<>();
        defaultHeaders.put("Connection", "keep-alive");

        // 合并用户传入的 Header（用户传入的会覆盖默认值）
        if (headers != null) {
            defaultHeaders.putAll(headers);
        }

        // 处理 Content-Type 默认值
        String finalContentType = contentType;
        if (finalContentType == null || finalContentType.trim().isEmpty()) {
            finalContentType = defaultHeaders.getOrDefault("Content-Type", "application/json");
        }
        defaultHeaders.put("Content-Type", finalContentType);

        // 构建请求头
        Headers.Builder headerBuilder = new Headers.Builder();
        defaultHeaders.forEach(headerBuilder::add);

        // 处理 Cookie（拼接为 "key1=value1; key2=value2" 格式）
        if (cookies != null && !cookies.isEmpty()) {
            StringBuilder cookieBuilder = new StringBuilder();
            cookies.forEach((k, v) -> cookieBuilder.append(k).append("=").append(v).append("; "));
            String cookieStr = cookieBuilder.toString().trim().replaceAll(";$", ""); // 移除末尾分号
            headerBuilder.add("Cookie", cookieStr);
        }

        // 构建请求体（根据Content-Type处理）
        RequestBody requestBody = buildRequestBody(bodyParams, finalContentType);

        // 构建最终请求
        return new Request.Builder()
                .url(url)
                .headers(headerBuilder.build())
                .post(requestBody)
                .build();
    }

    /**
     * 根据Content-Type构建请求体
     */
    private static RequestBody buildRequestBody(Map<String, Object> params, String contentType) {
        if (params == null || params.isEmpty()) {
            return RequestBody.create("", MediaType.parse(contentType));
        }

        String lowerContentType = contentType.toLowerCase();

        if (lowerContentType.contains("application/json")) {
            // JSON格式
            String json = JSONObject.toJSONString(params);
            return RequestBody.create(json, MediaType.parse(contentType));

        } else if (lowerContentType.contains("application/x-www-form-urlencoded")) {
            // 表单格式 - 使用FormBody.Builder（自动进行URL编码）
            FormBody.Builder formBuilder = new FormBody.Builder();
            params.forEach((key, value) -> {
                if (key != null && value != null) {
                    formBuilder.add(key, value.toString());
                }
            });
            return formBuilder.build();

        } else if (lowerContentType.contains("multipart/form-data")) {
            // 多部分表单格式
            MultipartBody.Builder multipartBuilder = new MultipartBody.Builder()
                    .setType(MultipartBody.FORM);

            params.forEach((key, value) -> {
                if (value != null) {
                    if (value instanceof byte[]) {
                        // 字节数组作为文件处理
                        multipartBuilder.addFormDataPart(key, key,
                                RequestBody.create((byte[]) value, MediaType.parse("application/octet-stream")));
                    } else if (value instanceof File file) {
                        // 文件对象
                        multipartBuilder.addFormDataPart(key, file.getName(),
                                RequestBody.create(file, MediaType.parse("application/octet-stream")));
                    } else {
                        // 普通参数
                        multipartBuilder.addFormDataPart(key, value.toString());
                    }
                }
            });
            return multipartBuilder.build();

        } else if (lowerContentType.contains("text/xml") || lowerContentType.contains("application/xml")) {
            // XML格式（简单处理，将Map转换为简单的XML）
            StringBuilder xml = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<root>\n");
            params.forEach((key, value) -> {
                if (value != null) {
                    xml.append("  <").append(key).append(">")
                            .append(value.toString().replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
                            .append("</").append(key).append(">\n");
                }
            });
            xml.append("</root>");
            return RequestBody.create(xml.toString(), MediaType.parse(contentType));

        } else {
            // 默认使用JSON格式
            String json = JSONObject.toJSONString(params);
            return RequestBody.create(json, MediaType.parse(contentType));
        }
    }

    /**
     * 手动URL编码方法（备用方法）
     * 对参数进行URL编码，格式：key1=value1&key2=value2
     */
    private String buildUrlEncodedParams(Map<String, Object> params) {
        if (params == null || params.isEmpty()) {
            return "";
        }

        StringBuilder result = new StringBuilder();
        boolean first = true;

        for (Map.Entry<String, Object> entry : params.entrySet()) {
            if (entry.getKey() != null && entry.getValue() != null) {
                if (!first) {
                    result.append("&");
                }
                first = false;

                String encodedKey = URLEncoder.encode(entry.getKey(), StandardCharsets.UTF_8);
                String encodedValue = URLEncoder.encode(entry.getValue().toString(), StandardCharsets.UTF_8);
                result.append(encodedKey).append("=").append(encodedValue);
            }
        }

        return result.toString();
    }

    public static void main(String[] args) {
        String kpId = "1758851983958";
        String token = "***REMOVE_SECRET***.***REMOVE_SECRET***";
        String sessionId = "9b4db0e1-4a4b-459f-a448-644be63ab82b";
        String csrfToken = "805ea9a5-939e-452c-bdcb-a08812ff7e0e";
        String tradeDate = "D20251016";

        // 请求头信息
        Map<String, String> headers = new HashMap<>();
        headers.put("Accept", "application/json, text/javascript, */*; q=0.01");
        headers.put("Accept-Language", "zh-CN,zh;q=0.9");
        headers.put("Connection", "keep-alive");
        headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        headers.put("Origin", "https://pmos.sd.sgcc.com.cn:18080");
        headers.put("Referer", String.format("https://pmos.sd.sgcc.com.cn:18080/zcq/lxchjy/lxchjy.do?method=getMainTenanceJZ&kpid=%s&jylx=0&jyxz=all&sdate=%s&edate=%s", kpId, "2025-10-01", "2025-10-31"));
        headers.put("Sec-Fetch-Dest", "empty");
        headers.put("Sec-Fetch-Mode", "cors");
        headers.put("Sec-Fetch-Site", "same-origin");
        headers.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0");
        headers.put("X-CSRF-TOKEN", csrfToken);
        headers.put("X-Requested-With", "XMLHttpRequest");
        headers.put("sec-ch-ua", "\"Microsoft Edge\";v=\"141\", \"Not?A_Brand\";v=\"8\", \"Chromium\";v=\"141\"");
        headers.put("sec-ch-ua-mobile", "?0");
        headers.put("sec-ch-ua-platform", "\"Windows\"");

        // Cookies信息
        Map<String, String> cookies = new HashMap<>();
        cookies.put("Gray-Tag", "71696e6764616f78696e67636875");
        cookies.put("ClientTag", "OUTNET_BROWSE");
        cookies.put("CurrentRoute", "/dashboard");
        cookies.put("sidebarStatus", "0");
        cookies.put("X-Token", "undefined");
        cookies.put("B-Digest", "***REMOVE_SECRET***");
        cookies.put("P-Digest", "***REMOVE_SECRET***");
        cookies.put("Admin-Token", token);
        cookies.put("X-Ticket", token);
        cookies.put("XHXT_SESSIONID", sessionId);

        // 使用示例
        try {

            // 表单参数示例
            Map<String, Object> formParams = new HashMap<>();
            formParams.put("jyjd", "2");
            formParams.put("kpId", kpId);
            formParams.put("bdtime", tradeDate);

            // 发送表单请求
            String response = OkHttpUtils.postForm(
                    "https://pmos.sd.sgcc.com.cn:18080/zcq/lxchjy/lxchjy.do?method=getJyjgInfo",
                    headers,
                    cookies,
                    formParams,
                    3
            );

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}