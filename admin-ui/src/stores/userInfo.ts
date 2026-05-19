import {defineStore} from 'pinia'
import {Session} from '@/utils/storage'
import {userApi} from '@/api/system/user'
import {authApi} from '@/api/auth.ts'
import {ElMessage} from 'element-plus'

/**
 * 用户信息
 * @methods setUserInfos 设置用户信息
 */
export const useUserInfo = defineStore('userInfo', {
    state: (): UserInfosState => ({
        userInfo: {
            userId: '',
            userInfoId: '',
            orgId: '',
            username: '',
            avatar: '',
            phone: '',
            email: '',
            nickname: '',
            sex: '',
            client: '',
            createTime: '',
            status: '',
            roleKeyList: [],
            roleList: [],
            permissionList: [],
            ip: '',
            ipLocation: '',
            loginTime: ''
        }
    }),
    actions: {
        async setUserInfos() {
            // 存储用户信息到浏览器缓存
            const userInfoData = await userApi().userInfo()
            this.userInfo = userInfoData.data
            Session.set('userInfo', this.userInfo)
        },
        // 退出登录
        async logout() {
            await authApi()
                .logout()
                .then(() => {
                    ElMessage.success('退出成功')
                    // 清除缓存/token等
                    Session.clear()
                    // 使用 reload 时，不需要调用 resetRoute() 重置路由
                    window.location.reload()
                })
        }
    },
    persist: true
})
