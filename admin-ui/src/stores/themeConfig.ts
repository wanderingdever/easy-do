import {defineStore} from 'pinia'

/**
 * 布局配置
 * 修改配置时：
 * 1、需要每次都清理 `window.localStorage` 浏览器永久缓存
 * 2、或者点击布局配置最底部 `一键恢复默认` 按钮即可看到效果
 */
export const useThemeConfig = defineStore('themeConfig', {
    state: (): ConfigState => ({
        // 侧边栏
        isCollapse: false,
        // 设置抽屉
        settingDrawer: false,
        themeConfig: {
            projectName: '管理系统',
            primaryColor: '#1890ff',
            isDark: false,
            layout: 'defaults',
            size: 'default',
            showFooter: true,
            isTagsView: true,
            showLogo: true,
            iconSize: 20
        }
    }),
    actions: {
        setThemeConfig(data: ThemeConfigState) {
            this.themeConfig = data
        },
        // 设置侧边栏开启折叠
        setCollapse() {
            this.isCollapse = !this.isCollapse
        },
        // 打开设置抽屉
        openSettingDrawer() {
            this.settingDrawer = true
        }
    }
})
