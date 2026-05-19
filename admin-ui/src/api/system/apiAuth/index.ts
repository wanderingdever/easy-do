import request from '@/utils/request'

/**
 * api授权管理相关api
 */
export function apiAuthApi() {
    return {
        init: () => {
            return request.get('/api_auth/init_appid')
        },
        get: (data: object) => {
            return request.post('/api_auth/get', data)
        },
        applyApi: (data: object) => {
            return request.post('/api_auth/apply_api', data)
        },
        applyFor: (data: object) => {
            return request.post('/api_auth/apply_for', data)
        }
    }
}
