<template>
  <div>
    <template v-for="(item, index) in options" :key="index">
      <template v-if="values.includes(item.dictValue)">
        <el-tag v-if="$props.isTag" :key="item.dictValue" :class="item.listClass" :disable-transitions="true"
                :index="index" :type="item.cssClass">
          {{ item.dictLabel }}
        </el-tag>
        <label v-else>
          {{ item.dictLabel }}
        </label>
      </template>
    </template>
  </div>
</template>

<script setup lang="ts">
import {computed, PropType} from 'vue'
import {getDictDataList} from '@/utils/dictFunction.ts'

export interface Dict {
  id?: string
  dictType?: string
  dictLabel: string
  dictValue: string
  dictSort?: number
  cssClass?: string
  listClass?: string
  enable?: boolean
}

// 定义props
const props = defineProps({
  // 字典类型
  optionsKey: {
    type: String
  },
  options: {
    type: Array as PropType<Dict[]>,
    default: () => []
  },
  // 字典值
  value: [] as any,
  isTag: {
    type: Boolean,
    default: true
  }
})

// 计算属性
const values = computed(() => {
  if (typeof props.value !== 'undefined') {
    return Array.isArray(props.value) ? props.value : [String(props.value)]
  } else {
    return []
  }
})

// 定义options
const options = computed(() => {
  if (props.optionsKey) {
    return getDictDataList(props.optionsKey)
  }
  return props.options
})
</script>

<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
</style>
