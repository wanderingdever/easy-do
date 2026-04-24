package com.easy.start.api;

import cn.dev33.satoken.annotation.SaIgnore;
import com.easy.start.bean.dto.DataSyncRequest;
import com.easy.start.bean.dto.DataSyncResult;
import com.easy.start.service.DataSyncService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Tag(name = "数据同步接口")
@RestController
@RequestMapping("/api/sync")
@RequiredArgsConstructor
public class DataSyncController {

    private final DataSyncService dataSyncService;

    @Operation(summary = "同步数据到目标数据库")
    @PostMapping("/data")
    @SaIgnore
    public DataSyncResult syncData(@Valid @RequestBody DataSyncRequest request) {
        return dataSyncService.sync(request);
    }
}
