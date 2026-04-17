package com.easy.start.service.sys;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.start.bean.dto.sys.db.DbDTO;
import com.easy.start.bean.dto.sys.db.DbSearchDTO;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.bean.vo.sys.db.DbTestResultVO;
import com.easy.start.dao.sys.SysDbConnectionConfigMapper;
import com.easy.start.enums.DatabaseType;
import com.easy.tool.lang.StringUtils;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.List;

/**
 * 数据库连接配置服务实现类
 * </p>
 * 提供数据库连接配置的增删改查业务逻辑
 *
 * @author Matt
 */
@Slf4j
@Service
@AllArgsConstructor
public class SysDbConnectionConfigService extends ServiceImpl<SysDbConnectionConfigMapper, SysDbConnectionConfig> {

    /**
     * 分页查询数据库连接配置
     *
     * @param searchDTO 查询条件
     * @return 分页数据
     */
    public Page<SysDbConnectionConfig> pageDb(DbSearchDTO searchDTO) {
        // 构建分页查询条件
        return lambdaQuery()
                .eq(StringUtils.isNotBlank(searchDTO.getId()), SysDbConnectionConfig::getId, searchDTO.getId())
                .like(StringUtils.isNotBlank(searchDTO.getHost()), SysDbConnectionConfig::getHost, searchDTO.getHost())
                .like(StringUtils.isNotBlank(searchDTO.getDbName()), SysDbConnectionConfig::getDatabaseName, searchDTO.getDbName())
                .like(StringUtils.isNotBlank(searchDTO.getDbKey()), SysDbConnectionConfig::getSecretKey, searchDTO.getDbKey())
                .eq(searchDTO.getEnable() != null, SysDbConnectionConfig::getEnabled, searchDTO.getEnable())
                .page(PageUtils.getPage(searchDTO));
    }

    /**
     * 新增数据库连接配置
     *
     * @param dto 数据库连接配置信息
     * @return 新增成功的配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public String addDb(DbDTO dto) {
        // 校验：新增操作id必须为空
        if (StringUtils.isNotBlank(dto.getId())) {
            throw new CustomizeException("新增操作不能指定ID");
        }

        // 校验secretKey是否已存在
        long count = lambdaQuery()
                .eq(SysDbConnectionConfig::getSecretKey, dto.getSecretKey())
                .count();
        if (count > 0) {
            throw new CustomizeException("数据库连接配置ID已存在");
        }

        // 创建实体并保存
        SysDbConnectionConfig entity = new SysDbConnectionConfig();
        BeanUtil.copyProperties(dto, entity);
        save(entity);

        return entity.getId();
    }

    /**
     * 更新数据库连接配置
     *
     * @param dto 数据库连接配置信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDb(DbDTO dto) {
        // 校验：更新操作id不能为空
        if (StringUtils.isBlank(dto.getId())) {
            throw new CustomizeException("更新操作ID不能为空");
        }

        // 校验数据是否存在
        SysDbConnectionConfig existing = getById(dto.getId());
        if (existing == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }
        // 更新实体
        SysDbConnectionConfig entity = new SysDbConnectionConfig();
        BeanUtil.copyProperties(dto, entity);
        updateById(entity);
    }

    /**
     * 删除数据库连接配置
     *
     * @param id 配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteDb(String id) {
        // 校验数据是否存在
        SysDbConnectionConfig existing = getById(id);
        if (existing == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }

        // 删除数据
        removeById(id);
    }

    /**
     * 批量删除数据库连接配置
     *
     * @param idList 配置ID列表
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatch(List<String> idList) {
        // 批量删除
        removeByIds(idList);
    }

    /**
     * 根据ID查询数据库连接配置详情
     *
     * @param id 配置ID
     * @return 数据库连接配置详情
     */
    public SysDbConnectionConfig getDbById(String id) {
        SysDbConnectionConfig config = getById(id);
        if (config == null) {
            throw new CustomizeException("数据库连接配置不存在");
        }
        return config;
    }

