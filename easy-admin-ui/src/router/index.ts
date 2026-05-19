import {createRouter, createWebHistory} from 'vue-router'
import {notFoundAndNoPower, staticRoutes} from '@/router/routes'
import NProgress from 'nprogress'
import {Session} from '@/utils/storage.ts'
import {useRoutesList} from '@/stores/routesList.ts'
import pinia from '@/stores'
import {storeToRefs} from 'pinia'
import {initRouter} from '@/router/init.ts'

export const router = createRouter({
    history: createWebHistory(import.meta.env.VITE_PUBLIC_PATH),
    routes: [...staticRoutes, ...notFoundAndNoPower]
})

router.beforeEach(async (to, from, next) => {
    NProgress.configure({showSpinner: false})
    if (to.meta.title) NProgress.start()
    const token = Session.get('token')
    if (to.path === '/login' && !token) {
        next()
        NProgress.done()
    } else {
        if (!token) {
            next(`/login?redirect=${to.path}&params=${JSON.stringify(to.query ? to.query : to.params)}`)
            Session.clear()
            NProgress.done()
        } else if (token && to.path === '/login') {
            next('/')
            NProgress.done()
        } else {
            const storesRoutesList = useRoutesList(pinia)
            const {routesList} = storeToRefs(storesRoutesList)
            if (routesList.value.length === 0) {
                if (routesList.value.length === 0) {
                    // 后端控制路由：路由数据初始化，防止刷新时丢失
                    await initRouter()
                    // 解决刷新时，一直跳 404 页面问题，关联问题 No match found for location with path 'xxx'
                    // to.query 防止页面刷新时，普通路由带参数时，参数丢失。动态路由（xxx/:id/:name"）isDynamic 无需处理
                    next({path: to.path, query: to.query})
                } else {
                    next()
                }
            } else {
                next()
            }
        }
    }
})
router.afterEach(() => {
    NProgress.done()
})

export default router
