import {Session} from '@/utils/storage.ts'
import {authApi} from '@/api/auth.ts'
import {ElMessageBox} from 'element-plus'
import {useRoutesList} from '@/stores/routesList.ts'
import {dynamicRoutes, notFoundAndNoPower} from '@/router/routes.ts'
import router from '@/router/index.ts'
import pinia from '@/stores'
import {RouteRecordRaw} from 'vue-router'
import {useKeepAliveNames} from '@/stores/keepAliveNames.ts'
import {useUserInfo} from '@/stores/userInfo.ts'
import {useDictStore} from '@/stores/dict.ts'
import {useTagsView} from '@/stores/tagsView.ts'

export async function initRouter() {
    // 无 token 停止执行下一步
    if (!Session.get('token')) return false
    await useUserInfo().setUserInfos()
    await useDictStore().setDict()
    // 获取路由菜单数据
    const res = await getBackEndControlRoutes()
    // 无登录权限时，添加判断
    if (res.length <= 0) return Promise.resolve(true)
    // 存储接口原始路由（未处理component），根据需求选择使用
    await useRoutesList().setRequestOldRoutes(JSON.parse(JSON.stringify(res)))
    dynamicRoutes[0].children = backEndComponent(res)
    // 添加动态路由
    await setAddRoute()
    // 设置路由到 pinia routesList 中（已处理成多级嵌套路由）及缓存多级嵌套数组处理后的一维数组
    await ***REMOVE_SECRET***()
}

/**
 * 设置路由到 pinia routesList 中（已处理成多级嵌套路由）及缓存多级嵌套数组处理后的一维数组
 * @description 用于左侧菜单、横向菜单的显示
 * @description 用于 tagsView、菜单搜索中：未过滤隐藏的(isHide)
 */
export async function ***REMOVE_SECRET***() {
    const storesRoutesList = useRoutesList(pinia)
    await storesRoutesList.setRoutesList(dynamicRoutes[0].children as any)
    setCacheTagsViewRoutes()
}

/**
 * 请求后端路由菜单接口
 * @returns 返回后端路由菜单数据
 */
export async function getBackEndControlRoutes() {
    return authApi()
        .getRouter()
        .then((response: any) => {
            const res = response.data
            if (res.code === 401 || res.code === 11012) {
                Session.clear() // 清除浏览器全部临时缓存
                window.location.href = import.meta.env.VITE_PUBLIC_PATH + '/' // 去登录页
                ElMessageBox.alert('登录失效,请重新登录', '提示', {})
                    .then(() => {
                    })
                    .catch(() => {
                    })
            } else {
                return res
            }
        })
}

/**
 * 获取目录下的 .vue、.tsx 全部文件
 * @method import.meta.glob
 */
const layoutModules: any = import.meta.glob('../layout/routerView/*.{vue,tsx}')
const viewsModules: any = import.meta.glob('../views/**/*.{vue,tsx}')
const dynamicViewsModules: Record<string, Function> = Object.assign({}, {...layoutModules}, {...viewsModules})

/**
 * 后端路由 components 转换
 * @param routes 后端返回的路由表数组
 * @returns 返回处理成函数后的 components
 */
export function backEndComponent(routes: RouteItem[]) {
    if (!routes) return
    return routes.map((item: any) => {
        if (item.component) {
            item.componentName = <string>item.component.split('/').pop()
            item.component = dynamicImport(dynamicViewsModules, item.component as string)
        }
        item.children && backEndComponent(item.children)
        return item
    })
}

/**
 * 添加动态路由
 * @method router.addRoute
 * @description 此处循环为 dynamicRoutes（/@/router/route）第一个顶级 children 的路由一维数组，非多级嵌套
 * @link 参考：https://next.router.vuejs.org/zh/api/#addroute
 */
export async function setAddRoute() {
    await setFilterRouteEnd().forEach((route: RouteRecordRaw) => {
        router.addRoute(route)
    })
}

/**
 * 缓存多级嵌套数组处理后的一维数组
 * @description 用于 tagsView、菜单搜索中：未过滤隐藏的(isHide)
 */
