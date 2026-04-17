package com.easy.start.service.sys;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.start.bean.dto.sys.db.DbSearchDTO;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.dao.sys.SysDbConnectionConfigMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SysDbConnectionConfigService extends ServiceImpl<SysDbConnectionConfigMapper, SysDbConnectionConfig> {
    public Page<SysDbConnectionConfig> pageDb(DbSearchDTO searchDTO) {
        return null;
    }
}
