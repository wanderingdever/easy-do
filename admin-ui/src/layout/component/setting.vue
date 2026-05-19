<script setup lang="ts">
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {storeToRefs} from 'pinia'
import {ElMessage} from 'element-plus'
import {computed} from 'vue'
import {Local} from '@/utils/storage.ts'

const storeUseThemeConfig = useThemeConfig()
const {themeConfig} = storeToRefs(storeUseThemeConfig)

// 获取布局配置信息
const getThemeConfig = computed(() => {
  return themeConfig.value
})

const predefineColors = ['#409EFF', '#90ee90', '#ff4500', '#ff8c00', '#ffd700', '#00ced1', '#c71585']

// 1、全局主题
function onColorPickerChange() {
  if (!getThemeConfig.value.primaryColor) return ElMessage.warning('全局主题 primary 颜色值不能为空')
  document.documentElement.style.setProperty('--el-color-primary', getThemeConfig.value.primaryColor)
  setDispatchThemeConfig()
}

function changeGlobalSize(command: string) {
  themeConfig.value.size = command
  let fontSize
  switch (command) {
    case 'large':
      fontSize = 16 // 对应 --el-font-size-medium
      break
    case 'small':
      fontSize = 12 // 对应 --el-font-size-extra-small
      break
    case 'default':
      fontSize = 14 // 对应 --el-font-size-extra-small
      break
    default:
      fontSize = 14 // 对应 --el-font-size-base
      break
  }
  themeConfig.value.iconSize = fontSize
  setDispatchThemeConfig()
  window.location.reload()
}

function changeShowLogo(value: boolean) {
  themeConfig.value.showLogo = value
  setDispatchThemeConfig()
}

// 一键恢复默认
const onResetConfigClick = () => {
  Local.clear()
  window.location.reload()
}

// 触发 store 布局配置更新
function setDispatchThemeConfig() {
  setLocalThemeConfig()
  setLocalThemeConfigStyle()
}

// 存储布局配置全局主题样式（html根标签）
function setLocalThemeConfigStyle() {
  Local.set('themeConfigStyle', document.documentElement.style.cssText)
}

// 存储布局配置
function setLocalThemeConfig() {
  Local.remove('themeConfig')
  Local.set('themeConfig', getThemeConfig.value)
}
</script>

<template>
  <el-drawer :close-on-press-escape="false" v-model="storeUseThemeConfig.settingDrawer" title="系统设置" direction="rtl"
             size="350">
    <el-row align="middle">
      <el-col :span="6">
        <el-text>布局大小:</el-text>
      </el-col>
      <el-col :span="18">
        <el-button type="primary" size="small" @click="changeGlobalSize('small')"
                   :disabled="themeConfig.size === 'small'">小
        </el-button>
        <el-button type="primary" size="default" @click="changeGlobalSize('default')"
                   :disabled="themeConfig.size === 'default'">默认
        </el-button>
        <el-button type="primary" size="large" @click="changeGlobalSize('large')"
                   :disabled="themeConfig.size === 'large'">大
        </el-button>
      </el-col>
    </el-row>
    <el-row style="margin-top: 15px">
      <el-col :span="24">
        <el-text>全局主题:</el-text>
      </el-col>
      <el-col :span="24">
        <div>
          <el-color-picker-panel v-model="getThemeConfig.primaryColor" show-alpha :predefine="predefineColors"/>
        </div>
      </el-col>
      <el-col>
        <div style="margin-top: 10px">
          <el-button :color="getThemeConfig.primaryColor" @click="onColorPickerChange()">修改主题色</el-button>
        </div>
      </el-col>
    </el-row>
    <el-row align="middle" style="margin-top: 15px">
      <el-col :span="6">
        <el-text>显示 Logo:</el-text>
      </el-col>
      <el-col :span="18">
        <el-switch :model-value="themeConfig.showLogo" @change="changeShowLogo"/>
      </el-col>
    </el-row>
    <el-row>
      <el-col>
        <div style="margin-top: 10px">
          <el-button type="info" @click="onResetConfigClick" style="color: white">一键恢复默认</el-button>
        </div>
      </el-col>
    </el-row>
  </el-drawer>
</template>

<style scoped></style>
