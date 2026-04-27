package com.easy.start.bean.dto.file;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OssUploadFailResult {

    private String originalFilename;
    private String reason;
}
