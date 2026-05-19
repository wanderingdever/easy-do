import request from '@/utils/request'

/**
 *用户相关api
 */
export function userApi() {
    return {
        userInfo: () => {
            return request.post('/user/user_info')
        },
        // 获取用户详情
        getUserInfo: (id: string) => {
            return request.get('/user/get/' + id)
        },
        page: (data: object) => {
            return request.post('/user/page', data)
        },
        // 新增用户
        addUser: (data: object) => {
            return request.post('/user/add', data)
        },
        // 更新用户
        updateUser: (data: object) => {
            return request.post('/user/update', data)
        },
        // 删除用户
        delUser: (data: object) => {
            return request.post('/user/del', data)
        },
        // 重置密码
        resetPwd: (data: object) => {
            return request.post('/user/reset_password', data)
        },
        // 变更密码
        changePassword: (data: object) => {
            return request.post('/user/change_password', data)
        },
        // 获取手机号
        getPhone: (id: string) => {
            return request.get('/user/get_phone/' + id)
        },
        // 绑定邮箱
        bindEmail: (data: object) => {
            return request.post('/user/bind_email', data)
        },
    }
}
