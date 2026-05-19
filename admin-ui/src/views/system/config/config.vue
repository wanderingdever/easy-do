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
          <el-form-item label="参数名称" prop="configName">
            <el-input v-model="formState.configName" clearable placeholder="请输入参数名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="参数键" prop="configKey">
            <el-input v-model="formState.configKey" clearable placeholder="请输入参数键"/>
          </el-form-item>
        </el-col>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="参数值" prop="configValue">
            <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 6 }" v-model="formState.configValue" clearable
                      placeholder="请输入参数值"/>
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
import {computed, nextTick, onMounted, reactive, ref} from 'vue'
import {configApi} from '@/api/system/config'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  configName: [{required: true, message: '参数名称不能为空', trigger: 'blur'}],
  configKey: [{required: true, message: '参数键名不能为空', trigger: 'blur'}],
  configValue: [{required: true, message: '参数键值不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    configName: null as string | null,
    configKey: null as string | null,
    isSystem: null as boolean | null,
    enable: null as boolean | null
  }
})

const formState = reactive({
  id: null as string | null,
  configName: null as string | null,
  configKey: null as string | null,
  configValue: null as string | null,
  isSystem: true as boolean,
  enable: true as boolean
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
    prop: 'configName',
    label: '参数名称'
  },
  {
    prop: 'configKey',
    label: '参数键'
  },
  {
    prop: 'configValue',
    label: '参数值'
  },
  {
    prop: 'isSystem',
    label: '系统内置',
    type: 'tag',
    tagConfig: {
      options: [
        {dictLabel: '内置', dictValue: 'true', cssClass: 'success'},
        {dictLabel: '非内置', dictValue: 'false', cssClass: 'info'}
      ]
    }
  },
  {
    prop: 'enable',
    label: '状态',
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
        auth: 'sys.config.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.config.del',
        handler: (row: any) => {
          console.log(row)
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '参数名称',
    prop: 'configName',
    type: 'input'
  },
  {
    label: '参数键名',
    prop: 'configKey',
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
      handler() {
        getConfigPage()
      }
    }
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
        getConfigPage()
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
    auth: 'sys.config.add'
  },
  {
    label: '删除',
    type: 'danger',
    action: 'delete',
    disabled: deleteButtonDisabled,
    auth: 'sys.config.del'
  }
])

async function getConfigPage() {
  tableData.loading = true
  configApi()
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
  getConfigPage()
}

// 重置
function handleReset() {
  getConfigPage()
}

// 操作
function handleAction(action: string) {
  // 根据action执行不同操作
  if (action === 'add') {
    openDialog('add', null)
  }
  if (action === 'delete') {
    onRowDel(null)
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
    dialog.dialogTitle = '新增参数'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        configName: null,
        configKey: null,
        configValue: null,
        isSystem: true,
        enable: true
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑参数'
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
        configApi()
            .add(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        configApi()
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
  let ids: any = row != null ? [row.id] : state.multipleSelection
  let configName = row != null ? row.configName : state.multipleSelection.length + '项'
  ElMessageBox.confirm(`此操作将永久删除参数 ${configName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        configApi()
            .delete({idList: ids})
            .then((res) => {
              ElMessage.success(res.msg)
              getConfigPage()
            })
      })
      .catch(() => {
      })
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getConfigPage()
}

// 关闭弹窗
async function closeDialog() {
  await getConfigPage()
  dialog.dialogVisible = false
}

onMounted(() => {
  getConfigPage()
})
</script>

<style scoped></style>
