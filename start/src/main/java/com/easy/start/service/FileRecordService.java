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
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Data
public class FileRecordService extends ServiceImpl<FileRecordMapper, FileRecord> {

    @Transactional
    public FileVO saveRecord(String fileName, String relativePath, String endpoint, long size) {
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFileName(fileName);
        fileRecord.setFile(relativePath);
        fileRecord.setFileType(FileUtils.getFileType(relativePath));
        fileRecord.setFileSize(String.valueOf(size));
        save(fileRecord);
        FileVO fileVO = new FileVO();
        BeanUtils.copyProperties(fileRecord, fileVO);
        fileVO.setId(fileRecord.getId());
        fileVO.setAbsolutePath(endpoint + Constants.FILE_SEPARATOR + relativePath);
        fileVO.setHost(endpoint);
        return fileVO;
    }

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
}