<template>
  <el-form
      ref="queryFormRef"
      :model="formData"
      :inline="true"
      label-position="right"
      :label-width="labelWidth"
      style="margin-bottom: 10px"
      @submit.native.prevent>
    <!-- 动态渲染搜索参数 -->
    <el-form-item v-for="(item, index) in columns" :key="index" :label="item.label" :prop="item.prop"
                  :class="item.class" style="min-width: 200px">
      <component
          :is="getComponentType(item.type)"
          v-model="formData[item.prop]"
          :placeholder="item.placeholder || `${item.label}`"
          v-bind="item.props || {}"
          :filterable="item.type === 'select' ? item.options?.filterable : undefined"
          @change="item.options?.handler">
        <!-- 处理select类型的选项 -->
        <template v-if="item.type === 'select' && item.options">
          <el-option
              v-for="data in item.options.data"
              :key="data[item.options.valueField || 'value']"
              :label="data[item.options.labelField || 'label']"
              :value="data[item.options.valueField || 'value']">
          </el-option>
        </template>
      </component>
    </el-form-item>

    <!-- 动态渲染按钮 -->
    <el-form-item class="main-search-click">
      <el-button
          v-for="(btn, index) in buttons"
          :key="index"
          :class="btn.class || ''"
          :type="btn.type || 'default'"
          v-show="btn.auth ? auth(btn.auth) : true"
          :disabled="btn.disabled || false"
          @click="handleButtonClick(btn.action)"
      >{{ btn.label }}
      </el-button>
    </el-form-item>
  </el-form>
</template>

<script setup lang="ts">
import {ref} from 'vue'
import {ElDatePicker, ElInput, ElOption, ElSelect, FormInstance} from 'element-plus'
import {auth} from '@/utils/authFunction.ts'

// 定义搜索项类型
export interface SearchFormItem<T = any> {
  label: string
  prop: string
  type: 'input' | 'select' | 'date' | string
  placeholder?: string
  props?: Record<string, any>
  // 下拉选择器的选项
  options?: {
    data: any[]
    labelField?: string
    valueField?: string
    filterable?: boolean
    handler?: (row: T, index: number) => void
  }
  class?: string
}

// 定义按钮类型
export interface SearchFormButton {
  auth?: string
  label: string
  type?: 'primary' | 'success' | 'warning' | 'danger' | 'info' | 'text'
  action: string
  class?: string
  disabled?: any
}

// 定义组件属性
const props = defineProps<{
  formData: Record<string, any>
  columns: SearchFormItem[]
  buttons?: SearchFormButton[]
  labelWidth?: string | number
}>()

// 定义事件
const emit = defineEmits<{
  (e: 'search', formData: Record<string, any>): void
  (e: 'reset'): void
  (e: 'action', action: string): void
}>()

const queryFormRef = ref<FormInstance>()

// 获取组件类型
const getComponentType = (type: string) => {
  switch (type) {
    case 'input':
      return ElInput
    case 'select':
      return ElSelect
    case 'date':
      return ElDatePicker
    default:
      return ElInput
  }
}

// 处理按钮点击
const handleButtonClick = (action: string) => {
  if (action === 'search') {
    emit('search', props.formData)
  } else if (action === 'reset') {
    queryFormRef.value?.resetFields()
    emit('reset')
  } else {
    emit('action', action)
  }
}
</script>

<style scoped>
.main-search-click {
  display: flex;
  float: right;
}
</style>
