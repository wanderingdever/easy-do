<template>
  <!-- 搜索表单 -->
  <el-form
      v-if="searchColumns && searchColumns.length > 0"
      ref="searchFormRef"
      :model="searchFormData"
      :inline="true"
      label-position="right"
      :label-width="searchLabelWidth"
      style="margin-bottom: 10px"
      @submit.native.prevent>
    <!-- 动态渲染搜索参数 -->
    <el-form-item
        v-for="item in searchColumns"
        :key="item.prop"
        :label="item.label"
        :prop="item.prop"
        :class="item.searchClass"
        style="min-width: 200px">
      <component
          :is="getSearchComponentType(item.searchType || 'input')"
          v-model="searchFormData[item.prop]"
          :placeholder="item.searchPlaceholder || `请输入${item.label}`"
          v-bind="item.searchProps || {}"
          :filterable="item.searchType === 'select' ? item.searchOptions?.filterable : undefined"
          @change="item.searchOptions?.handler">
        <!-- 处理select类型的选项 -->
        <template v-if="item.searchType === 'select' && item.searchOptions?.data">
          <el-option
              v-for="data in item.searchOptions.data"
              :key="data[item.searchOptions.valueField || 'value']"
              :label="data[item.searchOptions.labelField || 'label']"
              :value="data[item.searchOptions.valueField || 'value']">
          </el-option>
        </template>
      </component>
    </el-form-item>

    <!-- 动态渲染按钮 -->
    <el-form-item class="main-search-click">
      <el-button
          v-for="(btn, index) in searchButtons"
          :key="index"
          :class="btn.class || ''"
          :type="btn.type || 'default'"
          :disabled="btn.disabled || false"
          @click="handleSearchButtonClick(btn.action)">
        {{ btn.label }}
      </el-button>
    </el-form-item>
  </el-form>

  <el-table
      :data="tableData"
      :stripe="stripe"
      :border="border"
      :show-overflow-tooltip="overflow"
      :height="height"
      :max-height="maxHeight"
      :row-key="rowKey"
      ref="tableRef"
      :key="tableKey"
      @selection-change="onSelectionChange">
    <el-table-column class-name="selection-column" type="selection" :reserve-selection="true" width="30"
                     v-if="selection"/>
    <el-table-column class-name="index-column" type="index" label="序号" width="55" align="center"
                     v-if="index"></el-table-column>
    <el-table-column
        v-for="item in tableColumns"
        :key="item.prop"
        :prop="item.prop"
        :label="item.label"
        :width="item.width"
        :align="item.align"
        :fixed="item.fixed"
        :sortable="item.sortable">
      <template #default="scope">
        <template v-if="item.type === 'image'">
          <el-image
              :style="{
              width: `${item.imageWidth}px`,
              height: `${item.imageHeight}px`
            }"
              :src="scope.row[item.prop]"
              :zoom-rate="1.2"
              :preview-src-list="[scope.row[item.prop]]"
              preview-teleported
              fit="cover"/>
        </template>
        <template v-else-if="item.type === 'link'">
          <el-link
              :type="item.link?.type || 'primary'"
              :underline="item.link?.underline || 'never'"
              @click="item.link?.handler(scope.row, scope.$index)">
            {{ scope.row[item.prop] }}
          </el-link>
        </template>
        <template v-else-if="item.type === 'tag'">
          <easy-dict-tag :options="item.tagOptions" :value="scope.row[item.prop]"/>
        </template>
        <template v-else-if="item.type === 'btn'">
          <el-button
              v-for="(btn, btnIndex) in item.buttons"
              :key="btnIndex"
              :type="btn.type || 'primary'"
              :size="btn.size || 'small'"
              @click="btn.handler(scope.row, scope.$index)">
            {{ btn.text }}
          </el-button>
        </template>
        <template v-else>
          {{ scope.row[item.prop] }}
        </template>
      </template>
    </el-table-column>
  </el-table>
  <!-- 分页组件 -->
  <el-pagination
      class=""
      v-if="pagination && tableData.length > 0"
      v-model:current-page="paginationData.current"
      v-model:page-size="paginationData.size"
      :page-sizes="pageSizeOptions"
      :total="pageTotal"
      :layout="pageLayout"
      :size="pageComponentSize"
      @current-change="handleCurrentChange"
      @size-change="handleSizeChange"
      style="margin-top: 20px; justify-content: flex-end"/>
</template>

<script setup lang="ts">
import {computed, nextTick, onMounted, onUpdated, reactive, ref, watch} from 'vue'
import Sortable from 'sortablejs'
import EasyDictTag from '@/components/dictTag/easyDictTag.vue'
import {ElDatePicker, ElInput, ElOption, ElSelect, FormInstance} from 'element-plus'

