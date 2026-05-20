package com.easy.server.bean.entity.sys;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("sys_db_connection_config")
@Schema(description = "数据库连接配置")
public class SysDbConnectionConfig extends BaseEntity {

    @Schema(description = "数据库连接配置ID")
    @TableField("secret_key")
    private String secretKey;

    @Schema(description = "数据库类型")
    @TableField("db_type")
    private String dbType;

    @Schema(description = "数据库主机")
    @TableField("host")
    private String host;

    @Schema(description = "数据库端口")
    @TableField("port")
    private Integer port;

    @Schema(description = "数据库名称")
    @TableField("database_name")
    private String databaseName;

    @Schema(description = "数据库用户名")
    @TableField("username")
    private String username;

    @Schema(description = "数据库密码")
    @TableField("password")
    private String password;

    @Schema(description = "是否启用")
    @TableField("enabled")
    private Boolean enabled;
}
