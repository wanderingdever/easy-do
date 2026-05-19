import request from '@/utils/request'

export function authApi() {
    return {
        getVerificationCode: () => {
            return request.get('/code', {responseType: 'blob'})
        },
        login: (data: object) => {
            return request.post('/login', data)
        },
        getRouter: () => {
            return request.get('/menu/user_router')
        },
        // 退出登录
        logout: () => {
            return request.get('/logout')
        },
        // 发送邮箱验证码
        sendEmailCode: (data: object) => {
            return request.post('/mail/code', data)
        }
    }
}
