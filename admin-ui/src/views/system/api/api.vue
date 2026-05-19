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
      :selection="true"
      row-key="id"
      :pagination="true"
      :page-total="tableData.total"
      :page-current="tableData.queryForm.current"
      :page-size="tableData.queryForm.size"
      @pagination-change="handleChangePage"
      @selection-change="selectionChange">
  </easy-table>
  <!-- 操作弹窗 -->
  <el-dialog v-model="dialog.dialogVisible" :title="dialog.dialogTitle" :close-on-click-modal="false"
             @close="closeDialog">
    <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="90px">
      <el-row :gutter="35">
        <el-form-item v-show="false" label="主键ID" prop="id"/>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="接口名称" prop="apiName">
            <el-input v-model="formState.apiName" clearable placeholder="请输入接口名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="接口地址" prop="apiUrl">
            <el-input v-model="formState.apiUrl" clearable placeholder="请输入接口地址"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="调用限次" prop="limitNum" required>
            <el-input-number v-model="formState.limitNum" :min="0" controls-position="right"/>
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
import {computed, nextTick, onMounted, reactive, ref} from 'vue'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'
import {apiApi} from '@/api/system/api'

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  apiName: [{required: true, message: '接口名称不能为空', trigger: 'blur'}],
  apiUrl: [{required: true, message: '接口地址不能为空', trigger: 'blur'}],
  limitNum: [{required: true, message: '限制次数不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    apiName: null as string | null,
    apiUrl: null as string | null,
    enable: null as boolean | null
  }
})

const formState = reactive({
  id: null as string | null,
  apiName: null as string | null,
  apiUrl: null as string | null,
  limitNum: 0 as number,
  enable: null as boolean | null
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const state = reactive({
  single: true as boolean,
  multipleSelection: [] as any[]
})

const deleteButtonDisabled = computed(() => state.single)

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'apiName',
    label: '接口名字'
  },
  {
    prop: 'apiUrl',
    label: '接口地址'
  },
  {
    prop: 'limitNum',
    label: '限制调用',
    align: 'center'
  },
  {
    prop: 'enable',
    label: '状态',
    type: 'tag',
    align: 'center',
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
        auth: 'sys.api.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.api.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    prop: 'apiName',
    label: '接口名字',
    type: 'input'
  },
  {
    prop: 'apiUrl',
    label: '接口地址',
    type: 'input'
  },
  {
    label: '状态',
    prop: 'enable',
    type: 'select',
    options: {
      data: [
        {label: '是', value: 'true'},
        {label: '否', value: 'false'}
      ],
      handler() {
        getApiPage()
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
    auth: 'sys.api.add'
  },
  {
    label: '删除',
    type: 'danger',
    action: 'delete',
    disabled: deleteButtonDisabled,
    auth: 'sys.api.del'
  }
])

async function getApiPage() {
  tableData.loading = true
  apiApi()
      .page(tableData.queryForm)
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
  getApiPage()
}

// 重置
function handleReset() {
  getApiPage()
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
    dialog.dialogTitle = '新增接口'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        apiName: null,
        apiUrl: null,
        limitNum: 0,
        enable: true
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑接口'
    dialog.submitTxt = '更新'
    nextTick(() => {
      Object.assign(formState, {...row})
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
}

// 选择
function selectionChange(val: any[]) {
  state.multipleSelection = val.map((item: { id: any }) => item.id)
  state.single = val.length === 0
}

// 新增提交
function onSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      if (dialog.type === 'add') {
        apiApi()
            .add(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        apiApi()
            .update(formState)
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
function onRowDel(row: any | null) {
  ElMessageBox.confirm(`此操作将永久删除接口 ${row.apiName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        apiApi()
            .delete({id: row.id})
            .then((res) => {
              ElMessage.success(res.msg)
              getApiPage()
            })
      })
      .catch(() => {
      })
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getApiPage()
}

// 关闭弹窗
async function closeDialog() {
  await getApiPage()
  dialog.dialogVisible = false
}

onMounted(() => {
  getApiPage()
})
</script>

<style scoped></style>
