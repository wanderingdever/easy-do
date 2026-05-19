<template>
  <easy-search-form
      :form-data="tableData.queryForm"
      :columns="searchColumns"
      :buttons="searchButtons"
      label-width="70"
      @search="handleSearch"
      @reset="handleReset"
      @action="handleAction"/>
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
      @pagination-change="handleChangePage">
  </easy-table>
  <!-- 操作弹窗 -->
  <el-dialog v-model="dialog.dialogVisible" :title="dialog.dialogTitle" :close-on-click-modal="false"
             @close="closeDialog">
    <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="90px">
      <el-row :gutter="35">
        <el-form-item v-show="false" label="主键ID" prop="id"/>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="字典名称" prop="dictName">
            <el-input v-model="formState.dictName" clearable placeholder="请输入字典名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="字典类型" prop="dictType">
            <el-input v-model="formState.dictType" clearable placeholder="请输入字典类型"/>
          </el-form-item>
        </el-col>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="描述" prop="description">
            <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 6 }" v-model="formState.description" clearable
                      placeholder="请输入描述"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="系统内置" prop="isSystem" required>
            <el-switch v-model="formState.isSystem" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否启用" prop="enable" required>
            <el-switch v-model="formState.enable" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button size="default" @click="closeDialog">取 消</el-button>
        <el-button size="default" type="primary" @click="onSubmit(ruleFormRef)">{{ dialog.submitTxt }}</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import EasyTable, {EasyTableColumn} from '@/components/table/easyTable.vue'
import EasySearchForm, {SearchFormButton, SearchFormItem} from '@/components/searchForm/easySearchForm.vue'
import {nextTick, onMounted, reactive, ref} from 'vue'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'
import {dictApi} from '@/api/system/dict'
import {useRouter} from 'vue-router'

const router = useRouter()

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  dictName: [{required: true, message: '字典名称不能为空', trigger: 'blur'}],
  dictType: [{required: true, message: '字典类型不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    dictName: null as string | null,
    dictType: null as string | null,
    isSystem: null as boolean | null,
    enable: null as boolean | null
  }
})

const formState = reactive({
  id: null as number | null,
  dictName: null as string | null,
  dictType: null as string | null,
  description: null as string | null,
  isSystem: true as boolean,
  enable: true as boolean
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'dictName',
    label: '字典名称'
  },
  {
    prop: 'dictType',
    label: '字典类型',
    type: 'link',
    link: {
      type: 'primary',
      handler: (row: any) => {
        toDictData(row)
      }
    }
  },
  {
    prop: 'description',
    label: '描述'
  },
  {
    prop: 'isSystem',
    label: '系统内置',
    align: 'center'
  },
  {
    prop: 'enable',
    label: '状态',
    align: 'center',
    type: 'tag',
    tagConfig: {
      options: [
        {dictLabel: '启用', dictValue: 'true', cssClass: 'success'},
        {dictLabel: '停用', dictValue: 'false', cssClass: 'danger'}
      ]
    }
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    buttons: [
      {
        text: '编辑',
        type: 'warning',
        auth: 'sys.dict.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.dict.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '字典名称',
    prop: 'dictName',
    type: 'input'
  },
  {
    label: '字典类型',
    prop: 'dictType',
    type: 'input'
  },
  {
    label: '系统内置',
    prop: 'isSystem',
    type: 'select',
    options: {
      data: [
        {label: '是', value: 'true'},
        {label: '否', value: 'false'}
      ],
      handler: (row: any) => {
        getDictPage()
      }
    }
  },
  {
    label: '启用状态',
    prop: 'enable',
    type: 'select',
    options: {
      data: [
        {label: '启用', value: 'true'},
        {label: '停用', value: 'false'}
      ],
      handler: (row: any) => {
        getDictPage()
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
    auth: 'sys.dict.add'
  }
])

async function getDictPage() {
  tableData.loading = true
  dictApi()
      .pageType(tableData.queryForm)
      .then((res) => {
        tableData.data = res.data.records
        tableData.total = res.data.total
        tableData.loading = false
      })
}

// 搜索
function handleSearch(formData: Record<string, any>) {
  // 保留原有的分页属性，只更新搜索相关的属性
  tableData.queryForm = {
    ...tableData.queryForm,
    ...formData
  }
  getDictPage()
}

// 重置
function handleReset() {
  getDictPage()
}

// 操作
function handleAction(action: string) {
  // 根据action执行不同操作
  if (action === 'add') {
    openDialog('add', null)
  }
}

// 重置表单
function resetRuleForm() {
  ruleFormRef.value?.resetFields()
}

function openDialog(action: string, row: any) {
  dialog.type = action
  // 重置表单
  resetRuleForm()
  // 根据action执行不同操作
  if (action === 'add') {
    dialog.dialogTitle = '新增字典'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        dictName: null,
        dictType: null,
        description: null,
        isSystem: true,
        enable: true
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑字典'
    dialog.submitTxt = '更新'
    nextTick(() => {
      Object.assign(formState, {...row})
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
}

// 新增提交
function onSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      if (dialog.type === 'add') {
        dictApi()
            .addType(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        dictApi()
            .updateType(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
    } else {
      return
    }
  })
}

// 删除字典
function onRowDel(row: any) {
  let ids: any = [row.id]
  ElMessageBox.confirm(`此操作将永久删除字典 ${row.dictName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        dictApi()
            .deleteType({id: ids})
            .then((res) => {
              ElMessage.success(res.msg)
              getDictPage()
            })
      })
      .catch(() => {
      })
}

function toDictData(row: any) {
  router.push({
    path: '/system/dict_data',
    query: {
      dictTypeId: row.id
    }
  })
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getDictPage()
}

// 关闭弹窗
async function closeDialog() {
  await getDictPage()
  dialog.dialogVisible = false
}

onMounted(() => {
  getDictPage()
})
</script>

<style scoped></style>
