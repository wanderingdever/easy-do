<script setup lang="ts">
import {computed, ref, watch} from 'vue'
import {ElMessage} from 'element-plus'
import {noticeApi} from '@/api/system/notice'

const props = withDefaults(
    defineProps<{
      id: string
      markRead?: boolean
    }>(),
    {
      markRead: false
    }
)

const emit = defineEmits<{
  (e: 'updated'): void
}>()

const api = noticeApi()
const loading = ref(false)
const detail = ref<NoticeDetail | null>(null)

const statusTagType = computed(() => {
  if (!detail.value) return 'info'
  if (detail.value.status === 'PUBLISHED') return 'success'
  if (detail.value.status === 'REVOKED') return 'warning'
  return 'info'
})

const statusText = computed(() => {
  if (!detail.value) return ''
  if (detail.value.status === 'PUBLISHED') return '已发布'
  if (detail.value.status === 'REVOKED') return '已撤回'
  return '草稿'
})

watch(
    () => props.id,
    (id) => {
      if (!id) {
        detail.value = null
        return
      }
      loadDetail(id)
    },
    {immediate: true}
)

async function loadDetail(id: string) {
  loading.value = true
  try {
    const res = await api.detail(id)
    detail.value = res.data as NoticeDetail
    if (props.markRead) {
      await markNoticeRead(id)
    }
  } catch (err) {
    console.error(err)
    ElMessage.error('获取公告详情失败')
  } finally {
    loading.value = false
  }
}

async function markNoticeRead(id: string) {
  try {
    await api.read({noticeId: id})
    emit('updated')
  } catch (err) {
    console.error(err)
  }
}
</script>

<template>
  <div v-if="loading" class="notice-detail__loading">
    <el-skeleton :rows="6" animated/>
  </div>
  <div v-else-if="detail" class="notice-detail">
    <div class="notice-detail__header">
      <div class="notice-detail__title">{{ detail.title }}</div>
      <el-tag :type="statusTagType" size="small">{{ statusText }}</el-tag>
    </div>

    <el-descriptions :column="1" border class="notice-detail__meta">
      <el-descriptions-item label="公告类型">{{ detail.noticeType || '公告' }}</el-descriptions-item>
      <el-descriptions-item label="发布时间">{{ detail.publishTime || '-' }}</el-descriptions-item>
      <el-descriptions-item label="撤回时间">{{ detail.revokeTime || '-' }}</el-descriptions-item>
      <el-descriptions-item label="创建时间">{{ detail.createTime || '-' }}</el-descriptions-item>
      <el-descriptions-item label="更新时间">{{ detail.updateTime || '-' }}</el-descriptions-item>
      <el-descriptions-item label="阅读数">{{ detail.readCount ?? '-' }}</el-descriptions-item>
    </el-descriptions>

    <div class="notice-detail__content">
      <div class="notice-detail__html" v-html="detail.content"></div>
    </div>
  </div>
  <el-empty v-else description="暂无公告数据"/>
</template>

<style scoped>
.notice-detail {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.notice-detail__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
}

.notice-detail__title {
  font-size: 20px;
  font-weight: 600;
  color: #303133;
  line-height: 1.5;
}

.notice-detail__meta {
  width: 100%;
}

.notice-detail__content {
  min-height: 220px;
  padding: 16px;
  border: 1px solid var(--el-border-color);
  border-radius: 4px;
  background: #fff;
}

.notice-detail__html {
  color: #303133;
  line-height: 1.8;
  word-break: break-word;
}

.notice-detail__html :deep(img) {
  max-width: 100%;
  height: auto;
}

.notice-detail__loading {
  padding: 8px 0;
}
</style>
