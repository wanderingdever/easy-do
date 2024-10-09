package com.easy.start.service;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.constant.Constants;
import com.easy.start.bean.dto.file.FileQueryDTO;
import com.easy.start.bean.entity.FileRecord;
import com.easy.start.bean.vo.file.FileRecordVO;
import com.easy.start.bean.vo.file.FileVO;
import com.easy.start.dao.FileRecordMapper;
import com.easy.utils.file.FileUtils;
import com.easy.utils.lang.StringUtils;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import org.apache.commons.collections4.CollectionUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * minio文件服务
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Service
@AllArgsConstructor
public class FileRecordService extends ServiceImpl<FileRecordMapper, FileRecord> {

    private final FileService fileService;

    /**
     * 文件查询
     */
    public List<FileRecordVO> fileQuery(FileQueryDTO dto) {
        List<FileRecordVO> result = new ArrayList<>();
        List<FileRecord> fileRecordList = lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getFileName()), FileRecord::getFileName, dto.getFileName())
                .like(StringUtils.isNotBlank(dto.getFilePath()), FileRecord::getFile, dto.getFilePath())
                .like(StringUtils.isNotBlank(dto.getFileType()), FileRecord::getFileType, dto.getFileType())
                .in(CollectionUtils.isNotEmpty(dto.getIds()), FileRecord::getId, dto.getIds())
                .list();
        if (CollectionUtils.isNotEmpty(fileRecordList)) {
            result = fileRecordList.stream().map(record -> {
                FileRecordVO fileRecordVO = new FileRecordVO();
                BeanUtils.copyProperties(record, fileRecordVO);
                return fileRecordVO;
            }).collect(Collectors.toList());
        }
        return result;
    }

    public ResponseEntity<Resource> download(List<String> idList) throws IOException {
        List<FileRecord> list = lambdaQuery().in(FileRecord::getId, idList).list();
        if (CollectionUtils.isNotEmpty(list)) {
            List<String> filNameList = list.stream().map(FileRecord::getFile).toList();
            return fileService.download(filNameList);
        }
        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public FileVO upload(MultipartFile file) {
        FileVO upload = fileService.upload(file);
        return saveFile(upload);
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteFile(String fileName) {
    }

    public FileVO upload(InputStream value, String path) throws IOException {
        FileVO upload = fileService.upload(value, path);
        return saveFile(upload);
    }

    @NotNull
    private FileVO saveFile(FileVO upload) {
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFileName(upload.getOriginalName());
        fileRecord.setFile(upload.getRelativePath());
        fileRecord.setFileType(FileUtils.getFileType(upload.getRelativePath()));
        fileRecord.setFileSize(upload.getFileSize());
        save(fileRecord);
        FileVO fileVO = new FileVO();
        fileVO.setId(fileRecord.getId());
        fileVO.setAbsolutePath(upload.getHost() + Constants.FILE_SEPARATOR + upload.getRelativePath());
        return fileVO;
    }
}