<template>
  <div class="notice-detail-page">
    <div class="notice-detail-page__header">
      <el-button :icon="Back" text @click="router.back()"></el-button>
      <span class="notice-detail-page__title">公告详情</span>
    </div>
    <NoticeDetailContent :id="noticeId" mark-read/>
  </div>
</template>

<script setup lang="ts">
import {computed} from 'vue'
import {useRoute, useRouter} from 'vue-router'
import {Back} from '@element-plus/icons-vue'
import NoticeDetailContent from './components/NoticeDetailContent.vue'

const route = useRoute()
const router = useRouter()

const noticeId = computed(() => route.params.id as string)
</script>

<style scoped>
.notice-detail-page {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.notice-detail-page__header {
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.notice-detail-page__title {
  font-size: 18px;
  font-weight: 600;
  color: #303133;
}
</style>
