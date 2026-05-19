import request from '@/utils/request'

/**
 * 字典
 */
export function dictApi() {
    return {
        pageType: (data: object) => {
            return request.post('/dict/type_page', data)
        },
        addType: (data: object) => {
            return request.post('/dict/type_add', data)
        },
        updateType: (data: object) => {
            return request.post('/dict/type_update', data)
        },
        deleteType: (data: object) => {
            return request.post('/dict/type_del', data)
        },
        pageData: (data: object) => {
            return request.post('/dict/data_page', data)
        },
        addData: (data: object) => {
            return request.post('/dict/data_add', data)
        },
        updateData: (data: object) => {
            return request.post('/dict/data_update', data)
        },
        deleteData: (data: object) => {
            return request.post('/dict/data_del', data)
        },
        typeAndDataList: (data: object) => {
            return request.post('/dict/type_data_list', data)
        }
    }
}
