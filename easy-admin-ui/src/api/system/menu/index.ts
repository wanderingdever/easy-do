import request from '@/utils/request'

export function menuApi() {
    return {
        tree: (data: object) => {
            return request.post('/menu/tree', data)
        },
        add: (data: object) => {
            return request.post('/menu/add', data)
        },
        update: (data: object) => {
            return request.post('/menu/update', data)
        },
        delete: (data: object) => {
            return request.post('/menu/del', data)
        }
    }
}
