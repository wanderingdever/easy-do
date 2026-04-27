package com.easy.start.service;

import cn.hutool.core.util.IdUtil;
import com.aliyun.sdk.service.oss2.OSSClient;
import com.aliyun.sdk.service.oss2.PresignOptions;
import com.aliyun.sdk.service.oss2.models.*;
import com.aliyun.sdk.service.oss2.transport.BinaryData;
import com.easy.start.bean.dto.file.OssBatchUploadResult;
import com.easy.start.bean.dto.file.OssUploadFailResult;
import com.easy.start.bean.dto.file.OssUploadResult;
import com.easy.start.config.OssProperties;
import com.easy.tool.lang.DateUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

@Service
public class OssFileService {

    private static final String ACL_PUBLIC_READ = "public-read";
    private static final String ACL_PRIVATE = "private";

    private final OSSClient ossClient;
    private final OssProperties properties;

    public OssFileService(OSSClient ossClient, OssProperties properties) {
        this.ossClient = ossClient;
        this.properties = properties;
    }

    public OssUploadResult upload(MultipartFile file, boolean publicRead) {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("上传文件不能为空");
        }

        String objectKey = buildObjectKey(file.getOriginalFilename());
        String contentType = resolveContentType(file);
        String acl = publicRead ? ACL_PUBLIC_READ : ACL_PRIVATE;

        try (InputStream inputStream = file.getInputStream()) {
            PutObjectRequest request = PutObjectRequest.newBuilder()
                    .bucket(properties.getBucketName())
                    .key(objectKey)
                    .body(BinaryData.fromStream(inputStream, file.getSize()))
                    .contentType(contentType)
                    .objectAcl(acl)
                    .build();

            PutObjectResult result = ossClient.putObject(request);

            String accessUrl = publicRead ? buildPublicUrl(objectKey) : null;

            return new OssUploadResult(
                    file.getOriginalFilename(),
                    objectKey,
                    accessUrl,
                    result.eTag(),
                    publicRead
            );
        } catch (Exception e) {
            throw new RuntimeException("OSS 文件上传失败：" + e.getMessage(), e);
        }
    }

    public OssBatchUploadResult batchUpload(List<MultipartFile> files, boolean publicRead) {
        if (files == null || files.isEmpty()) {
            throw new IllegalArgumentException("上传文件列表不能为空");
        }

        List<OssUploadResult> successList = new ArrayList<>();
        List<OssUploadFailResult> failList = new ArrayList<>();

        for (MultipartFile file : files) {
            String originalFilename = file == null ? null : file.getOriginalFilename();

            try {
                OssUploadResult result = upload(file, publicRead);
                successList.add(result);
            } catch (Exception e) {
                failList.add(new OssUploadFailResult(
                        originalFilename,
                        e.getMessage()
                ));
            }
        }

        return new OssBatchUploadResult(
                files.size(),
                successList.size(),
                failList.size(),
                successList,
                failList
        );
    }

    public void delete(String objectKey) {
        if (!StringUtils.hasText(objectKey)) {
            throw new IllegalArgumentException("objectKey 不能为空");
        }

        try {
            DeleteObjectRequest request = DeleteObjectRequest.newBuilder()
                    .bucket(properties.getBucketName())
                    .key(objectKey)
                    .build();

            ossClient.deleteObject(request);
        } catch (Exception e) {
            throw new RuntimeException("OSS 文件删除失败：" + e.getMessage(), e);
        }
    }

    public String getPreviewUrl(String objectKey, Duration expire) {
        if (!StringUtils.hasText(objectKey)) {
            throw new IllegalArgumentException("objectKey 不能为空");
        }

        if (expire == null || expire.isNegative() || expire.isZero()) {
            expire = Duration.ofHours(1);
        }

        try {
            String filename = extractFilename(objectKey);

            GetObjectRequest request = GetObjectRequest.newBuilder()
                    .bucket(properties.getBucketName())
                    .key(objectKey)
                    // inline：尽量让浏览器预览，而不是下载。
                    // 真正能否预览还取决于文件 Content-Type、浏览器能力、自定义域名等。
                    .responseContentDisposition("inline;filename*=UTF-8''" + urlEncode(filename))
                    .build();

            PresignOptions options = PresignOptions.newBuilder()
                    .expiration(expire)
                    .build();

            PresignResult result = ossClient.presign(request, options);
            return result.url();
        } catch (Exception e) {
            throw new RuntimeException("OSS 预览链接生成失败：" + e.getMessage(), e);
        }
    }

    private String buildObjectKey(String originalFilename) {
        String ext = "";
        int dotIndex = originalFilename.lastIndexOf(".");
        if (dotIndex >= 0) {
            ext = originalFilename.substring(dotIndex);
        }
        String newFilename = IdUtil.fastSimpleUUID() + ext;
        return DateUtils.datePath() + "/" + DateUtils.timeNum() + "_" + newFilename;
    }


    private String resolveContentType(MultipartFile file) {
        String contentType = file.getContentType();
        return StringUtils.hasText(contentType) ? contentType : "application/octet-stream";
    }

    private String buildPublicUrl(String objectKey) {
        String domain = properties.getPublicDomain();

        if (!StringUtils.hasText(domain)) {
            domain = properties.getEndpoint();

            // 默认 endpoint 形式：bucket.endpoint/objectKey
            // 例如：https://examplebucket.oss-cn-hangzhou.aliyuncs.com/a.jpg
            String normalizedEndpoint = removeTrailingSlash(domain);
            return normalizedEndpoint.replace("https://", "https://" + properties.getBucketName() + ".")
                    .replace("http://", "http://" + properties.getBucketName() + ".")
                    + "/" + objectKey;
        }

        return removeTrailingSlash(domain) + "/" + objectKey;
    }

    private String removeTrailingSlash(String value) {
        if (value == null) {
            return "";
        }

        while (value.endsWith("/")) {
            value = value.substring(0, value.length() - 1);
        }

        return value;
    }

    private String extractFilename(String objectKey) {
        int index = objectKey.lastIndexOf("/");
        if (index >= 0 && index < objectKey.length() - 1) {
            return objectKey.substring(index + 1);
        }
        return objectKey;
    }

    private String urlEncode(String value) {
        return URLEncoder.encode(value, StandardCharsets.UTF_8)
                .replace("+", "%20");
    }
}