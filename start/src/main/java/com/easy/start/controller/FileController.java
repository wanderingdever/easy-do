package com.easy.start.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.constant.Constants;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.bean.dto.IdListDTO;
import com.easy.start.bean.dto.file.FileDTO;
import com.easy.start.bean.dto.file.FileQueryDTO;
import com.easy.start.bean.entity.FileRecord;
import com.easy.start.bean.vo.file.FileRecordVO;
import com.easy.start.bean.vo.file.FileVO;
import com.easy.start.service.FileRecordService;
import com.easy.utils.lang.CollectionUtils;
import com.easy.web.annotation.Wrap;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 文件服务
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/file")
@Tag(name = "文件服务")
public class FileController {

    private final FileRecordService fileRecordService;

    public FileController(FileRecordService fileRecordService) {
        this.fileRecordService = fileRecordService;
    }


    /**
     * 获取文件HOST
     *
     * @return 文件服务HOST
     */
    @PostMapping(value = "/host")
    @Operation(summary = "获取文件HOST")
    public String getHost() {
        return null;
    }

    /**
     * 获取文件分页
     */
    @PostMapping(value = "/page")
    @Operation(summary = "获取文件分页")
    @SaCheckPermission(value = "system.file.page", orRole = Constants.ADMIN_ROLE)
    public Page<FileRecord> page(@RequestBody FileQueryDTO dto) {
        return fileRecordService.filePage(dto);
    }

    /**
     * 上传文件
     *
     * @param file 文件
     * @return 文件相对路径+名字
     */
    @PostMapping(value = "/upload")
    @Operation(summary = "上传文件")
    public FileVO upload(@RequestPart(name = "file") MultipartFile file) {
        return fileRecordService.upload(file);
    }

    /**
     * 文件下载
     */
    @PostMapping(value = "/download")
    @Operation(summary = "文件下载")
    @Wrap(disabled = true)
    public ResponseEntity<Resource> download(@RequestBody IdListDTO dto) throws IOException {
        if (CollectionUtils.isEmpty(dto.getIdList())) {
            throw new CustomizeException("请选择文件");
        }
        return fileRecordService.download(dto.getIdList());
    }

    /**
     * 文件查询
     */
    @PostMapping(value = "/query")
    @Operation(summary = "文件查询")
    public List<FileRecordVO> fileQuery(@RequestBody FileQueryDTO vo) {
        return fileRecordService.fileQuery(vo);
    }

    /**
     * 删除文件
     *
     * @param dto 文件名字集合
     */
    @PostMapping(value = "/delete")
    @Operation(summary = "删除文件")
    public String delete(@RequestBody FileDTO dto) {
        fileRecordService.deleteFile(dto.getFileName());
        return "";
    }

}