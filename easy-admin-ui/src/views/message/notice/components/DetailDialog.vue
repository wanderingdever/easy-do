<script setup lang="ts">
import {ref, watch} from 'vue'
import NoticeDetailContent from './NoticeDetailContent.vue'

const props = withDefaults(
    defineProps<{
      modelValue: boolean
      id: string
    }>(),
    {
      modelValue: false,
      id: ''
    }
)

const emit = defineEmits<{
  (e: 'update:modelValue', v: boolean): void
  (e: 'updated'): void
}>()

const visible = ref(false)

watch(
    () => props.modelValue,
    (val) => {
      visible.value = val
    },
    {immediate: true}
)

watch(
    () => visible.value,
    (val) => emit('update:modelValue', val)
)

function handleClose() {
  visible.value = false
}

function handleUpdated() {
  emit('updated')
}
</script>

<template>
  <el-dialog
      v-model="visible"
      title="公告详情"
      width="860px"
      :close-on-click-modal="false"
      destroy-on-close
      @close="handleClose"
  >
    <NoticeDetailContent v-if="visible" :id="id" @updated="handleUpdated"/>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">关 闭</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
}
</style>
