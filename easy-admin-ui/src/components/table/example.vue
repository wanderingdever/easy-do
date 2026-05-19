<template>
  <easy-table
      :data="tableData"
      :columns="columns"
      :column-drag="true"
      :selection="true"
      :index="true"
      :pagination="true"
      :page-total="total"
      :page-current="currentPage"
      :page-size="pageSize"
      @current-change="currentChange"
      @size-change="sizeChange"
      @pagination-change="handleChangePage"
      @selection-change="selectionChange">
  </easy-table>
</template>

<script setup lang="ts">
import EasyTable, {EasyTableColumn} from '@/components/table/easyTable.vue'
import {ref} from 'vue'

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'name',
    label: '姓名'
  },
  {
    prop: 'age',
    label: '年龄'
  },
  {
    prop: 'sex',
    label: '性别'
  },
  {
    prop: 'address',
    label: '地址',
    type: 'image',
    imageWidth: 50,
    imageHeight: 50
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    buttons: [
      {
        text: '编辑',
        type: 'warning',
        handler: (row, index) => {
          console.log(row, index)
        }
      },
      {
        text: '删除',
        type: 'danger',
        handler: (row, index) => {
          console.log(row, index)
        }
      }
    ]
  }
])

const tableData = ref([
  {
    name: '张三',
    age: '29',
    sex: '男',
    address: 'https://cos.dawn-fintech.com/1715586358847/table2.jpg'
  },
  {
    name: '李四',
    age: '20',
    sex: '男'
  },
  {
    name: '王五',
    age: '22',
    sex: '女'
  },
  {
    name: '赵六',
    age: '24',
    sex: '男'
  },
  {
    name: '孙七',
    age: '26',
    sex: '女'
  },
  {
    name: '周八',
    age: '28',
    sex: '男'
  },
  {
    name: '吴九',
    age: '30',
    sex: '女'
  },
  {name: '郑十', age: '32', sex: '男'}
])

const total = ref(100)
const currentPage = ref(1)
const pageSize = ref(10)

const selectionChange = (val: any[]) => {
  console.log(val)
}

const currentChange = (val: number) => {
  currentPage.value = val
}

const sizeChange = (val: number) => {
  pageSize.value = val
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  console.log('Current page changed to:', item)
  currentPage.value = item.current
  pageSize.value = item.size
}
</script>

<style scoped></style>
