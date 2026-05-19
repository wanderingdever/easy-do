import request from '@/utils/request'

/**
 * 数据库连接配置相关 API
 */
export function dbApi() {
    return {
        /**
         * 分页查询数据库连接配置
         */
        page: (data: object) => {
            return request.post('/db/page', data)
        },
        /**
         * 根据 ID 查询数据库连接配置详情
         */
        get: (id: string) => {
            return request.get('/db/get/' + id)
        },
        /**
         * 新增数据库连接配置
         */
        add: (data: object) => {
            return request.post('/db/add', data)
        },
        /**
         * 更新数据库连接配置
         */
        update: (data: object) => {
            return request.post('/db/update', data)
        },
        /**
         * 删除数据库连接配置
         */
        del: (data: object) => {
            return request.post('/db/del', data)
        },
        /**
         * 批量删除数据库连接配置
         */
        delBatch: (data: object) => {
            return request.post('/db/del_batch', data)
        },
        /**
         * 根据配置 ID 测试数据库连接
         */
        testById: (data: object) => {
            return request.post('/db/test_connection/id', data)
        },
        /**
         * 根据配置信息测试数据库连接
         */
        test: (data: object) => {
            return request.post('/db/test_connection', data)
        }
    }
}
