<script setup lang="ts">
import {computed, onMounted, reactive, ref} from 'vue'
import {noticeApi} from '@/api/system/notice'
import {ElMessage, ElMessageBox} from 'element-plus'
import {Bell, Delete, Finished, Refresh, Search} from '@element-plus/icons-vue'

const api = noticeApi()

const loading = ref(false)
const actionLoading = ref(false)
const notices = ref<NoticeRow[]>([])
const selectedRows = ref<NoticeRow[]>([])
const activeNotice = ref<NoticeDetail | null>(null)
const detailLoading = ref(false)
const detailVisible = ref(false)

const queryForm = reactive<NoticeListQuery>({
  current: 1,
  size: 10,
  title: '',
  readStatus: ''
})

const total = ref(0)

const selectedIds = computed(() => selectedRows.value.map((item) => item.id))
const selectedCount = computed(() => selectedRows.value.length)
const unreadCount = computed(() => notices.value.filter((item) => item.isRead !== 1).length)

const readStatusOptions = [
  {label: '全部公告', value: ''},
  {label: '未读', value: 'UNREAD'},
  {label: '已读', value: 'READ'}
]

function noticeTypeText(type?: string) {
  if (!type || type === 'ANNOUNCEMENT') return '通知公告'
  return type
}

function formatTime(time?: string) {
  return time || '-'
}

async function getNoticePage() {
  loading.value = true
  try {
    const res: any = await api.userPage({
      ...queryForm,
      pageNum: queryForm.current,
      pageSize: queryForm.size
    })
    notices.value = res.data?.records || []
    total.value = res.data?.total || 0
    if (!detailVisible.value && activeNotice.value && !notices.value.some((item) => item.id === activeNotice.value?.id)) {
      activeNotice.value = null
    }
  } catch (err) {
    console.error(err)
    ElMessage.error('获取通知公告失败')
  } finally {
    loading.value = false
  }
}

async function openNotice(row: NoticeRow, shouldMarkRead = true) {
  detailVisible.value = true
  detailLoading.value = true
  try {
    const res: any = await api.detail(row.id)
    activeNotice.value = res.data as NoticeDetail
    if (shouldMarkRead && row.isRead !== 1) {
      await api.read({noticeId: row.id})
      row.isRead = 1
      row.readTime = new Date().toLocaleString()
    }
  } catch (err) {
    console.error(err)
    ElMessage.error('获取公告详情失败')
  } finally {
    detailLoading.value = false
  }
}

function handleSearch() {
  queryForm.current = 1
  getNoticePage()
}

function handleReset() {
  queryForm.title = ''
  queryForm.readStatus = ''
  queryForm.current = 1
  getNoticePage()
}

function handleSelectionChange(rows: NoticeRow[]) {
  selectedRows.value = rows
}

function handlePageChange(page: number) {
  queryForm.current = page
  getNoticePage()
}

function handleSizeChange(size: number) {
  queryForm.size = size
  queryForm.current = 1
  getNoticePage()
}

async function markSelectedRead() {
  if (selectedIds.value.length === 0) {
    ElMessage.warning('请选择需要标记已读的公告')
    return
  }
  actionLoading.value = true
  try {
    await api.batchRead({ids: selectedIds.value})
    ElMessage.success('已标记为已读')
    await getNoticePage()
  } catch (err) {
    console.error(err)
    ElMessage.error('操作失败')
  } finally {
    actionLoading.value = false
  }
}

async function deleteSelected() {
  if (selectedIds.value.length === 0) {
    ElMessage.warning('请选择需要删除的公告')
    return
  }
  try {
    await ElMessageBox.confirm(`确认删除选中的 ${selectedCount.value} 条公告？`, '删除公告', {type: 'warning'})
  } catch {
    return
  }
  actionLoading.value = true
  try {
    await api.batchDelete({ids: selectedIds.value})
    ElMessage.success('删除成功')
    closeDetail()
    await getNoticePage()
  } catch (err) {
    console.error(err)
    ElMessage.error('删除失败')
  } finally {
    actionLoading.value = false
  }
}

