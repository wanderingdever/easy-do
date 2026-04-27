package com.easy.start.bean.dto.file;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OssBatchUploadResult {

    private Integer total;
    private Integer successCount;
    private Integer failCount;
    private List<OssUploadResult> successList = new ArrayList<>();
    private List<OssUploadFailResult> failList = new ArrayList<>();

}
