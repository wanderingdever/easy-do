import request from '@/utils/request'

/**
 *角色相关api
 */
export function roleApi() {
    return {
        page: (data: object) => {
            return request.post('/role/page', data)
        },
        add: (data: object) => {
            return request.post('/role/add', data)
        },
        update: (data: object) => {
            return request.post('/role/update', data)
        },
        delete: (data: object) => {
            return request.post('/role/del', data)
        },
        // 获取角色信息
        roleMenuIds: (data: object) => {
            return request.post('/role/role_menu_ids', data)
        }
    }
}
