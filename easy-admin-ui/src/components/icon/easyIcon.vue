<template>
  <i v-if="isShowIconSvg" class="el-icon" :style="setIconSvgStyle">
    <component :is="getIconName"/>
  </i>
  <div class="el-icon easy-icon" v-else-if="isShowIconImg" :style="setIconImgOutStyle">
    <img :src="getIconName" :style="setIconSvgInsStyle" alt=""/>
  </div>
  <div class="el-icon easy-icon" v-else-if="props.name?.startsWith('svg ')" :style="setIconImgOutStyle">
    <img :src="`/svgIcons/${props.name.split('svg ')[1]}.svg`" alt=""/>
  </div>
  <i class="el-icon easy-icon" v-else-if="props.name && props.name !== 'none'" :class="getIconName"
     :style="setIconSvgStyle"></i>
  <div class="el-icon easy-icon" v-else :style="setPlaceholderStyle"></div>
</template>
<script setup lang="ts">
import {computed} from 'vue'

const props = defineProps({
  name: {
    type: String,
    required: true
  },
  size: {
    type: Number,
    default: () => 25
  },
  color: {
    type: String
  }
})

// 在线链接、本地引入地址前缀
const linesString = ['https', 'http', '/src', '/assets', 'data:image', import.meta.env.VITE_PUBLIC_PATH]

// 用于判断 element plus 自带 svg 图标的显示、隐藏
const isShowIconSvg = computed(() => {
  return props?.name?.startsWith('ele-')
})

// 获取 icon 图标名称
const getIconName = computed(() => {
  return props?.name
})

// 用于判断在线链接、本地引入等图标显示、隐藏
const isShowIconImg = computed(() => {
  return linesString.find((str) => props.name?.startsWith(str))
})

// 设置图标样式
const setIconSvgStyle = computed(() => {
  return `font-size: ${props.size}px;color: ${props.color};width: ${props.size}px;`
})

// 设置图片样式
const setIconImgOutStyle = computed(() => {
  return `width: ${props.size}px;height: ${props.size}px;display: inline-block;overflow: hidden;`
})

// 设置图片样式
const setIconSvgInsStyle = computed(() => {
  const filterStyle: string[] = []
  const compatibles: string[] = ['-webkit', '-ms', '-o', '-moz']
  compatibles.forEach((j) => filterStyle.push(`${j}-filter: drop-shadow(${props.color} 30px 0);`))
  return `width: ${props.size}px;height: ${props.size}px;position: relative;left: -${props.size}px;${filterStyle.join('')}`
})

// 设置占位符样式
const setPlaceholderStyle = computed(() => {
  return `width: ${props.size}px;height: ${props.size}px;display: inline-block;`
})
</script>

<style scoped>
.el-icon {
  margin: 0 !important;
}

.easy-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  vertical-align: middle;
}
</style>
