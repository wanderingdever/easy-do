package com.easy.start.config;

import com.easy.start.context.DataSourceContext;
import com.github.benmanes.caffeine.cache.Caffeine;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.caffeine.CaffeineCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

@Slf4j
@Configuration
public class CacheConfig {
    public static final String DYNAMIC_DB_CACHE = "dynamicDataSources";

    @Bean()
    public CaffeineCacheManager cacheManager() {
        CaffeineCacheManager cacheManager = new CaffeineCacheManager();

        // 1. 全局默认缓存配置（应用中如果别的业务用 @Cacheable，将默认走这个配置）
        cacheManager.setCaffeine(Caffeine.newBuilder().expireAfterWrite(60, TimeUnit.MINUTES));

        // 2. 针对动态数据源，单独定制带有资源销毁监听器 (removalListener) 的缓存
        com.github.benmanes.caffeine.cache.Cache<Object, Object> dataSourceCache = Caffeine.newBuilder()
                .expireAfterAccess(30, TimeUnit.MINUTES) // 30分钟无同步请求自动过期
                .removalListener((key, value, cause) -> {
                    // 当缓存被 Spring 移除（过期、主动 evict 时），强制释放数据库连接！
                    if (value instanceof DataSourceContext context && context.dataSource() != null) {
                        context.dataSource().close();
                        log.info("Spring Cache 触发自动清理: 已彻底释放失效的数据源连接池: {}, 移除原因: {}", key, cause);
                    }
                })
                .build();

        // 3. 将我们定制的专门用于连接池的 Cache 注入到 Spring 的缓存管理器中
        cacheManager.registerCustomCache(DYNAMIC_DB_CACHE, dataSourceCache);

        return cacheManager;
    }
}
