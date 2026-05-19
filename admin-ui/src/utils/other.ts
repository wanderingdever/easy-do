import router from '@/router'
import {verifyUrl} from '@/utils/toolsValidate.ts'
import {App, defineAsyncComponent} from 'vue'
import * as svg from '@element-plus/icons-vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'
import pinia from '@/stores'
import {storeToRefs} from 'pinia'
import {Local} from '@/utils/storage.ts'

// 引入组件
const EasyIcon = defineAsyncComponent(() => import('@/components/icon/easyIcon.vue'))

/**
 * 导出全局注册 element plus svg 图标
 * @param app vue 实例
 * @description 使用：https://element-plus.gitee.io/zh-CN/component/icon.html
 */
export function elSvg(app: App) {
    const icons = svg as any
    for (const i in icons) {
        app.component(`ele-${icons[i].name}`, icons[i])
    }
    app.component('EasyIcon', EasyIcon)
}

/**
 * 打开外部链接
 * @param val 当前点击项菜单
 */
export function handleOpenLink(val: RouteItem) {
    const {origin, pathname} = window.location
    router.push(val.path)
    if (verifyUrl(<string>val.meta?.isLink)) window.open(val.meta?.isLink)
    else window.open(`${origin}${pathname}#${val.meta?.isLink}`)
}

/**
 * 全局组件大小
 * @returns 返回 `window.localStorage` 中读取的缓存值 `globalComponentSize`
 */
export function globalComponentSize(): string {
    const stores = useThemeConfig(pinia)
    const {themeConfig} = storeToRefs(stores)
    return Local.get('themeConfig')?.size || themeConfig.value?.size
}
