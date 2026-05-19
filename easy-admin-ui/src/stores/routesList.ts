import {defineStore} from 'pinia'

/**
 * 路由列表
 * @methods setRoutesList 设置路由数据
 * @methods setColumnsMenuHover 设置分栏布局菜单鼠标移入 boolean
 * @methods setColumnsNavHover 设置分栏布局最左侧导航鼠标移入 boolean
 */
export const useRoutesList = defineStore('routesList', {
    state: (): RoutesListState => ({
        requestOldRoutes: [],
        routesList: [],
        isColumnsMenuHover: false,
        isColumnsNavHover: false
    }),
    actions: {
        async setRequestOldRoutes(routes: Array<string>) {
            this.requestOldRoutes = routes
        },
        async setRoutesList(data: Array<any>) {
            this.routesList = data
        },
        async setColumnsMenuHover(bool: boolean) {
            this.isColumnsMenuHover = bool
        },
        async setColumnsNavHover(bool: boolean) {
            this.isColumnsNavHover = bool
        }
    }
})
