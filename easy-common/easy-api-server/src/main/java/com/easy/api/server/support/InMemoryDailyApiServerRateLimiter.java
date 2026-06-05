package com.easy.api.server.support;

import com.easy.api.server.exception.ApiServerErrorCode;
import com.easy.api.server.exception.ApiServerException;
import com.easy.api.server.model.ApiServerApiInfo;
import com.easy.api.server.model.ApiServerAuthInfo;
import com.easy.api.server.spi.ApiServerRateLimiter;
import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDate;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 单机内存版每日限流器。
 * <p>
 * 该实现适合本地开发和单实例部署；多实例生产环境应实现 {@code ApiServerRateLimiter} 替换为分布式限流。
 */
public class InMemoryDailyApiServerRateLimiter implements ApiServerRateLimiter {

    /**
     * key 格式：yyyy-MM-dd:appId:apiPath。
     */
    private final ConcurrentMap<String, AtomicInteger> counters = new ConcurrentHashMap<>();

    @Override
    public void check(ApiServerAuthInfo authInfo, ApiServerApiInfo apiInfo, HttpServletRequest request) {
        if (apiInfo.getLimitNum() <= 0) {
            return;
        }
        String key = LocalDate.now() + ":" + authInfo.getAppId() + ":" + apiInfo.getPath();
        int count = counters.computeIfAbsent(key, ignored -> new AtomicInteger()).incrementAndGet();
        if (count > apiInfo.getLimitNum()) {
            throw new ApiServerException(ApiServerErrorCode.REQUEST_LIMIT_ERROR);
        }
        clearExpiredCounters(LocalDate.now().toString());
    }

    /**
     * 清理非当天的计数，避免长期运行时内存持续增长。
     */
    private void clearExpiredCounters(String today) {
        counters.keySet().removeIf(key -> !Objects.equals(today, key.substring(0, key.indexOf(':'))));
    }
}
