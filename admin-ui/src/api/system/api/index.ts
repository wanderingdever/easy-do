import request from '@/utils/request'

/**
 * api管理相关api
 */
export function apiApi() {
    return {
        get: (key: string) => {
            return request.get('/api_manage/get', {params: {configKey: key}})
        },
        page: (data: object) => {
            return request.post('/api_manage/page', data)
        },
        add: (data: object) => {
            return request.post('/api_manage/add', data)
        },
        update: (data: object) => {
            return request.post('/api_manage/update', data)
        },
        delete: (data: object) => {
            return request.post('/api_manage/del', data)
        },
        getList: (data?: object) => {
            return request.post('/api_manage/list', data)
        }
    }
}
