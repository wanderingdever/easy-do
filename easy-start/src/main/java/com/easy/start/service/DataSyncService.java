package com.easy.start.service;

import cn.hutool.core.date.DatePattern;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.easy.core.exception.CustomizeException;
import com.easy.start.bean.dto.DataSyncRequest;
import com.easy.start.bean.dto.DataSyncResult;
import com.easy.start.bean.entity.sys.SysDbConnectionConfig;
import com.easy.start.config.CacheConfig;
import com.easy.start.context.DataSourceContext;
import com.easy.start.dao.sys.SysDbConnectionConfigMapper;
import com.easy.start.enums.DatabaseType;
import com.easy.start.utils.SqlIdentifierUtil;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class DataSyncService {

    private final SysDbConnectionConfigMapper dbConnectionConfigMapper;

    // 注入 Spring 统一缓存管理器
    private final CacheManager cacheManager;

    private static final int BATCH_SIZE = 1000;

    public DataSyncResult sync(DataSyncRequest data) {
        validateRequestParam(data);
        SysDbConnectionConfig dbConfig = getAndValidateDbConfig(data.getSecretKey());
        DatabaseType databaseType = DatabaseType.from(dbConfig.getDbType());

        log.info("同步数据到数据库: {}，表名: {}，数据量: {}，备注: {}", dbConfig.getDatabaseName(), data.getTableName(), data.getRecords().size(), data.getRemark());

        List<String> columns = resolveColumns(data.getRecords());
        String sql = buildInsertSql(data.getTableName(), columns, databaseType);

        DataSource dataSource = getOrCreateDataSource(dbConfig, databaseType);
        int insertedCount = executeBatchInsert(dataSource, sql, columns, data.getRecords(), dbConfig);

        return DataSyncResult.builder()
                .dbType(databaseType.name())
                .databaseName(dbConfig.getDatabaseName())
                .tableName(data.getTableName())
                .insertedCount(insertedCount)
                .build();
    }

    /**
     * 获取或创建动态数据源 (基于 Spring Cache API)
     */
    private DataSource getOrCreateDataSource(SysDbConnectionConfig dbConfig, DatabaseType databaseType) {
        String secretKey = dbConfig.getSecretKey();

        // 1. 获取我们专门配置的动态数据源缓存区域
        Cache cache = cacheManager.getCache(CacheConfig.DYNAMIC_DB_CACHE);
        if (cache == null) {
            throw new CustomizeException("系统缓存配置异常");
        }

        // 2. 查看当前是否有缓存
        DataSourceContext existingCtx = cache.get(secretKey, DataSourceContext.class);

        // 3. 核心：如果发现数据库密码/地址被修改，主动踢出旧缓存（这会触发 Config 里的 close()）
        if (existingCtx != null && !existingCtx.updateTime().equals(LocalDateTime.parse(dbConfig.getUpdateTime(), DatePattern.NORM_DATETIME_FORMATTER))) {
            log.info("检测到数据库配置更新，主动从 Spring Cache 踢出旧数据源: {}", secretKey);
            cache.evict(secretKey);
            existingCtx = null;
        }

        // 4. 并发安全的获取或加载
        // cache.get(key, Callable) 是 Spring 提供的高级方法，底层封装了线程安全的 computeIfAbsent
        if (existingCtx == null) {
            existingCtx = cache.get(secretKey, () -> createNewDataSource(dbConfig, databaseType));
        }

        return existingCtx.dataSource();
    }

    /**
     * 构建全新配置的 HikariDataSource
     */
    private DataSourceContext createNewDataSource(SysDbConnectionConfig dbConfig, DatabaseType databaseType) {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setJdbcUrl(buildJdbcUrl(dbConfig, databaseType));
        hikariConfig.setUsername(dbConfig.getUsername());
        hikariConfig.setPassword(dbConfig.getPassword());

        // 连接池防爆调优
        hikariConfig.setMaximumPoolSize(5);
        hikariConfig.setMinimumIdle(0); // 空闲自动归零，不占物理连接
        hikariConfig.setIdleTimeout(180000); // 3分钟闲置断开物理 TCP
        hikariConfig.setConnectionTimeout(10000);

        HikariDataSource newDataSource = new HikariDataSource(hikariConfig);
        log.info("已初始化并存入 Spring Cache 新数据源连接池: {}", dbConfig.getSecretKey());
        return new DataSourceContext(newDataSource, LocalDateTime.parse(dbConfig.getUpdateTime(), DatePattern.NORM_DATETIME_FORMATTER));
    }

    /**
     * 【对外开放的方法：后台删除数据库配置时调用】
     * 业务系统中如果管理员删除了某条配置，调用此方法清理内存与连接
     */
    public void evictDataSource(String secretKey) {
        Cache cache = cacheManager.getCache(CacheConfig.DYNAMIC_DB_CACHE);
        if (cache != null) {
            cache.evict(secretKey); // 主动驱逐，触发底层 close()
        }
    }

    /**
     * 执行分批插入操作 (Chunk Processing)
     */
    private int executeBatchInsert(DataSource dataSource,
                                   String sql,
                                   List<String> columns,
                                   List<Map<String, Object>> records,
                                   SysDbConnectionConfig dbConfig) {
        // 从连接池获取连接
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                int totalInserted = 0;

                for (int i = 0; i < records.size(); i++) {
                    Map<String, Object> record = records.get(i);
                    for (int j = 0; j < columns.size(); j++) {
                        preparedStatement.setObject(j + 1, record.get(columns.get(j)));
                    }
                    preparedStatement.addBatch();

                    // 满一批次，或者达到最后一条时，执行提交
                    if ((i + 1) % BATCH_SIZE == 0 || i == records.size() - 1) {
                        int[] result = preparedStatement.executeBatch();
                        // 累计成功条数
                        for (int value : result) {
                            if (value == Statement.SUCCESS_NO_INFO || value > 0) {
                                totalInserted++;
                            }
                        }
                        preparedStatement.clearBatch(); // 清理上一批的内存
                    }
                }

                connection.commit();
                // 在 MySQL rewriteBatchedStatements 模式下，返回值可能并不是实际影响行数，这里做个保底取最大值
                return Math.max(totalInserted, records.size());

            } catch (SQLException ex) {
                connection.rollback();
                throw ex;
            }
        } catch (SQLException ex) {
            log.error("数据同步失败，sql={}, database={}", sql, dbConfig.getDatabaseName(), ex);
            throw new CustomizeException("数据写入失败: " + ex.getMessage());
        }
    }

    private String buildJdbcUrl(SysDbConnectionConfig dbConfig, DatabaseType databaseType) {
        return switch (databaseType) {
            // [核心优化]: 追加 rewriteBatchedStatements=true 开启 MySQL 真正的高性能批处理
            case MYSQL -> "jdbc:mysql://" + dbConfig.getHost() + ":" + dbConfig.getPort() + "/" +
                    dbConfig.getDatabaseName() +
                    "?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
            // PgSQL 通常通过 reWriteBatchedInserts 开启批处理重写
            case POSTGRESQL -> "jdbc:postgresql://" + dbConfig.getHost() + ":" + dbConfig.getPort() + "/" +
                    dbConfig.getDatabaseName() +
                    "?reWriteBatchedInserts=true";
        };
    }

    private void validateRequestParam(DataSyncRequest data) {
        SqlIdentifierUtil.validate(data.getTableName(), "tableName");
        if (CollectionUtils.isEmpty(data.getRecords())) {
            throw new CustomizeException("records 不能为空");
        }
    }

    private SysDbConnectionConfig getAndValidateDbConfig(String secretKey) {
        // ... (保持你原有的逻辑不变)
        SysDbConnectionConfig dbConfig = dbConnectionConfigMapper.selectOne(new LambdaQueryWrapper<SysDbConnectionConfig>()
                .eq(SysDbConnectionConfig::getSecretKey, secretKey)
                .eq(SysDbConnectionConfig::getEnabled, 1)
                .orderByDesc(SysDbConnectionConfig::getUpdateTime)
                .last("LIMIT 1"));

        if (dbConfig == null) throw new CustomizeException("secretKey 无效或已被禁用: " + secretKey);
        if (isBlank(dbConfig.getHost()) || dbConfig.getPort() == null || isBlank(dbConfig.getDatabaseName())
                || isBlank(dbConfig.getUsername())) {
            throw new CustomizeException("数据库配置不完整，请检查系统库中的连接信息");
        }
        return dbConfig;
    }

    private List<String> resolveColumns(List<Map<String, Object>> records) {
        // ... (保持你原有的逻辑不变)
        LinkedHashSet<String> allColumns = new LinkedHashSet<>();
        for (Map<String, Object> record : records) {
            if (record != null) {
                allColumns.addAll(record.keySet());
            }
        }
        if (allColumns.isEmpty()) throw new CustomizeException("records 中未发现可写入字段");

        List<String> columns = new ArrayList<>(allColumns);
        columns.forEach(column -> SqlIdentifierUtil.validate(column, "column"));
        return columns;
    }

    private String buildInsertSql(String tableName, List<String> columns, DatabaseType databaseType) {
        // ... (保持你原有的逻辑不变)
        String quotedTableName = quoteIdentifier(tableName, databaseType);
        StringJoiner columnJoiner = new StringJoiner(",");
        StringJoiner placeholderJoiner = new StringJoiner(",");

        for (String column : columns) {
            columnJoiner.add(quoteIdentifier(column, databaseType));
            placeholderJoiner.add("?");
        }
        return "INSERT INTO " + quotedTableName + " (" + columnJoiner + ") VALUES (" + placeholderJoiner + ")";
    }

    private String quoteIdentifier(String identifier, DatabaseType databaseType) {
        return switch (databaseType) {
            case MYSQL -> "`" + identifier + "`";
            case POSTGRESQL -> "\"" + identifier + "\"";
        };
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}