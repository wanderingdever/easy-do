<template>
  <div class="layout-parent">
    <router-view v-slot="{ Component }">
      <keep-alive :include="getKeepAliveNames">
        <component :is="Component" :key="state.refreshRouterViewKey" class="w100" v-show="!isIframePage"/>
      </keep-alive>
    </router-view>
  </div>
</template>
<script setup lang="ts">
import {computed, reactive, watch} from 'vue'
import {useKeepAliveNames} from '@/stores/keepAliveNames.ts'
import {storeToRefs} from 'pinia'
import {useRoute} from 'vue-router'

// 定义变量内容
const route = useRoute()

const storesKeepAliveNames = useKeepAliveNames()
const {keepAliveNames} = storeToRefs(storesKeepAliveNames)

const state = reactive<ParentViewState>({
  refreshRouterViewKey: '', // 非 iframe tagsview 右键菜单刷新时
  iframeRefreshKey: '', // iframe tagsview 右键菜单刷新时
  keepAliveNameList: [],
  iframeList: []
})
// 获取组件缓存列表(name值)
const getKeepAliveNames = computed(() => {
  return keepAliveNames.value
})

// 设置 iframe 显示/隐藏
const isIframePage = computed(() => {
  return route.meta.isIframe
})

watch(
    () => route.fullPath,
    () => {
      state.refreshRouterViewKey = decodeURI(route.fullPath)
    },
    {
      immediate: true
    }
)
</script>

<style scoped>
.layout-parent {
  height: 100%;
  width: 100%;
}
</style>
