declare interface ConfigState {
    isCollapse: boolean // 是否折叠侧边栏
    settingDrawer: boolean // 是否显示设置抽屉
    themeConfig: ThemeConfigState
}

// 布局配置
declare interface ThemeConfigState {
    projectName: string
    primaryColor: string // 主题颜色
    isDark: boolean // 是否开启暗黑模式
    layout: string // 布局切换
    size: string // 组件大小
    showFooter: boolean // 是否显示页脚
    isTagsView: boolean // 是否开启 isTagsView
    showLogo: boolean // 是否显示 logo
    iconSize: number // 图标大小
}

// 标签
declare interface TagsViewListState<T = any> {
    tagsViewRoutes: Array<TagViewState>
    tagsViewList: Array<TagViewState>
    active: string
}

// 标签内容
declare interface TagViewState<T = any> {
    id: string
    parentId: string
    name: string
    path: string
    meta: {
        title: string
        icon: boolean
        isHide: boolean
        isKeepAlive: boolean
        isIframe: boolean
        isAffix: boolean
        isLink: string
    }
    componentName: string

    [key: string]: T
}

// 路由缓存列表
declare interface KeepAliveNamesState {
    keepAliveNames: string[]
    cachedViews: string[]
}

// 后端返回原始路由(未处理时)
declare interface RequestOldRoutesState {
    requestOldRoutes: string[]
}

// TagsView 路由列表
declare interface TagsViewRoutesState<T = any> {
    tagsViewRoutes: T[]
    isTagsViewCurrenFull: boolean
}

// 路由列表
declare interface RoutesListState<T = any> {
    requestOldRoutes: T[]
    routesList: T[]
    isColumnsMenuHover: boolean
    isColumnsNavHover: boolean
}
