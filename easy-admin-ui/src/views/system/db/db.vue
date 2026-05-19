<template>
  <div class="main-container">
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

    <!-- 查看/编辑/新增弹窗 -->
    <el-dialog v-model="dialog.dialogVisible" :title="dialog.dialogTitle" :close-on-click-modal="false"
               @close="closeDialog" width="700">
      <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="100px"
               :disabled="dialog.type === 'view'">
        <el-row :gutter="35">
          <el-form-item v-show="false" label="主键ID" prop="id"/>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="配置键名" prop="secretKey">
              <el-input v-model="formState.secretKey" clearable placeholder="请输入配置键名"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="数据库类型" prop="dbType">
              <el-select v-model="formState.dbType" class="w100" clearable placeholder="请选择数据库类型">
                <el-option label="MySQL" value="MYSQL"/>
                <el-option label="PostgreSQL" value="POSTGRESQL"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="主机地址" prop="host">
              <el-input v-model="formState.host" clearable placeholder="请输入主机地址"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="端口" prop="port">
              <el-input-number v-model="formState.port" :min="1" :max="65535" class="w100"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="数据库名称" prop="databaseName">
              <el-input v-model="formState.databaseName" clearable placeholder="请输入数据库名称"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="用户名" prop="username">
              <el-input v-model="formState.username" clearable placeholder="请输入用户名"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="密码" prop="password">
              <el-input v-model="formState.password" type="password" clearable placeholder="请输入密码" show-password/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="是否启用" prop="enabled">
              <el-switch v-model="formState.enabled" :active-value="1" :inactive-value="0" inline-prompt
                         active-text="启用" inactive-text="禁用"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button size="default" @click="closeDialog">取 消</el-button>
          <el-button v-if="dialog.type !== 'view'" size="default" type="info"
                     @click="handleTestConnection">测试连接</el-button>
          <el-button v-if="dialog.type !== 'view'" size="default" type="primary"
                     @click="onSubmit(ruleFormRef)">{{ dialog.submitTxt }}</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 测试结果弹窗 -->
    <el-dialog v-model="testDialog.dialogVisible" title="连接测试结果" width="600">
      <el-descriptions :column="1" border>
        <el-descriptions-item label="连接状态">
          <el-tag :type="testResult.success ? 'success' : 'danger'">
            {{ testResult.success ? '成功' : '失败' }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="测试消息">
          {{ testResult.message }}
        </el-descriptions-item>
        <el-descriptions-item label="连接耗时" v-if="testResult.success">
          {{ testResult.connectionTime }} ms
        </el-descriptions-item>
        <el-descriptions-item label="数据库产品" v-if="testResult.success">
          {{ testResult.databaseProductName }}
        </el-descriptions-item>
        <el-descriptions-item label="数据库版本" v-if="testResult.success">
          {{ testResult.databaseVersion }}
        </el-descriptions-item>
        <el-descriptions-item label="JDBC URL" v-if="testResult.success">
          {{ testResult.jdbcUrl }}
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import EasyTable, {EasyTableColumn} from '@/components/table/easyTable.vue'
import EasySearchForm, {SearchFormButton, SearchFormItem} from '@/components/searchForm/easySearchForm.vue'
import {computed, nextTick, onMounted, reactive, ref} from 'vue'
import {dbApi} from '@/api/system/db'
import {ElLoading, ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  secretKey: [{required: true, message: '配置键名不能为空', trigger: 'blur'}],
  dbType: [{required: true, message: '数据库类型不能为空', trigger: 'change'}],
  host: [{required: true, message: '主机地址不能为空', trigger: 'blur'}],
  port: [{required: true, message: '端口不能为空', trigger: 'blur'}],
  databaseName: [{required: true, message: '数据库名称不能为空', trigger: 'blur'}],
  username: [{required: true, message: '用户名不能为空', trigger: 'blur'}],
  password: [{required: true, message: '密码不能为空', trigger: 'blur'}],
  enabled: [{required: true, message: '启用状态不能为空', trigger: 'change'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    dbName: null as string | null,
    host: null as string | null,
    dbKey: null as string | null,
    enable: null as boolean | null
  }
})

const formState = reactive<FormDb>({
  id: null,
  secretKey: '',
  dbType: 'MYSQL',
  host: '',
  port: 3306,
  databaseName: '',
  username: '',
  password: '',
  enabled: 1
})

const testResult = reactive<DbTestResult>({
  success: false,
  message: '',
  connectionTime: 0,
  databaseVersion: '',
  databaseProductName: '',
  jdbcUrl: ''
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const testDialog = reactive({
  dialogVisible: false
})

const state = reactive({
  single: true as boolean,
  multipleSelection: [] as any[]
})

const deleteButtonDisabled = computed(() => state.single)

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'secretKey',
    label: '配置键名'
  },
  {
    prop: 'dbType',
    label: '数据库类型',
    align: 'center',
    type: 'tag',
    tagConfig: {
      options: [
        {dictLabel: 'MySQL', dictValue: 'MYSQL', cssClass: 'primary'},
        {dictLabel: 'PostgreSQL', dictValue: 'POSTGRESQL', cssClass: 'success'}
      ]
    }
  },
  {
    prop: 'host',
    label: '主机地址'
  },
  {
    prop: 'port',
    label: '端口',
    align: 'center'
  },
  {
    prop: 'databaseName',
    label: '数据库名称'
  },
  {
    prop: 'username',
    label: '用户名'
  },
  {
    prop: 'enabled',
    label: '启用状态',
    align: 'center',
    type: 'tag',
    tagConfig: {
      options: [
        {dictLabel: '启用', dictValue: 'true', cssClass: 'success'},
        {dictLabel: '禁用', dictValue: 'false', cssClass: 'danger'}
      ]
    }
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    width: 280,
    buttons: [
      {
        text: '查看',
        type: 'primary',
        handler: (row: RowDb) => {
          openDialog('view', row)
        }
      },
      {
        text: '编辑',
        type: 'warning',
        auth: 'sys.db.edit',
        handler: (row: RowDb) => {
          openDialog('update', row)
        }
      },
      {
        text: '测试连接',
        type: 'info',
        auth: 'sys.db.test',
        handler: (row: any) => {
          handleTestConnectionById(row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.db.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '数据库名称',
    prop: 'dbName',
    type: 'input'
  },
  {
    label: '主机地址',
    prop: 'host',
    type: 'input'
  },
  {
    label: '配置键名',
    prop: 'dbKey',
    type: 'input'
  },
  {
    label: '启用状态',
    prop: 'enable',
    type: 'select',
    options: {
      data: [
        {label: '启用', value: true},
        {label: '禁用', value: false}
      ],
      handler() {
        getDbPage()
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
    auth: 'sys.db.add'
  },
  {
    label: '删除',
    type: 'danger',
    action: 'delete',
    disabled: deleteButtonDisabled,
    auth: 'sys.db.del'
  }
])

async function getDbPage() {
  tableData.loading = true
  try {
    const res = await dbApi().page(tableData.queryForm)
    tableData.data = res.data.records
    tableData.total = res.data.total
  } catch (error) {
    ElMessage.error('获取数据失败')
    console.error('获取数据库连接配置列表失败:', error)
  } finally {
    tableData.loading = false
  }
}


// 搜索
function handleSearch(formData: Record<string, any>) {
  tableData.queryForm = {
    ...tableData.queryForm,
    ...formData
  }
  getDbPage()
}

// 重置
function handleReset() {
  getDbPage()
}

// 操作
function handleAction(action: string) {
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
  resetRuleForm()
  if (action === 'add') {
    dialog.dialogTitle = '新增数据库连接配置'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        secretKey: '',
        dbType: 'MYSQL',
        host: '',
        port: 3306,
        databaseName: '',
        username: '',
        password: '',
        enabled: 1
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update' || action === 'view') {
    dialog.dialogTitle = action === 'update' ? '编辑数据库连接配置' : '查看数据库连接配置'
    dialog.submitTxt = '更新'
    dbApi()
        .get(row.id)
        .then((res) => {
          nextTick(() => {
            Object.assign(formState, res.data)
            formState.enabled = res.data.enabled ? 1 : 0
          }).then(() => {
            dialog.dialogVisible = true
          })
        })
  }
}

// 选择
function selectionChange(val: RowDb[]) {
  state.multipleSelection = val.map((item) => item.id)
  state.single = val.length === 0
}

// 新增/更新提交
function onSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      const apiCall = dialog.type === 'add' ? dbApi().add(formState) : dbApi().update(formState)
      apiCall.then((res) => {
        ElMessage.success(res.msg)
        dialog.dialogVisible = false
        getDbPage()
      })
    }
  })
}

// 删除
function onRowDel(row: any | null) {
  let ids: any = row != null ? [row.id] : state.multipleSelection
  let configName = row != null ? row.secretKey : state.multipleSelection.length + '项'
  ElMessageBox.confirm(`此操作将永久删除配置 ${configName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        if (row != null) {
          dbApi()
              .del({id: row.id})
              .then((res) => {
                ElMessage.success(res.msg)
                getDbPage()
              })
        } else {
          dbApi()
              .delBatch({idList: ids})
              .then((res) => {
                ElMessage.success(res.msg)
                getDbPage()
              })
        }
      })
      .catch(() => {
      })
}

// 测试连接（表单中）
function handleTestConnection() {
  ruleFormRef.value?.validate((valid) => {
    if (valid) {
      const loading = ElLoading.service({
        lock: true,
        text: '正在测试连接，请稍候...',
        background: 'rgba(0, 0, 0, 0.7)'
      })
      dbApi()
          .test(formState)
          .then((res) => {
            Object.assign(testResult, res.data)
            testDialog.dialogVisible = true
          })
          .catch(() => {
            ElMessage.error('连接测试失败')
          })
          .finally(() => {
            loading.close()
          })
    }
  })
}

// 根据配置ID测试连接
function handleTestConnectionById(row: any) {
  const loading = ElLoading.service({
    lock: true,
    text: '正在测试连接，请稍候...',
    background: 'rgba(0, 0, 0, 0.7)'
  })
  dbApi()
      .testById({id: row.id})
      .then((res) => {
        Object.assign(testResult, res.data)
        testDialog.dialogVisible = true
      })
      .catch(() => {
        ElMessage.error('连接测试失败')
      })
      .finally(() => {
        loading.close()
      })
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getDbPage()
}

// 关闭弹窗
async function closeDialog() {
  await getDbPage()
  dialog.dialogVisible = false
}

onMounted(() => {
  getDbPage()
})
</script>

<style scoped></style>
