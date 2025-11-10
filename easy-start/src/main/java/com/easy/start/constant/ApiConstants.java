package com.easy.start.constant;

/**
 * </p>
 *
 * @author Matt
 */
public interface ApiConstants {

    /*
     * 签名key
     */
    String SIGN_KEY = "signParam";

    /*
     * 预生成的appid redis key
     */
    String APPID_REDIS_KEY = "pre_generation_api_appid:";

    /**
     * 用户api权限信息redis key
     */
    String USER_API_AUTH_INFO_REDIS_KEY = "user_api_auth_info:";

    /**
     * api信息redis key
     */
    String OPEN_API_INFO_REDIS_KEY = "open_api_info:";

    /**
     * 请求id
     */
    String REQUEST_ID = "api-request-id";

    /**
     * 请求url日限制次数
     */
    String REQUEST_URL_DAY_LIMIT = "request_url_day_limit:";

    /**
     * 请求url日限制
     */
    String REQUEST_URL_DAY_LIMIT_COUNT = "request_url_day_limit_count";

    /**
     * 缓存key
     */
    String API_CACHE_KEY = "appid_api_cache";
}