<script setup lang="ts">
import {onMounted, ref, watch} from 'vue'
import {useTagsView} from '@/stores/tagsView.ts'
import {useRoute, useRouter} from 'vue-router'
import {Expand, Fold} from '@element-plus/icons-vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'

const route = useRoute()
const router = useRouter()
const storeTagsViews = useTagsView()
const tagsViewList = ref(storeTagsViews.tagsViewList)
// 首页路径
const HOME_PATH = '/home'
// 在组件挂载时从本地存储恢复状态
onMounted(() => {
})

// 点击标签跳转路由
function clickTag(path: string) {
  storeTagsViews.setActive(path)
  router.push(path)
}

// 关闭当前标签
function closeTag(item: TagViewState) {
  // 从breadcrumbList移除，并激活下一个
  const index = storeTagsViews.tagsViewList.findIndex((i) => i.path === item.path)
  if (index > -1) {
    // 从列表中移除该项
    storeTagsViews.tagsViewList.splice(index, 1)

    // 如果移除的是当前激活的标签
    if (item.path === storeTagsViews.active) {
      // 如果还有其他标签，激活下一个标签；如果没有其他标签，激活首页
      if (storeTagsViews.tagsViewList.length > 1) {
        // 至少还有首页标签
        // 如果移除的是最后一个标签，激活新的最后一个标签
        if (index >= storeTagsViews.tagsViewList.length) {
          storeTagsViews.setActive(storeTagsViews.tagsViewList[storeTagsViews.tagsViewList.length - 1].path)
          router.push(storeTagsViews.tagsViewList[storeTagsViews.tagsViewList.length - 1].path)
        } else {
          // 否则激活下一个标签
          storeTagsViews.setActive(storeTagsViews.tagsViewList[index].path)
          router.push(storeTagsViews.tagsViewList[index].path)
        }
      } else {
        // 如果只剩下首页标签了，跳转到首页
        storeTagsViews.setActive(HOME_PATH)
        router.push(HOME_PATH)
      }
    }
    // 更新 breadcrumbList 的响应式引用
    tagsViewList.value = storeTagsViews.tagsViewList
  }
}

// 关闭所有标签（除首页外）
function closeAllTags(item: TagViewState | null) {
  // 保留首页标签
  storeTagsViews.tagsViewList = storeTagsViews.tagsViewRoutes.filter((item) => {
    return item.meta.isAffix === true
  })
  if (item !== null) {
    if (!item.meta.isAffix) {
      storeTagsViews.tagsViewList.push(item)
    }
    clickTag(item.path)
  } else {
    clickTag(storeTagsViews.tagsViewList[0].path)
  }
  tagsViewList.value = storeTagsViews.tagsViewList
}

watch(
    () => route.path,
    () => {
      storeTagsViews.setTagsViewList(route.fullPath)
      // 更新 breadcrumbList 的响应式引用
      tagsViewList.value = storeTagsViews.tagsViewList
    },
    {
      deep: true
    }
)

const themeConfig = useThemeConfig()

function toggleCollapse() {
  themeConfig.setCollapse()
}
</script>

<template>
  <div class="label">
    <el-button text @click="toggleCollapse" style="padding: 8px !important">
      <el-icon v-if="themeConfig.isCollapse" :size="20">
        <Expand/>
      </el-icon>
      <el-icon v-else :size="20">
        <Fold/>
      </el-icon>
    </el-button>
    <div class="tabs-container">
      <el-radio-group>
        <template v-for="item in tagsViewList" :key="item.path">
          <!--          &lt;!&ndash; 首页标签不包含右键菜单 &ndash;&gt;-->
          <!--          <el-radio-button-->
          <!--              v-if="item.path === HOME_PATH"-->
          <!--              :label="item.path"-->
          <!--              :class="{ 'is-active': item.path === storeTagsViews.active }"-->
          <!--              @click="clickTag(item.path)"-->
          <!--          >-->
          <!--            {{ item.meta.title }}-->
          <!--          </el-radio-button>-->

          <!-- 非首页标签包含右键菜单 -->
          <el-dropdown trigger="contextmenu">
            <el-radio-button :label="item.path" :class="{ 'is-active': item.path === storeTagsViews.active }"
                             @click="clickTag(item.path)">
              {{ item.meta.title }}
            </el-radio-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item :disabled="item.meta.isAffix" @click="closeTag(item)">关闭</el-dropdown-item>
                <el-dropdown-item @click="closeAllTags(item)">关闭其他</el-dropdown-item>
                <el-dropdown-item @click="closeAllTags(null)">关闭所有</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
      </el-radio-group>
    </div>
  </div>
</template>

<style scoped>
.label {
  .tabs-container {
    height: 55px;
    display: flex;
    padding: 10px 15px;

    .el-radio-group {
      gap: 5px;

      .el-radio-button {
      }

      :deep(.el-radio-button__inner) {
        display: flex;
        align-items: center;
        box-shadow: none !important;
        border: var(--el-border) !important;
        border-radius: 5px;
      }

      /* 添加激活状态的样式 */

      :deep(.el-radio-button.is-active) {
        .el-radio-button__inner {
          background-color: var(--el-color-primary);
          color: white;
        }
      }
    }
  }
}
</style>