    /**
     * 测试数据库连接
     * </p>
     * 创建临时连接池测试数据库连接是否可用，测试完成后立即关闭连接池释放资源
     *
     * @param dto 数据库连接配置信息
     * @return 测试结果
     */
    public DbTestResultVO testConnection(DbDTO dto) {
        DbTestResultVO result = new DbTestResultVO();
        long startTime = System.currentTimeMillis();

        try {
            // 验证数据库类型是否支持
            DatabaseType databaseType = DatabaseType.from(dto.getDbType());

            // 构建 JDBC URL
            String jdbcUrl = buildJdbcUrl(dto, databaseType);

            // 创建临时 HikariDataSource 连接池（使用 try-with-resources 确保资源释放）
            HikariConfig hikariConfig = new HikariConfig();
            hikariConfig.setJdbcUrl(jdbcUrl);
            hikariConfig.setUsername(dto.getUsername());
            hikariConfig.setPassword(dto.getPassword());
            // 连接池配置：测试场景下的优化设置
            hikariConfig.setMaximumPoolSize(1); // 测试只需一个连接
            hikariConfig.setMinimumIdle(0); // 不保持空闲连接
            hikariConfig.setConnectionTimeout(10000); // 10秒连接超时
            hikariConfig.setIdleTimeout(0); // 不保持空闲连接

            try (HikariDataSource dataSource = new HikariDataSource(hikariConfig);
                 Connection connection = dataSource.getConnection()) {

                // 执行测试 SQL（验证连接可用性）
                connection.createStatement().executeQuery("SELECT 1");

                // 获取数据库元数据
                DatabaseMetaData metaData = connection.getMetaData();
                String databaseProductName = metaData.getDatabaseProductName();
                String databaseVersion = metaData.getDatabaseProductVersion();

                // 计算连接耗时
                long connectionTime = System.currentTimeMillis() - startTime;

                // 构建成功结果
                result.setSuccess(true);
                result.setMessage("连接成功");
                result.setConnectionTime(connectionTime);
                result.setDatabaseProductName(databaseProductName);
                result.setDatabaseVersion(databaseVersion);
                result.setJdbcUrl(jdbcUrl);

                log.info("数据库连接测试成功: dbType={}, database={}, time={}ms",
                        dto.getDbType(), dto.getDatabaseName(), connectionTime);
            }

        } catch (CustomizeException e) {
            // 业务异常（如不支持的数据库类型）
            long connectionTime = System.currentTimeMillis() - startTime;
            result.setSuccess(false);
            result.setMessage(e.getMessage());
            result.setConnectionTime(connectionTime);
            log.error("数据库连接测试失败: {}", e.getMessage());
        } catch (SQLException e) {
            // SQL 异常（连接失败、认证失败等）
            long connectionTime = System.currentTimeMillis() - startTime;
            result.setSuccess(false);
            result.setMessage("连接失败: " + e.getMessage());
            result.setConnectionTime(connectionTime);
            log.error("数据库连接测试失败: dbType={}, host={}, database={}",
                    dto.getDbType(), dto.getHost(), dto.getDatabaseName(), e);
        } catch (Exception e) {
            // 其他异常
            long connectionTime = System.currentTimeMillis() - startTime;
            result.setSuccess(false);
            result.setMessage("测试异常: " + e.getMessage());
            result.setConnectionTime(connectionTime);
            log.error("数据库连接测试异常", e);
        }

        return result;
    }

    /**
     * 构建 JDBC 连接 URL
     *
     * @param dto          数据库连接配置
     * @param databaseType 数据库类型
     * @return JDBC URL
     */
    private String buildJdbcUrl(DbDTO dto, DatabaseType databaseType) {
        return switch (databaseType) {
            case MYSQL -> "jdbc:mysql://" + dto.getHost() + ":" + dto.getPort() + "/" +
                    dto.getDatabaseName() +
                    "?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai";
            case POSTGRESQL -> "jdbc:postgresql://" + dto.getHost() + ":" + dto.getPort() + "/" +
                    dto.getDatabaseName();
        };
    }
}
