<script setup lang="ts">
import {defineAsyncComponent, onMounted, reactive, ref, watch} from 'vue'
import {useThemeConfig} from '@/stores/themeConfig.ts'
import {ArrowUp, Bell, Moon, Remove, Setting, Sunny, User} from '@element-plus/icons-vue'
import {useRoutesList} from '@/stores/routesList.ts'
import {storeToRefs} from 'pinia'
import {useDark} from '@vueuse/core'
import {useUserInfo} from '@/stores/userInfo.ts'
import {useRouter} from 'vue-router'
import {ElMessage, ElMessageBox} from 'element-plus'
import Logo from '@/layout/component/logo.vue'
import {noticeApi} from '@/api/system/notice'

const VerticalMenu = defineAsyncComponent(() => import('@/layout/menu/vertical.vue'))
const router = useRouter()
const routeStore = useRoutesList()
const {routesList} = storeToRefs(routeStore)
const userStore = useUserInfo()
const {userInfo} = storeToRefs(userStore)
const themeConfig = useThemeConfig()
const noticeService = noticeApi()
const unreadCount = ref(0)

const state = reactive<AsideState>({
  menuList: [] as RouteItem[]
})

const isDark = useDark()

function setFilterRoutes() {
  state.menuList = filterRoutesFun(routesList.value)
}

function filterRoutesFun<T extends RouteItem>(arr: T[]): T[] {
  return arr
      .filter((item: T) => !item.meta?.isHide)
      .map((item: T) => {
        item = Object.assign({}, item)
        if (item.children) item.children = filterRoutesFun(item.children)
        return item
      })
}

function personalCommand(command: string) {
  switch (command) {
    case 'dark':
      isDark.value = !isDark.value
      break
    case 'setting':
      themeConfig.openSettingDrawer()
      break
    case 'personal':
      router.push({path: '/personal'})
      break
    case 'notice':
      router.push('/message/center')
      break
    case 'logout':
      ElMessageBox.confirm(`是否退出登录?`, '提示', {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            userStore.logout()
          })
          .catch(() => {
          })
      break
    default:
      break
  }
}

function loadUnreadCount() {
  noticeService
      .unreadCount()
      .then((res: any) => {
        const data: Partial<UnreadCountData> = res.data || {}
        unreadCount.value = data.unreadCount ?? data.unreadNoticeCount ?? 0
      })
      .catch((error: any) => {
        console.error(error)
        ElMessage.error('获取未读消息失败')
      })
}

function onDropdownVisibleChange(visible: boolean) {
  if (visible) {
    loadUnreadCount()
  }
}

onMounted(() => {
  setFilterRoutes()
  loadUnreadCount()
})


watch(
    () => routesList.value,
    () => {
      setFilterRoutes()
    }
)
</script>

<template>
  <div class="layout-aside-main">
    <Logo/>
    <div class="menu">
      <VerticalMenu :menuList="state.menuList"/>
    </div>

    <div class="personal">
      <el-dropdown
          class="dropdown"
          placement="top-end"
          @command="personalCommand"
          @visible-change="onDropdownVisibleChange"
      >
        <div class="user">
          <el-badge :value="unreadCount" :max="99" :hidden="unreadCount === 0" class="avatar-badge">
            <el-avatar :src="userInfo.avatar" :size="35"/>
          </el-badge>
          <p class="user-name" v-show="!themeConfig.isCollapse">
            {{ userInfo.nickname }}
            <el-icon>
              <ArrowUp/>
            </el-icon>
          </p>
        </div>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item :icon="Bell" command="notice">
              <div class="notice-item">
                <span>通知公告</span>
                <el-tag v-if="unreadCount > 0" type="danger" size="small">{{ unreadCount }}</el-tag>
              </div>
            </el-dropdown-item>
            <el-dropdown-item :icon="Setting" command="setting">系统设置</el-dropdown-item>
            <el-dropdown-item :icon="isDark ? Moon : Sunny" command="dark">夜间模式</el-dropdown-item>
            <el-dropdown-item divided :icon="User" command="personal">个人中心</el-dropdown-item>
            <el-dropdown-item :icon="Remove" command="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<style scoped>
.layout-aside-main {
  height: 100%;
  position: relative;

  .personal {
    width: 100%;
    position: absolute;
    bottom: 0;
    box-shadow: var(--box-shadow-color) 0 0 1px 2px;

    .dropdown {
      font-weight: 500;
      width: 100%;

      .user {
        padding: 5px;
        font-size: 14px;
        gap: 10px;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;

        .user-name {
          transition: all 0.25s ease-in-out;
          overflow: hidden;
          white-space: nowrap;
        }
      }
    }
  }
}

:deep(.avatar-badge .el-badge__content.is-fixed) {
  left: 4px;
  right: auto;
  top: 6px;
  transform: translate(-50%, -50%);
}

.notice-item {
  width: 100%;
  min-width: 120px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}
</style>
