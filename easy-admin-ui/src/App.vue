<script setup lang="ts">
import dayjs from 'dayjs'
import 'dayjs/locale/zh-cn'
import {computed, nextTick, onBeforeMount, onMounted, watch} from 'vue'
import {useRoute} from 'vue-router'
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {Local} from '@/utils/storage.ts'
import setIntroduction from '@/utils/setIconfont.ts'
import {globalComponentSize} from '@/utils/other'

dayjs.locale('zh-cn')
const route = useRoute()

const themeConfigStore = useThemeConfig()

// 获取全局组件大小
const getGlobalComponentSize = computed(() => {
  return globalComponentSize()
})

// 设置初始化，防止刷新时恢复默认
onBeforeMount(() => {
  // 设置批量第三方 icon 图标
  setIntroduction.cssCdn()
  // 设置批量第三方 js
  setIntroduction.jsCdn()
})
// 页面加载时
onMounted(() => {
  nextTick(() => {
    // 获取缓存中的布局配置
    if (Local.get('themeConfig')) {
      themeConfigStore.setThemeConfig(Local.get('themeConfig') as ThemeConfigState)
      document.documentElement.style.cssText = Local.get('themeConfigStyle')
    }
  })
})
// 监听路由的变化，设置网站标题
watch(
    () => route.path,
    () => {
      document.title = route.meta.title as string
    },
    {
      deep: true
    }
)
</script>

<template>
  <el-config-provider :size="getGlobalComponentSize">
    <router-view/>
  </el-config-provider>
</template>

<style scoped></style>