// 定义按钮类型
export interface SearchFormButton {
  label: string
  type?: 'default' | 'primary' | 'success' | 'warning' | 'danger' | 'info' | 'text'
  action: string
  class?: string
  disabled?: any
}

// table 列信息
export interface EasyTableColumn<T = any> {
  // 添加 prop 属性，用于指定列对应的数据字段
  prop: string
  // 添加 label 属性，用于指定列的标题
  label: string
  // 添加 align 属性，用于指定列的对齐方式
  align?: 'left' | 'center' | 'right'
  // 添加 type 属性，用于指定列的类型
  type?: 'text' | 'image' | 'btn' | 'link' | 'tag'
  // 图片宽度
  imageWidth?: number
  // 图片高度
  imageHeight?: number
  // 列宽度
  width?: number
  // 添加 fixed 属性，用于指定列是否固定在左侧或右侧
  fixed?: boolean | 'left' | 'right'
  // Table流动高度
  maxHeight?: number
  // 添加 sortable 属性，用于指定列是否可排序
  sortable?: boolean | 'custom'
  // 添加 key 属性，用于拖拽时的重新渲染
  key?: string
  // 添加 buttons 属性，用于指定列的操作按钮
  buttons?: Array<{
    text: string
    type?: 'primary' | 'success' | 'warning' | 'danger' | 'info'
    size?: 'small' | 'default' | 'large'
    handler: (row: T, index: number) => void
  }>
  link?: {
    type?: 'primary' | 'success' | 'warning' | 'danger' | 'info'
    size?: 'small' | 'default' | 'large'
    underline?: 'always' | 'hover' | 'never'
    handler: (row: T, index: number) => void
  }
  tagOptions?: []

  // 添加搜索配置
  searchable?: boolean // 是否可搜索
  searchType?: 'input' | 'select' | 'date' | string // 搜索类型
  searchPlaceholder?: string // 搜索框占位符
  searchProps?: Record<string, any> // 搜索框额外属性
  searchOptions?: {
    // 搜索选项配置（用于select类型）
    data?: any[]
    labelField?: string
    valueField?: string
    filterable?: boolean
    handler?: (row: T, index: number) => void
  }
  searchClass?: string // 搜索项的class
}

const props = defineProps({
  // 列
  columns: {
    type: Array<EasyTableColumn>,
    required: true
  },
  // 数据
  data: {
    type: Array,
    required: true
  },
  // 斑马纹
  stripe: {
    type: Boolean,
    default: false
  },
  // 边框
  border: {
    type: Boolean,
    default: false
  },
  // 超出部分
  overflow: {
    type: Boolean,
    default: true
  },
  // 固定表头
  height: {
    type: Number || null,
    default: null
  },
  // 流体高度
  maxHeight: {
    type: Number || null,
    default: null
  },
  // 选择
  selection: {
    type: Boolean,
    default: false
  },
  // 序号
  index: {
    type: Boolean,
    default: false
  },
  // 排序
  sortChange: {
    type: Function,
    default: () => {
    }
  },
  // 是否开启列拖拽
  columnDrag: {
    type: Boolean,
    default: false
  },
  // 是否开启分页
  pagination: {
    type: Boolean,
    default: false
  },
  // 总条数
  pageTotal: {
    type: Number,
    default: 0
  },
  // 页码
  pageCurrent: {
    type: Number,
    default: 1
  },
  // 每页条数
  pageSize: {
    type: Number,
    default: 10
  },
  // 每页条数选项
  pageSizeOptions: {
    type: Array,
    default: () => [10, 20, 30, 40]
  },
  // 分页布局
  pageLayout: {
    type: String,
    default: 'total, sizes, prev, pager, next, jumper'
  },
  // 分页组件大小
  pageComponentSize: {
    type: String,
    default: 'primary'
  },
  rowKey: {
    type: String,
    default: 'id'
  },
  // 搜索表单相关属性
  searchFormData: {
    type: Object,
    default: () => ({})
  },
  searchButtons: {
    type: Array<SearchFormButton>,
    default: () => []
  },
  searchLabelWidth: {
    type: [String, Number],
    default: '80px'
  }
})

const tableRef = ref()
const searchFormRef = ref<FormInstance>()

// 添加一个响应式的表格key
const tableKey = ref(0)

// 列 使用 ref 创建响应式副本
const tableColumns = ref<EasyTableColumn[]>([...props.columns])

