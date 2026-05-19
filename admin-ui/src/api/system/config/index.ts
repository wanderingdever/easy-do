import request from '@/utils/request'

/**
 *用户相关api
 */
export function configApi() {
    return {
        get: (key: string) => {
            return request.get('/config/get', {params: {configKey: key}})
        },
        page: (data: object) => {
            return request.post('/config/page', data)
        },
        add: (data: object) => {
            return request.post('/config/add', data)
        },
        update: (data: object) => {
            return request.post('/config/update', data)
        },
        delete: (data: object) => {
            return request.post('/config/del', data)
        }
    }
}
