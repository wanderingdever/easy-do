<script setup lang="ts">
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {useDark} from '@vueuse/core'
import {Document, Moon, Setting, Sunny} from '@element-plus/icons-vue'
import {defineAsyncComponent} from 'vue'

const Logo = defineAsyncComponent(() => import('@/layout/component/logo.vue'))

const isDark = useDark()

const themeConfig = useThemeConfig()

const ChangeGlobalSize = (command: string) => {
}
</script>

<template>
  <!--  头部左边 -->
  <div class="layout-header-left">
    <Logo/>
  </div>
  <!--  头部右边 -->
  <div class="layout-header-right">
    <!-- 全局大小   -->
    <el-dropdown @command="ChangeGlobalSize">
      <el-button link circle>
        <el-icon>
          <Document/>
        </el-icon>
      </el-button>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item command="small" :disabled="themeConfig.themeConfig.size === 'small'">小型</el-dropdown-item>
          <el-dropdown-item command="default" :disabled="themeConfig.themeConfig.size === 'default'">默认
          </el-dropdown-item>
          <el-dropdown-item command="large" :disabled="themeConfig.themeConfig.size === 'large'">大型</el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
    <!-- 设置   -->
    <el-button link circle @click="themeConfig.openSettingDrawer()">
      <el-icon>
        <Setting/>
      </el-icon>
    </el-button>

    <!-- 夜间模式   -->
    <el-switch v-model="isDark">
      <template #active-action>
        <el-icon>
          <Moon/>
        </el-icon>
      </template>
      <template #inactive-action>
        <el-icon>
          <Sunny/>
        </el-icon>
      </template>
    </el-switch>
  </div>
</template>

<style scoped>
.layout-header-left {
}

.layout-header-right {
  display: flex;
  align-items: center;
}
</style>