async function markAllRead() {
  try {
    await ElMessageBox.confirm('确认将所有通知公告标记为已读？', '全部已读', {type: 'warning'})
  } catch {
    return
  }
  actionLoading.value = true
  try {
    await api.readAll()
    ElMessage.success('全部已读成功')
    await getNoticePage()
  } catch (err) {
    console.error(err)
    ElMessage.error('操作失败')
  } finally {
    actionLoading.value = false
  }
}

async function deleteAll() {
  try {
    await ElMessageBox.confirm('确认删除所有通知公告？删除后当前账号将不再显示这些公告。', '删除全部公告', {type: 'warning'})
  } catch {
    return
  }
  actionLoading.value = true
  try {
    await api.deleteAll()
    ElMessage.success('已删除全部公告')
    closeDetail()
    await getNoticePage()
  } catch (err) {
    console.error(err)
    ElMessage.error('删除失败')
  } finally {
    actionLoading.value = false
  }
}

onMounted(() => {
  getNoticePage()
})

function closeDetail() {
  detailVisible.value = false
  activeNotice.value = null
}
</script>

<template>
  <div class="message-center">
    <div class="message-center__header">
      <div>
        <div class="message-center__title">通知公告</div>
        <div class="message-center__subtitle">查看系统发布的公告，并管理自己的阅读状态</div>
      </div>
      <el-segmented v-model="queryForm.readStatus" :options="readStatusOptions" @change="handleSearch"/>
      <div class="message-center__filters">
        <el-input
            v-model="queryForm.title"
            class="message-center__search"
            clearable
            placeholder="搜索公告标题"
            :prefix-icon="Search"
            @keyup.enter="handleSearch"
        />

        <div class="message-center__filter-actions">
          <el-button :icon="Refresh" @click="handleReset">重置</el-button>
          <el-button type="primary" :icon="Search" @click="handleSearch">查询</el-button>
        </div>
      </div>
    </div>


    <div class="message-center__toolbar">
      <div class="message-center__selected">已选择 {{ selectedCount }} 条</div>
      <div class="message-center__toolbar-actions">
        <el-button :icon="Finished" :loading="actionLoading" @click="markSelectedRead">标记已读</el-button>
        <el-button :icon="Delete" :loading="actionLoading" @click="deleteSelected">删除</el-button>
        <el-divider direction="vertical"/>
        <el-button type="primary" plain :loading="actionLoading" @click="markAllRead">全部已读</el-button>
        <el-button type="danger" plain :loading="actionLoading" @click="deleteAll">删除全部</el-button>
      </div>
    </div>

    <div class="message-center__body">
      <div class="message-center__list">
        <el-table
            v-loading="loading"
            :data="notices"
            row-key="id"
            height="100%"
            class="message-center__table"
            highlight-current-row
            @selection-change="handleSelectionChange"
            @row-click="openNotice"
        >
          <el-table-column type="selection" width="48"/>
          <el-table-column min-width="400" label="公告标题">
            <template #default="{ row }">
              <div class="notice-title">
                <el-icon class="notice-title__icon" :color="row.isRead != 1 ? 'red' : 'info'">
                  <Bell/>
                </el-icon>
                <div>
                  <div class="notice-title__text">{{ row.title }}</div>
                  <div class="notice-title__meta">
                    <span>{{ noticeTypeText(row.noticeType) }}</span>
                    <span>发布时间 {{ formatTime(row.publishTime) }}</span>
                  </div>
                </div>
              </div>
            </template>
          </el-table-column>
          <el-table-column width="110" label="状态">
            <template #default="{ row }">
              <el-tag v-if="row.isRead === 1" type="info" effect="plain">已读</el-tag>
              <el-tag v-else type="danger" effect="light">未读</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="readTime" width="180" label="阅读时间">
            <template #default="{ row }">{{ formatTime(row.readTime) }}</template>
          </el-table-column>
        </el-table>
        <div class="message-center__pagination">
          <el-pagination
              v-model:current-page="queryForm.current"
              v-model:page-size="queryForm.size"
              :page-sizes="[10, 20, 50]"
              layout="total, sizes, prev, pager, next"
              :total="total"
              @current-change="handlePageChange"
              @size-change="handleSizeChange"
          />
        </div>
      </div>

      <el-dialog
          v-model="detailVisible"
          width="760px"
          class="notice-detail-dialog"
          destroy-on-close
          append-to-body
          @closed="activeNotice = null"
      >
        <template #header>
          <div class="detail-card__header">
            <div>
              <div class="detail-card__title">{{ activeNotice?.title || '通知公告详情' }}</div>
              <div v-if="activeNotice" class="detail-card__meta">
                <span>{{ noticeTypeText(activeNotice.noticeType) }}</span>
                <span>发布时间 {{ formatTime(activeNotice.publishTime) }}</span>
              </div>
            </div>
          </div>
        </template>

        <el-skeleton v-if="detailLoading" :rows="8" animated/>
        <template v-else-if="activeNotice">
          <el-scrollbar class="detail-card__content">
            <div class="detail-card__html" v-html="activeNotice.content"></div>
          </el-scrollbar>
        </template>
        <el-empty v-else description="暂无公告详情"/>
      </el-dialog>
    </div>
  </div>
