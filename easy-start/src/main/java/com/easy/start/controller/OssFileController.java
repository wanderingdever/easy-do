package com.easy.start.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.start.bean.dto.file.OssBatchUploadResult;
import com.easy.start.bean.dto.file.OssUploadResult;
import com.easy.start.service.OssFileService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.Duration;
import java.util.Arrays;
import java.util.Map;

@RestController
@RequestMapping("/file")
@AllArgsConstructor
@Tag(name = "OSS文件管理")
@SaIgnore
public class OssFileController {

    private final OssFileService ossFileService;


    /**
     * 上传文件。
     * <p>
     * 示例：
     * POST /api/oss/upload?dir=robot/inspection&publicRead=true
     */
    @PostMapping("/upload")
    @Operation(summary = "上传文件", description = "上传单个文件到OSS")
    public OssUploadResult upload(
            @RequestPart("file") MultipartFile file,
            @RequestParam(name = "publicRead", defaultValue = "false") boolean publicRead
    ) {
        return ossFileService.upload(file, publicRead);
    }


    /**
     * 批量上传文件。
     * <p>
     * 示例：
     * POST /api/oss/batch-upload?dir=robot/inspection&publicRead=true
     */
    @PostMapping("/batch-upload")
    @Operation(summary = "批量上传文件", description = "上传多个文件到OSS")
    public OssBatchUploadResult batchUpload(
            @RequestPart("files") MultipartFile[] files,
            @RequestParam(name = "publicRead", defaultValue = "false") boolean publicRead
    ) {
        return ossFileService.batchUpload(Arrays.asList(files), publicRead);
    }

    /**
     * 删除文件。
     * <p>
     * 示例：
     * DELETE /api/oss/delete?objectKey=robot/inspection/a.jpg
     */
    @GetMapping("/delete")
    @Operation(summary = "删除文件", description = "从OSS中删除指定文件")
    public Map<String, Object> delete(@RequestParam("objectKey") String objectKey) {
        ossFileService.delete(objectKey);
        return Map.of("success", true);
    }

    /**
     * 获取预览链接。
     * <p>
     * 示例：
     * GET /api/oss/preview?objectKey=robot/inspection/a.jpg&expireMinutes=60
     */
    @GetMapping("/preview")
    @Operation(summary = "获取预览链接", description = "获取指定文件的预览链接")
    public String preview(
            @RequestParam("objectKey") String objectKey,
            @RequestParam(name = "expireMinutes", defaultValue = "60") long expireMinutes
    ) {

        return ossFileService.getPreviewUrl(
                objectKey,
                Duration.ofMinutes(expireMinutes)
        );
    }
}