// 计算需要搜索的列
const searchColumns = computed(() => {
  return props.columns.filter((column) => column.searchable)
})

// 数据 - 这里改为响应式数据而非计算属性，以便修改字段顺序
const tableData = ref([...props.data])

// 分页数据
let paginationData = reactive({
  current: props.pageCurrent,
  size: props.pageSize
})

// 用于保存 Sortable 实例
let sortableInstance = null as Sortable | null

function columnDrop() {
  // 只有当 columnDrag 为 true 时才启用拖拽功能
  if (!props.columnDrag) {
    // 如果之前已经创建了 Sortable 实例，则销毁它
    if (sortableInstance) {
      sortableInstance.destroy()
      sortableInstance = null
    }
    return
  }
  nextTick(() => {
    const wrapper = document.querySelector('.el-table__header-wrapper tr')
    if (wrapper) {
      // 销毁已存在的 Sortable 实例
      if (sortableInstance) {
        sortableInstance.destroy()
      }
      // 创建新的 Sortable 实例
      sortableInstance = Sortable.create(<HTMLElement>wrapper, {
        animation: 180,
        delay: 0,
        // 设置拖拽样式
        ghostClass: 'sortable-ghost',
        chosenClass: 'sortable-chosen',
        dragClass: 'sortable-drag',
        // 过滤掉fixed列，不参与拖拽
        filter: '.el-table-fixed-column--left, .el-table-fixed-column--right, .el-table-column--selection, .index-column, .selection-column',
        // 防止其他列拖拽到固定列位置
        onMove: (evt) => {
          // 检查目标位置是否是固定列
          return !evt.related.classList.contains('el-table-fixed-column--left')
        },
        onEnd: (evt) => {
          if (evt.oldIndex === evt.newIndex) return
          let actualOldIndex = <number>evt.oldIndex
          let actualNewIndex = <number>evt.newIndex
          // 处理索引列, 序号列. 如果索引和序列号只开启了一个, 则拖拽时需要调整索引-1，如果都开启了，则需要调整索引-2
          if ((props.selection && !props.index) || (!props.selection && props.index)) {
            actualOldIndex -= 1
            actualNewIndex -= 1
          }
          if (props.selection && props.index) {
            actualOldIndex -= 2
            actualNewIndex -= 2
          }

          // 边界检查
          if (actualOldIndex < 0 || actualNewIndex < 0 || actualOldIndex >= tableColumns.value.length) {
            return
          }
          // 调整列顺序
          const [movedColumn] = tableColumns.value.splice(actualOldIndex, 1)
          tableColumns.value.splice(actualNewIndex, 0, movedColumn)

          // 强制刷新表格（双重保障）
          tableKey.value += 1
        }
      })
    }
  })
}

// 表格多选改变时，用于导出
function onSelectionChange(val: object) {
  emit('selection-change', val)
}

// 获取搜索组件类型
const getSearchComponentType = (type: string) => {
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

// 处理搜索按钮点击
const handleSearchButtonClick = (action: string) => {
  if (action === 'search') {
    // 触发搜索事件
    emit('search', props.searchFormData)
  } else if (action === 'reset') {
    // 重置搜索表单
    searchFormRef.value?.resetFields()
    emit('reset')
  } else {
    // 其他自定义操作
    emit('search-action', action)
  }
}

// 事件处理
const emit = defineEmits([
  'selection-change',
  'current-change',
  'size-change',
  'update:currentPage',
  'update:pageSize',
  'pagination-change',
  'search',
  'reset',
  'search-action'
])

// 页码变更
function handleCurrentChange(val: number) {
  emit('update:currentPage', val)
  emit('current-change', val)
  emit('pagination-change', paginationData)
}

// 每页条数变更
function handleSizeChange(val: number) {
  emit('update:pageSize', val)
  emit('size-change', val)
  emit('pagination-change', paginationData)
}

onMounted(() => {
  columnDrop()
})
// 在组件更新后重新初始化拖拽功能
onUpdated(() => {
  columnDrop()
})

watch(
    () => props.data,
    (newData) => {
      tableData.value = [...newData]
    },
    {deep: true}
)

watch(
    () => props.pageCurrent,
    () => {
      paginationData.current = props.pageCurrent
    }
)

watch(
    () => props.pageSize,
    () => {
      paginationData.size = props.pageSize
    }
)
</script>

<style scoped>
.main-search-click {
  display: flex;
  float: right;
}

/* 拖拽样式优化 */
.sortable-ghost {
  opacity: 0.8;
  background: #fff !important;
}

.sortable-chosen {
  background: #f5f7fa !important;
}

.sortable-drag {
  background: #fff !important;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
