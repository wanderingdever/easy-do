<script setup lang="ts">
import {computed} from 'vue'
import {handleOpenLink} from '@/utils/other.ts'
import EasyIcon from '@/components/icon/easyIcon.vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {storeToRefs} from 'pinia'

const themeConfigStore = useThemeConfig()
const {themeConfig} = storeToRefs(themeConfigStore)
const props = defineProps({
  children: {
    type: Array<RouteItem>,
    default: () => []
  }
})

// 获取父级菜单数据
const childrenMenu = computed(() => {
  return <RouteItem[]>props.children
})
</script>

<template>
  <template v-for="menu in childrenMenu">
    <el-sub-menu :index="menu.path" :key="menu.path" v-if="menu.children && menu.children.length > 0">
      <template #title>
        <easy-icon :name="menu.meta.icon || 'none'" :size="themeConfig.iconSize"/>
        <span>{{ menu.meta.title }}</span>
      </template>
      <SubMenu :children="menu.children"/>
    </el-sub-menu>
    <template v-else>
      <el-menu-item :index="menu.path" :key="menu.path">
        <!-- 内部链接 -->
        <easy-icon :name="menu.meta.icon || 'none'" :size="themeConfig.iconSize"/>
        <template v-if="!menu.meta.isLink || (menu.meta.isLink && menu.meta.isIframe)">
          <span>{{ menu.meta.title }}</span>
        </template>
        <!--外部链接-->
        <template>
          <el-text>
            <a class="w100" @click.prevent="handleOpenLink(menu)">
              <span>{{ menu.meta.title }}</span>
            </a>
          </el-text>
        </template>
      </el-menu-item>
    </template>
  </template>
</template>
<style scoped></style>