export function setCacheTagsViewRoutes() {
    const storesTagsView = useTagsView(pinia)
    storesTagsView.setTagsViewRoutes(formatTwoStageRoutes(formatFlatteningRoutes(dynamicRoutes))[0].children)
}

/**
 * 处理路由格式及添加捕获所有路由或 404 Not found 路由
 * @description 替换 dynamicRoutes（/@/router/route）第一个顶级 children 的路由
 * @returns 返回替换后的路由数组
 */
export function setFilterRouteEnd() {
    const filterRouteEnd: any = formatTwoStageRoutes(formatFlatteningRoutes(dynamicRoutes))
    // notFoundAndNoPower 防止 404、401 不在 layout 布局中，不设置的话，404、401 界面将全屏显示
    // 关联问题 No match found for location with path 'xxx'
    filterRouteEnd[0].children = [...filterRouteEnd[0].children, ...notFoundAndNoPower]
    return filterRouteEnd
}

/**
 * 后端路由 components 转换函数
 * @param dynamicViewsModules 获取目录下的 .vue、.tsx 全部文件
 * @param component 当前要处理项 components
 * @returns 返回处理成函数后的 components
 */
export function dynamicImport(dynamicViewsModules: Record<string, Function>, component: string) {
    const keys = Object.keys(dynamicViewsModules)
    const matchKeys = keys.filter((key) => {
        const k = key.replace(/..\/views|../, '')
        return k.startsWith(`${component}`) || k.startsWith(`/${component}`)
    })
    if (matchKeys?.length === 1) {
        const matchKey = matchKeys[0]
        return dynamicViewsModules[matchKey]
    }
    if (matchKeys?.length > 1) {
        return false
    }
}

/**
 * 路由多级嵌套数组处理成一维数组
 * @param arr 传入路由菜单数据数组
 * @returns 返回处理后的一维路由菜单数组
 */
export function formatFlatteningRoutes(arr: any) {
    if (arr.length <= 0) return false
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].children) {
            arr = arr.slice(0, i + 1).concat(arr[i].children, arr.slice(i + 1))
        }
    }
    return arr
}

/**
 * 一维数组处理成多级嵌套数组（只保留二级：也就是二级以上全部处理成只有二级，keep-alive 支持二级缓存）
 * @description isKeepAlive 处理 `name` 值，进行缓存。顶级关闭，全部不缓存
 * @link 参考：https://v3.cn.vuejs.org/api/built-in-components.html#keep-alive
 * @param arr 处理后的一维路由菜单数组
 * @returns 返回将一维数组重新处理成 `定义动态路由（dynamicRoutes）` 的格式
 */
export function formatTwoStageRoutes(arr: any) {
    if (arr.length <= 0) return false
    const newArr: any = []
    const cacheList: Array<string> = []
    arr.forEach((v: any) => {
        if (v.path === '/') {
            newArr.push({
                component: v.component,
                componentName: v.componentName,
                name: v.name,
                path: v.path,
                redirect: v.redirect,
                meta: v.meta,
                children: []
            })
        } else {
            // 判断是否是动态路由（xx/:id/:name），用于 tagsView 等中使用
            if (v.path.indexOf('/:') > -1) {
                v.meta['isDynamic'] = true
                v.meta['isDynamicPath'] = v.path
            }
            newArr[0].children.push({...v})
            // 存 name 值，keep-alive 中 include 使用，实现路由的缓存
            // 路径：/@/layout/routerView/parent.vue
            if (newArr[0].meta.isKeepAlive && v.meta.isKeepAlive) {
                // componentName已经在backEndComponent处理过，因为在3.2.34或以上的版本中，使用 <script setup> 的单文件组件会自动根据文件名生成对应的 name 选项，无需再手动声明。
                cacheList.push(v.componentName)
                const keepALive = useKeepAliveNames(pinia)
                keepALive.setCacheKeepAlive(cacheList)
            }
        }
    })
    return newArr
}
