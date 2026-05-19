<script setup lang="ts">
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {storeToRefs} from 'pinia'
import Logo from '@/assets/logo.png'

const themeConfigStore = useThemeConfig()
const {themeConfig} = storeToRefs(themeConfigStore)
</script>

<template>
  <div class="logo">
    <div class="logo-title">
      <el-image :src="Logo" alt="" class="logo-img" v-show="themeConfig.showLogo"/>
      <span v-show="!themeConfigStore.isCollapse">{{ themeConfig.projectName }}</span>
    </div>
  </div>
</template>

<style scoped>
.logo {
  height: 55px;
  padding: 10px 5px;
  align-content: center;
  justify-items: center;
  box-shadow: var(--box-shadow-color) 0 2px 2px 0;

  .logo-title {
    display: flex;
    align-items: center;
    gap: 5px;

    span {
      font-size: 16px;
      font-weight: 500;
      transition: all 0.25s ease-in-out;
      overflow: hidden;
      white-space: nowrap;
    }

    .logo-img {
      width: 30px;
      height: 30px;
    }
  }
}
</style>