</template>

<style scoped>
.message-center {
  display: flex;
  min-height: calc(100vh - 116px);
  flex-direction: column;
  gap: 14px;
  color: #1f2937;
}

.message-center__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
  padding: 18px 20px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
}

.message-center__title {
  font-size: 22px;
  font-weight: 600;
  line-height: 32px;
}

.message-center__subtitle {
  margin-top: 4px;
  color: #6b7280;
  font-size: 13px;
}

.message-center__summary-item span,
.message-center__summary-item small {
  display: block;
}

.message-center__summary-item span {
  color: #111827;
  font-size: 20px;
  font-weight: 600;
}

.message-center__summary-item small {
  margin-top: 2px;
  color: #6b7280;
}

.message-center__summary-item.is-unread span {
  color: #d93026;
}

.message-center__filters,
.message-center__toolbar {
  display: flex;
  justify-content: space-between;
  gap: 12px;
  padding: 12px 16px;
}

.message-center__search {
  width: 280px;
}

.message-center__filter-actions,
.message-center__toolbar-actions {
  display: flex;
  align-items: center;
  gap: 8px;
}

.message-center__selected {
  color: #6b7280;
  font-size: 13px;
}

.message-center__body {
  display: flex;
  min-height: 560px;
  flex: 1;
}

.message-center__list {
  min-width: 0;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
}

.message-center__list {
  display: flex;
  width: 100%;
  flex-direction: column;
  overflow: hidden;
}

.message-center__table {
  flex: 1;
}

.message-center__pagination {
  display: flex;
  justify-content: flex-end;
  padding: 12px 16px;
  border-top: 1px solid #e5e7eb;
}

.notice-title {
  display: flex;
  position: relative;
  align-items: flex-start;
  gap: 10px;
  padding: 6px 0;
}

.notice-title__dot {
  position: absolute;
  left: -14px;
  top: 14px;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: #d93026;
}

.notice-title__icon {
  margin-top: 4px;
}

.notice-title__text {
  color: #111827;
  font-weight: 500;
  line-height: 22px;
}

.notice-title__meta {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 4px;
  color: #6b7280;
  font-size: 12px;
}

.detail-card__header {
  padding-right: 28px;
}

.detail-card__title {
  color: #111827;
  font-size: 18px;
  font-weight: 600;
  line-height: 28px;
  word-break: break-word;
}

.detail-card__content {
  max-height: 58vh;
}

.detail-card__html {
  color: #374151;
  line-height: 1.8;
  word-break: break-word;
}

.detail-card__html :deep(img) {
  max-width: 100%;
  height: auto;
}

.detail-card__meta {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 6px;
  color: #6b7280;
  font-size: 12px;
}

:deep(.notice-detail-dialog .el-dialog__body) {
  padding-top: 8px;
}

@media (max-width: 820px) {
  :deep(.notice-detail-dialog) {
    width: calc(100vw - 32px) !important;
  }
}

@media (max-width: 768px) {
  .message-center__header,
  .message-center__filters,
  .message-center__toolbar {
    align-items: stretch;
    flex-direction: column;
  }

  .message-center__search {
    width: 100%;
  }
}
</style>
