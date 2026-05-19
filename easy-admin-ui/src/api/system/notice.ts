import request from '@/utils/request'

/**
 * 公告相关 API
 */
export function noticeApi() {
    return {
        page: (data: object) => request.post('/notice/page', data),
        userPage: (data: object) => request.post('/notice/user/page', data),
        add: (data: object) => request.post('/notice/add', data),
        update: (data: object) => request.post('/notice/update', data),
        publish: (data: object) => request.post('/notice/publish', data),
        revoke: (data: object) => request.post('/notice/revoke', data),
        delete: (data: object) => request.post('/notice/delete', data),
        detail: (id: string | number) => request.get('/notice/detail/' + id),
        read: (data: object) => request.post('/notice/read', data),
        // 以下接口将在未读提醒与批量操作中使用（后端缺失时将同步补充）
        unreadCount: () => request.get('/notice/unread/count'),
        unreadList: (params?: Record<string, any>) => request.get('/notice/unread/list', {params}),
        batchRead: (data: object) => request.post('/notice/read/batch', data),
        readAll: () => request.post('/notice/read/all'),
        batchDelete: (data: object) => request.post('/notice/delete/batch', data),
        deleteAll: () => request.post('/notice/delete/all')
    }
}
