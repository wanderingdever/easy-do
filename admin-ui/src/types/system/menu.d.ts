// 菜单管理
declare interface MenuForm {
    parentIdList: string[] // 上级菜单
    parentId: string
    menuName: string | null // 路由名称
    menuType: string // 菜单类型
    component: string | null // 组件路径
    redirect: string | null // 路由重定向，有子集 children 时
    isLink: boolean | null // 是否外链
    orderNum: number // 菜单排序
    path: string | null // 路由路径
    icon: string // 菜单图标
    isHide: boolean | null // 是否隐藏
    isKeepAlive: boolean | null // 是否缓存
    isAffix: boolean | null // 是否固定
    link: string | null // 外链/内嵌时链接地址（http:xxx.com），开启外链条件，`1、isLink: 链接地址不为空`
    isIframe: boolean | null // 是否内嵌，开启条件，`1、isIframe:true 2、isLink：链接地址不为空`
    enable: boolean | null // 是否启用
    perms: string | null // 权限标识，取角色管理
}

declare interface MenuTree extends RowBase {
    id: string
    menuName: string
    parentId: string
    orderNum: number
    path: string
    component: string
    redirect: string | null
    menuType: string
    isIframe: boolean
    isAffix: boolean
    isLink: string | null
    link: string | null
    isHide: string | null
    isKeepAlive: boolean
    perms: string | null
    icon: string | null
    enable: boolean
    children: MenuTree[] | null
}
