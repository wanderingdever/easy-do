<script setup lang="ts">
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {computed, defineAsyncComponent} from 'vue'
import {handleOpenLink} from '@/utils/other.ts'
import EasyIcon from '@/components/icon/easyIcon.vue'
import {storeToRefs} from 'pinia'

const SubMenu = defineAsyncComponent(() => import('@/layout/menu/subMenu.vue'))
const themeConfigStore = useThemeConfig()
const {themeConfig} = storeToRefs(themeConfigStore)

// 定义父组件传过来的值
const props = defineProps({
  // 菜单列表
  menuList: {
    type: Array<RouteItem>,
    default: () => []
  }
})

// 获取父级菜单数据
const menus = computed(() => {
  return props.menuList
})
</script>

<template>
  <el-menu router background-color="transparent" :default-active="$route.path" class="el-menu-vertical"
           :collapse="themeConfigStore.isCollapse">
    <template v-for="menu in menus">
      <!-- 如果有子菜单-->
      <el-sub-menu v-if="menu.children && menu.children.length > 0" :index="menu.path" :key="menu.path">
        <template #title>
          <easy-icon :name="menu.meta.icon || 'none'" :size="themeConfig.iconSize"/>
          <span>{{ menu.meta.title }}</span>
        </template>
        <SubMenu :children="menu.children"/>
      </el-sub-menu>
      <!-- 如果没有子菜单-->
      <template v-else>
        <el-menu-item :index="menu.path" :key="menu.path">
          <easy-icon :name="menu.meta.icon || 'none'" :size="themeConfig.iconSize"/>
          <template #title v-if="!menu.meta.isLink || (menu.meta.isLink && menu.meta.isIframe)">
            <span>{{ menu.meta.title }}</span>
          </template>
          <template #title v-else>
            <a class="w100" @click.prevent="handleOpenLink(menu)">{{ menu.meta.title }}</a>
          </template>
        </el-menu-item>
      </template>
    </template>
  </el-menu>
</template>

<style scoped>
.el-menu-vertical {
  border: none;
}

.el-menu-vertical:not(.el-menu--collapse) {
  width: 220px;
  min-height: 400px;
}
</style>
