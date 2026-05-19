// 声明一个模块，防止引入文件时报错
declare module '*.json'
declare module '*.png'
declare module '*.jpg'
declare module '*.scss'
declare module '*.ts'
declare module '*.js'

declare module 'js-cookie'
declare module 'qs'

// 声明文件，*.vue 后缀的文件交给 vue 模块来处理
declare module '*.vue' {
    import type {DefineComponent} from 'vue'
    const component: DefineComponent<{}, {}, any>
    export default component
}

// 声明文件，定义环境变量类型
declare interface ImportMetaEnv {
    readonly VITE_ENV: string
    readonly VITE_APP_PORT: number
    readonly VITE_PUBLIC_PATH: string
    readonly VITE_APP_BASE_URL: string
    readonly VITE_APP_BASE_API: string
}

declare interface ImportMeta {
    readonly env: ImportMetaEnv
    glob: (
        pattern: string,
        options?: {
            eager?: boolean
            import?: string
            queries?: Record<string, string | string[]>
        }
    ) => Record<string, () => Promise<unknown>>
}

// 声明文件，定义全局变量
/* eslint-disable */
declare interface Window {
    nextLoading: boolean;
    BMAP_SATELLITE_MAP: any;
    BMap: any;
}

// aside
declare type AsideState = {
    menuList: RouteItem[];
};


// 声明路由当前项类型
declare type RouteItem<T = any> = {
    path: string;
    name?: string | symbol | undefined | null;
    redirect?: string;
    componentName?: string;
    component?: Function;
    k?: T;
    meta: {
        title: string;
        isLink?: string;
        isHide?: boolean;
        isKeepAlive?: boolean;
        isAffix?: boolean;
        isIframe?: boolean;
        roles?: string[];
        icon?: string;
        isDynamic?: boolean;
        isDynamicPath?: string;
        isIframeOpen?: string;
        loading?: boolean;
    };
    children: T[];
    query?: { [key: string]: T };
    params?: { [key: string]: T };
    contextMenuClickId?: string | number;
    commonUrl?: string;
    isFnClick?: boolean;
    url?: string;
    transUrl?: string;
    title?: string;
    id?: string | number;
};

// 声明路由当前项类型集合
declare type RouteItems<T extends RouteItem = any> = T[];


// 声明 ref
declare type RefType<T = any> = T | null

// 声明 HTMLElement
declare type HtmlType = HTMLElement | string | undefined | null

// 申明 数组
declare type EmptyArrayType<T = any> = T[]

// 申明 对象
declare type EmptyObjectType<T = any> = {
    [key: string]: T
}

declare interface SelectPagination {
    label?: string;
    value?: string;
}

// table 数据行基础类型
declare interface RowBase {
    id: string
    createTime?: string
    updateTime?: string
    // 其他公共字段...
}

// table 数据格式公共类型
declare interface TableType<T = any> {
    total: number;
    loading: boolean;
    data: T;

    [key: string]: T;

    queryForm: {
        current: number
        size: number
        orders: TableOrder[]
        [key: string]: T
    };
}

// table排序
declare interface TableOrder {
    column: string | null;
    asc: boolean;
}

