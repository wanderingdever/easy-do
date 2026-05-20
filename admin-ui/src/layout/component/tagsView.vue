<script setup lang="ts">
import {onMounted, ref, watch} from 'vue'
import {useTagsView} from '@/stores/tagsView.ts'
import {useRoute, useRouter} from 'vue-router'
import {Close, Expand, Fold} from '@element-plus/icons-vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'

const route = useRoute()
const router = useRouter()
const storeTagsViews = useTagsView()
const tagsViewList = ref(storeTagsViews.tagsViewList)
// 首页路径
const HOME_PATH = '/'
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
  if (item.meta.isAffix) {
    return
  }
  // 从breadcrumbList移除，并激活下一个
  const index = storeTagsViews.tagsViewList.findIndex((i) => i.path === item.path)
  if (index > -1) {
    // 从列表中移除该项
    storeTagsViews.tagsViewList.splice(index, 1)

    // 如果移除的是当前激活的标签
    if (item.path === storeTagsViews.active) {
      // 优先激活当前位置的下一个标签；如果关闭的是最后一个标签，则激活新的最后一个标签。
      if (storeTagsViews.tagsViewList.length > 0) {
        const nextIndex = Math.min(index, storeTagsViews.tagsViewList.length - 1)
        const nextPath = storeTagsViews.tagsViewList[nextIndex].path
        storeTagsViews.setActive(nextPath)
        router.push(nextPath)
      } else {
        storeTagsViews.setActive(HOME_PATH)
        router.push(HOME_PATH)
      }
    }
    // 更新 breadcrumbList 的响应式引用
    tagsViewList.value = storeTagsViews.tagsViewList
    storeTagsViews.saveTagsViewList()
  }
}

function handleCloseTag(event: MouseEvent, item: TagViewState) {
  event.stopPropagation()
  closeTag(item)
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
  } else if (storeTagsViews.tagsViewList.length > 0) {
    clickTag(storeTagsViews.tagsViewList[0].path)
  } else {
    clickTag(HOME_PATH)
  }
  tagsViewList.value = storeTagsViews.tagsViewList
  storeTagsViews.saveTagsViewList()
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
          <!-- 非首页标签包含右键菜单 -->
          <el-dropdown trigger="contextmenu">
            <el-radio-button :label="item.path" :class="{ 'is-active': item.path === storeTagsViews.active }"
                             @click="clickTag(item.path)">
              <span class="tag-title">{{ item.meta.title }}</span>
              <button
                  v-if="!item.meta.isAffix"
                  type="button"
                  class="tag-close"
                  aria-label="关闭标签"
                  @click="handleCloseTag($event, item)"
              >
                <el-icon :size="10">
                  <Close/>
                </el-icon>
              </button>
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
        position: relative;
        display: flex;
        align-items: center;
        min-width: 58px;
        height: 34px;
        padding: 8px 22px 8px 14px;
        box-shadow: none !important;
        border: var(--el-border) !important;
        border-radius: 5px;
      }

      .tag-title {
        max-width: 120px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .tag-close {
        position: absolute;
        top: -6px;
        right: -6px;
        width: 16px;
        height: 16px;
        padding: 0;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        color: var(--el-text-color-secondary);
        background: var(--el-bg-color);
        border: 1px solid var(--el-border-color);
        cursor: pointer;
        opacity: 0;
        transition: opacity 0.15s ease, color 0.15s ease, background-color 0.15s ease;
        z-index: 1;
      }

      :deep(.el-radio-button__inner:hover) .tag-close,
      :deep(.el-radio-button.is-active) .tag-close {
        opacity: 1;
      }

      .tag-close:hover {
        color: #fff;
        background: var(--el-color-danger);
        border-color: var(--el-color-danger);
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
