package com.easy.start.bean.dto.file;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OssUploadResult {

    @Schema(description = "文件对象键")
    private String objectKey;

    @Schema(description = "文件原名称")
    private String originalName;

    @Schema(description = "文件访问URL")
    private String url;

    private String eTag;

    @Schema(description = "是否公共可读")
    private Boolean publicRead;


}
