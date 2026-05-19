<template>
  <easy-search-table
      :columns="columns"
      :data="tableData"
      :search-form-data="searchFormData"
      :search-buttons="searchButtons"
      :search-label-width="'100px'"
      :pagination="true"
      :page-total="pageTotal"
      :page-current="pageCurrent"
      :page-size="pageSize"
      @search="handleSearch"
      @reset="handleReset"
      @search-action="handleSearchAction"
      @current-change="handleCurrentChange"
      @size-change="handleSizeChange"/>
</template>

<script setup lang="ts">
import {reactive, ref} from 'vue'
import EasySearchTable, {EasyTableColumn, SearchFormButton} from '@/components/searchTable/easySearchTable.vue'

// 定义表格列
const columns: Array<EasyTableColumn> = [
  {
    prop: 'id',
    label: 'ID',
    width: 80,
    align: 'center',
    searchable: true,
    searchType: 'input',
    searchPlaceholder: '请输入ID'
  },
  {
    prop: 'name',
    label: '姓名',
    width: 120,
    align: 'center',
    searchable: true,
    searchType: 'input',
    searchPlaceholder: '请输入姓名'
  },
  {
    prop: 'status',
    label: '状态',
    width: 100,
    align: 'center',
    type: 'tag',
    tagOptions: [
      {value: 0, label: '禁用', type: 'danger'},
      {value: 1, label: '启用', type: 'success'}
    ],
    searchable: true,
    searchType: 'select',
    searchOptions: {
      data: [
        {value: 0, label: '禁用'},
        {value: 1, label: '启用'}
      ],
      labelField: 'label',
      valueField: 'value'
    }
  },
  {
    prop: 'createTime',
    label: '创建时间',
    width: 180,
    align: 'center',
    searchable: true,
    searchType: 'date',
    searchPlaceholder: '请选择日期'
  }
]

// 搜索表单数据
const searchFormData = reactive({
  id: '',
  name: '',
  status: '',
  createTime: ''
})

// 搜索按钮配置
const searchButtons: Array<SearchFormButton> = [
  {
    label: '搜索',
    type: 'primary',
    action: 'search'
  },
  {
    label: '重置',
    type: 'default',
    action: 'reset'
  }
]

// 表格数据
const tableData = ref([
  {
    id: 1,
    name: '张三',
    status: 1,
    createTime: '2023-01-01'
  },
  {
    id: 2,
    name: '李四',
    status: 0,
    createTime: '2023-02-01'
  }
])

// 分页相关数据
const pageTotal = ref(2)
const pageCurrent = ref(1)
const pageSize = ref(10)

// 处理搜索事件
const handleSearch = (formData) => {
  console.log('搜索参数:', formData)
  // 在这里执行搜索逻辑
}

// 处理重置事件
const handleReset = () => {
  console.log('重置搜索条件')
  // 在这里执行重置逻辑
}

// 处理自定义搜索操作
const handleSearchAction = (action) => {
  console.log('自定义操作:', action)
}

// 处理页码变更
const handleCurrentChange = (val) => {
  console.log('当前页码:', val)
}

// 处理每页条数变更
const handleSizeChange = (val) => {
  console.log('每页条数:', val)
}
</script>
