package com.easy.start.service;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.easy.core.exception.CustomizeException;
import com.easy.start.bean.vo.file.FileVO;
import com.easy.start.config.AliOssConfig;
import com.easy.utils.file.FileUtils;
import com.easy.utils.lang.DateUtils;
import lombok.SneakyThrows;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 阿里云oss
 * </p>
 *
 * @author Matt
 */
@Service
@ConditionalOnProperty(name = "file.storage", havingValue = "ali")

public class AliOssService implements FileService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AliOssService.class);

    private final AliOssConfig aliOssConfig;

    public AliOssService(AliOssConfig aliOssConfig) {
        this.aliOssConfig = aliOssConfig;
    }

    @SneakyThrows
    @Override
    public FileVO upload(MultipartFile file) {
        // 创建文件输入流
        InputStream inputStream = file.getInputStream();
        String fileName = file.getOriginalFilename();
        String upload = uploadToOss(inputStream, fileName);
        // 保存记录
        return new FileVO(fileName, upload, aliOssConfig.getEndpoint(), file.getSize());
    }

    @Override
    public FileVO upload(InputStream inputStream, String fileName) throws IOException {
        String upload = uploadToOss(inputStream, fileName);
        // 保存记录
        return new FileVO(fileName, upload, aliOssConfig.getEndpoint(), FileUtils.getInputStreamSize(inputStream));
    }

    private String uploadToOss(InputStream inputStream, String fileName) {
        OSS ossClient = null;
        fileName = DateUtils.datePath() + "/" + DateUtils.timeNum() + "_" + fileName;
        try {
            // 创建OSSClient实例
            ossClient = new OSSClientBuilder().build(aliOssConfig.getEndpoint(), aliOssConfig.getAccessKey(), aliOssConfig.getSecretKey());
            // 执行文件上传
            ossClient.putObject(aliOssConfig.getBucketName(), fileName, inputStream);
            return fileName;
        } catch (Exception e) {
            LOGGER.error("阿里云OSS文件上传失败：{}", e.getMessage());
            throw new CustomizeException("文件上传失败");
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }

    @Override
    public List<FileVO> uploadBatch(MultipartFile[] files) {
        return List.of();
    }

    @Override
    public ResponseEntity<Resource> download(String fileName) {
        // 创建OSSClient实例
        OSS ossClient = null;
        try {
            ossClient = new OSSClientBuilder().build(aliOssConfig.getEndpoint(), aliOssConfig.getAccessKey(), aliOssConfig.getSecretKey());
            // 直接下载到文件
            OSSObject object = ossClient.getObject(new GetObjectRequest(aliOssConfig.getBucketName(), fileName));
            InputStream objectContent = object.getObjectContent();
            // 转为pdf
            byte[] pfdBytes = FileUtils.convertPngToPdf(objectContent.readAllBytes(), fileName);
            objectContent = new ByteArrayInputStream(pfdBytes);
            String simpleFileName = fileName.substring(0, fileName.lastIndexOf('.')) + ".pdf";
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = objectContent.read(buffer)) != -1) {
                baos.write(buffer, 0, bytesRead);
            }
            return getResourceResponseEntity(simpleFileName, baos);
        } catch (Exception e) {
            LOGGER.error("文件下载失败：{}", e.getMessage());
            throw new CustomizeException("文件上传失败");
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
    }

    /**
     * 封装文件响应实体
     *
     * @param fileName 文件名
     * @param baos     文件字节数组输出流
     * @return
     */
    @NotNull
    private static ResponseEntity<Resource> getResourceResponseEntity(String fileName, ByteArrayOutputStream baos) {
        // 创建ByteArrayResource对象
        Resource resource = new ByteArrayResource(baos.toByteArray()) {
            @Override
            public String getFilename() {
                return fileName; // 提供文件名
            }
        };
        // 设置HTTP响应头
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName);
        // 创建ResponseEntity对象并返回
        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(baos.toByteArray().length)
                .body(resource);
    }

    @Override
    public ResponseEntity<Resource> download(List<String> fileNameList) {
        // 创建OSSClient实例
        OSS ossClient = new OSSClientBuilder().build(aliOssConfig.getEndpoint(), aliOssConfig.getAccessKey(), aliOssConfig.getSecretKey());
        // 创建一个字节输出流来捕获压缩包的字节
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        String downloadFileName;
        if (fileNameList.size() == 2) {
            // 如果只有一个文件,则不压缩成zip,直接下载
            return download(fileNameList.get(0));
        } else {
            downloadFileName = DateUtils.datePath() + "/" + DateUtils.timeNum() + ".zip";
            try (ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream)) {
                for (String fileName : fileNameList) {
                    // 下载文件
                    OSSObject ossObject = ossClient.getObject(aliOssConfig.getBucketName(), fileName);
                    InputStream inputStream = ossObject.getObjectContent();
                    // 转为pdf
                    byte[] pfdBytes = FileUtils.convertPngToPdf(inputStream.readAllBytes(), fileName);
                    String simpleFileName = fileName.substring(fileName.lastIndexOf('/') + 1, fileName.lastIndexOf('.')) + ".pdf";
                    inputStream = new ByteArrayInputStream(pfdBytes);
                    // 将文件添加到压缩包
                    ZipEntry zipEntry = new ZipEntry(simpleFileName);
                    zipOutputStream.putNextEntry(zipEntry);
                    byte[] bytes = new byte[1024];
                    int length;
                    while ((length = inputStream.read(bytes)) >= 0) {
                        zipOutputStream.write(bytes, 0, length);
                    }
                    zipOutputStream.closeEntry();
                    inputStream.close();
                }
            } catch (Exception e) {
                throw new CustomizeException("文件下载失败");
            } finally {
                // 完成压缩包
                // 关闭OSSClient
                ossClient.shutdown();
            }
        }
        return getResourceResponseEntity(downloadFileName, byteArrayOutputStream);
    }


    @Override
    public String deleteFile(String fileName) {
        return "";
    }

    @Override
    public String batchDeleteFiles(List<String> fileNames) {
        return "";
    }
}