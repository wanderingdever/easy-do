<script setup lang="ts">
import {defineAsyncComponent} from 'vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {storeToRefs} from 'pinia'
// 引入组件
const layouts: any = {
  defaults: defineAsyncComponent(() => import('@/layout/theme/defaults.vue'))
}

const storesThemeConfig = useThemeConfig()
const {themeConfig} = storeToRefs(storesThemeConfig)
</script>

<template>
  <component :is="layouts[themeConfig.layout]"/>
</template>

<style scoped></style>
