<template>
  <easy-search-form
      :form-data="tableData.queryForm"
      :columns="searchColumns"
      :buttons="searchButtons"
      label-width="70"
      @search="handleSearch"
      @reset="handleReset"
      @action="handleAction"
  />

  <easy-table
      :loading="tableData.loading"
      :data="tableData.data"
      :columns="columns"
      :column-drag="true"
      row-key="id"
      :pagination="true"
      :page-total="tableData.total"
      :page-current="tableData.queryForm.current"
      :page-size="tableData.queryForm.size"
      @pagination-change="handleChangePage"
  />

  <EditDialog v-model="dialogVisible" :editing="editing" @saved="handleSaved"/>

  <DetailDialog v-model="detailVisible" :id="detailId" @updated="getNoticePage"/>
</template>

<script setup lang="ts">
import EasyTable, {type EasyTableColumn} from '@/components/table/easyTable.vue'
import EasySearchForm, {type SearchFormButton, type SearchFormItem} from '@/components/searchForm/easySearchForm.vue'
import {onMounted, reactive, ref} from 'vue'
import {noticeApi} from '@/api/system/notice'
import {ElMessage, ElMessageBox} from 'element-plus'
import EditDialog from './components/EditDialog.vue'
import DetailDialog from './components/DetailDialog.vue'

const api = noticeApi()

const dialogVisible = ref(false)
const detailVisible = ref(false)
const detailId = ref('')
const editing = ref<NoticeForm | null>(null)

const tableData = reactive({
  loading: false,
  total: 0,
  data: [] as NoticeRow[],
  queryForm: {
    current: 1,
    size: 10,
    title: null as string | null,
    status: null as NoticeStatus | null,
    noticeType: null as NoticeType | null
  }
})

const statusTags = {
  DRAFT: {dictLabel: '草稿', dictValue: 'DRAFT', cssClass: 'info'},
  PUBLISHED: {dictLabel: '已发布', dictValue: 'PUBLISHED', cssClass: 'success'},
  REVOKED: {dictLabel: '已撤回', dictValue: 'REVOKED', cssClass: 'warning'}
}

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'title',
    label: '标题'
  },
  {
    prop: 'noticeType',
    label: '类型'
  },
  {
    prop: 'status',
    label: '状态',
    type: 'tag',
    tagConfig: {
      options: Object.values(statusTags)
    }
  },
  {
    prop: 'publishTime',
    label: '发布时间'
  },
  {
    prop: 'createTime',
    label: '创建时间'
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    width: 350,
    buttons: [
      {
        text: '详情',
        type: 'primary',
        handler: (row: NoticeRow) => openDetail(row)
      },
      {
        text: '编辑',
        type: 'warning',
        auth: 'message.notice.edit',
        handler: (row: NoticeRow) => openEdit(row)
      },
      {
        text: '发布',
        type: 'success',
        auth: 'message.notice.publish',
        isShow: (row: NoticeRow) => row.status !== 'PUBLISHED',
        handler: (row: NoticeRow) => doPublish(row)
      },
      {
        text: '撤回',
        type: 'info',
        auth: 'message.notice.revoke',
        isShow: (row: NoticeRow) => row.status === 'PUBLISHED',
        handler: (row: NoticeRow) => doRevoke(row)
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'message.notice.del',
        handler: (row: NoticeRow) => doDelete(row)
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '标题',
    prop: 'title',
    type: 'input'
  },
  {
    label: '状态',
    prop: 'status',
    type: 'select',
    options: {
      data: [
        {label: '草稿', value: 'DRAFT'},
        {label: '已发布', value: 'PUBLISHED'},
        {label: '已撤回', value: 'REVOKED'}
      ],
      handler() {
        getNoticePage()
      }
    }
  }
])

const searchButtons = reactive<SearchFormButton[]>([
  {
    label: '查询',
    type: 'primary',
    action: 'search'
  },
  {
    label: '重置',
    type: 'info',
    action: 'reset'
  },
  {
    label: '新增',
    type: 'success',
    action: 'add',
    auth: 'message.notice.add'
  }
])

function getNoticePage() {
  tableData.loading = true
  api
      .page({
        ...tableData.queryForm,
        pageNum: tableData.queryForm.current,
        pageSize: tableData.queryForm.size
      })
      .then((res: any) => {
        tableData.data = res.data?.records || []
        tableData.total = res.data?.total || 0
      })
      .catch((err) => {
        console.error(err)
        ElMessage.error('获取公告列表失败')
      })
      .finally(() => {
        tableData.loading = false
      })
}

function handleSearch(formData: Record<string, any>) {
  tableData.queryForm = {
    ...tableData.queryForm,
    ...formData,
    current: 1
  }
  getNoticePage()
}

function handleReset() {
  tableData.queryForm = {
    ...tableData.queryForm,
    title: null,
    status: null,
    noticeType: null,
    current: 1
  }
  getNoticePage()
}

function handleAction(action: string) {
  if (action === 'add') {
    openAdd()
  }
}

function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getNoticePage()
}

function openDetail(row: NoticeRow) {
  detailId.value = row.id
  detailVisible.value = true
}

function openAdd() {
  editing.value = null
  dialogVisible.value = true
}

function openEdit(row: NoticeRow) {
  api
      .detail(row.id)
      .then((res: any) => {
        const detail = res.data as NoticeDetail
        editing.value = {
          id: detail.id,
          title: detail.title,
          content: detail.content,
          noticeType: detail.noticeType
        }
        dialogVisible.value = true
      })
      .catch((err) => {
        console.error(err)
        ElMessage.error('获取公告内容失败')
      })
}

function doPublish(row: NoticeRow) {
  ElMessageBox.confirm('确认发布该公告？', '提示', {type: 'warning'}).then(() => {
    api
        .publish({id: row.id})
        .then(() => {
          ElMessage.success('发布成功')
          getNoticePage()
        })
        .catch((err) => {
          console.error(err)
          ElMessage.error('发布失败')
        })
  })
}

function doRevoke(row: NoticeRow) {
  ElMessageBox.confirm('确认撤回该公告？', '提示', {type: 'warning'}).then(() => {
    api
        .revoke({id: row.id})
        .then(() => {
          ElMessage.success('已撤回')
          getNoticePage()
        })
        .catch((err) => {
          console.error(err)
          ElMessage.error('撤回失败')
        })
  })
}

function doDelete(row: NoticeRow) {
  ElMessageBox.confirm('删除后不可恢复，确认删除？', '提示', {type: 'warning'}).then(() => {
    api
        .delete({id: row.id})
        .then(() => {
          ElMessage.success('删除成功')
          getNoticePage()
        })
        .catch((err) => {
          console.error(err)
          ElMessage.error('删除失败')
        })
  })
}

function handleSaved() {
  dialogVisible.value = false
  getNoticePage()
}

onMounted(() => {
  getNoticePage()
})
</script>

<style scoped></style>
