<script setup lang="ts">
import {defineAsyncComponent} from 'vue'

const MainRouter = defineAsyncComponent(() => import('@/layout/routerView/mainRouter.vue'))
const BreadcrumbView = defineAsyncComponent(() => import('@/layout/component/tagsView.vue'))
const AsideView = defineAsyncComponent(() => import('@/layout/component/aside.vue'))
const SettingDrawer = defineAsyncComponent(() => import('@/layout/component/setting.vue'))
</script>
<template>
  <el-container class="layout-container">
    <el-container>
      <el-aside class="layout-aside">
        <AsideView/>
      </el-aside>
      <el-main class="layout-main">
        <BreadcrumbView class="breadcrumb"/>
        <div class="container">
          <MainRouter/>
        </div>
      </el-main>
    </el-container>
    <SettingDrawer/>
  </el-container>
</template>

<style scoped>
.el-header {
}

.el-aside {
}

.el-main {
}
</style>
