package com.easy.start.context;

import com.zaxxer.hikari.HikariDataSource;

import java.time.LocalDateTime;

/**
 * 动态数据源上下文
 */
public record DataSourceContext(HikariDataSource dataSource, LocalDateTime updateTime) {
}
