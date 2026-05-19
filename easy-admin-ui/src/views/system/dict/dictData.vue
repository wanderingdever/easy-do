<template>
  <div class="" style="display: inline-flex">
    <el-button :icon="Back" text @click="router.back()"></el-button>
    <easy-search-form
        :form-data="tableData.queryForm"
        :columns="searchColumns"
        :buttons="searchButtons"
        :selection="true"
        label-width="70"
        @search="handleSearch"
        @reset="handleReset"
        @action="handleAction"
        @selection-change="selectionChange"/>
  </div>
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
          <el-form-item label="字典标签" prop="dictLabel">
            <el-input v-model="formState.dictLabel" clearable placeholder="请输入字典标签"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="字典类型" prop="dictValue">
            <el-input v-model="formState.dictValue" clearable placeholder="请输入字典值"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="样式属性" prop="cssClass">
            <el-select v-model="formState.cssClass" class="w100" required>
              <el-option v-for="item in state.cssClassOptions" :key="item.value" :label="item.label"
                         :value="item.value"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="字典排序" prop="dictSort" required>
            <el-input-number v-model="formState.dictSort" :min="1" class="w100" controls-position="right"
                             placeholder="请输入排序"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="回显样式" prop="listClass">
            <el-input v-model="formState.listClass" clearable placeholder="请输入样式属性" type="textarea"></el-input>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否启用" prop="enable">
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
import {computed, nextTick, onMounted, reactive, ref, watch} from 'vue'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'
import {dictApi} from '@/api/system/dict'
import {useRoute, useRouter} from 'vue-router'
import {Back} from '@element-plus/icons-vue'

const route = useRoute()
const router = useRouter()
const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  dictLabel: [{required: true, message: '字典标签不能为空', trigger: 'blur'}],
  dictValue: [{required: true, message: '字典值不能为空', trigger: 'blur'}],
  dictTypeId: [{required: true, message: '字典类型不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [
      {
        column: 'dict_sort',
        asc: true
      }
    ],
    dictTypeId: null as string | null,
    dictLabel: null as string | null,
    dictValue: null as string | null,
    enable: null as boolean | null
  }
})

const formState = reactive({
  id: null as number | null,
  dictTypeId: null as string | null,
  dictLabel: null as string | null,
  dictValue: null as string | null,
  dictSort: 1 as number,
  cssClass: null as string | null,
  listClass: null as string | null,
  enable: true as boolean
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const dictTypeListRef = ref([])

const state = reactive({
  single: true as boolean,
  multipleSelection: [] as any[],
  // 数据标签回显样式
  cssClassOptions: [
    {
      value: 'default',
      label: '默认'
    },
    {
      value: 'primary',
      label: '主要'
    },
    {
      value: 'success',
      label: '成功'
    },
    {
      value: 'info',
      label: '信息'
    },
    {
      value: 'warning',
      label: '警告'
    },
    {
      value: 'danger',
      label: '危险'
    }
  ] as SelectPagination[]
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'dictLabel',
    label: '字典标签'
  },
  {
    prop: 'dictValue',
    label: '字典值'
  },
  {
    prop: 'cssClass',
    label: 'css类型'
  },
  {
    prop: 'listClass',
    label: '样式列表',
    align: 'center'
  },
  {
    prop: 'dictSort',
    label: '排序',
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
        auth: 'sys.dict.data.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.dict.data.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = computed<SearchFormItem[]>(() => [
  {
    label: '字典类型',
    prop: 'dictTypeId',
    type: 'select',
    options: {
      data: dictTypeListRef.value,
      labelField: 'dictName',
      valueField: 'id',
      filterable: true,
      handler: (row: any) => {
        tableData.queryForm.dictTypeId = row
        // 使用 router.replace 更新 URL 参数
        getDictDataPage()
        router.replace({
          query: {...route.query, dictTypeId: row}
        })
      }
    }
  },
  {
    label: '字典标签',
    prop: 'dictLabel',
    type: 'input'
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
        getDictDataPage()
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
    auth: 'sys.dict.data.add'
  }
])

async function getDictDataPage() {
  tableData.loading = true
  dictApi()
      .pageData(tableData.queryForm)
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
  getDictDataPage()
}

// 重置
function handleReset() {
  getDictDataPage()
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
        dictTypeId: tableData.queryForm.dictTypeId as string,
        dictLabel: null,
        dictValue: null,
        dictSort: 1,
        cssClass: null,
        listClass: null,
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
            .addData(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        dictApi()
            .updateData(formState)
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
  let ids: any = row != null ? [row.id] : state.multipleSelection
  ElMessageBox.confirm(`此操作将永久删除字典数据 ${row.dictName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        dictApi()
            .deleteData({idList: ids})
            .then((res) => {
              ElMessage.success(res.msg)
              getDictDataPage()
            })
      })
      .catch(() => {
      })
}

// 选择
function selectionChange(val: any[]) {
  state.multipleSelection = val.map((item: { id: any }) => item.id)
  state.single = val.length === 0
}

// 获取字典类型列表
async function dictTypeList() {
  await dictApi()
      .typeAndDataList({})
      .then((response) => {
        dictTypeListRef.value = response.data
      })
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getDictDataPage()
}

// 关闭弹窗
async function closeDialog() {
  await getDictDataPage()
  dialog.dialogVisible = false
}

// 页面加载时
onMounted(() => {
  if (route.query.dictTypeId) {
    tableData.queryForm.dictTypeId = route.query.dictTypeId as string
  }
  getDictDataPage()
  dictTypeList()
})

watch(
    () => route.query.dictTypeId,
    (newVal) => {
      if (newVal) {
        tableData.queryForm.dictTypeId = newVal
        getDictDataPage()
      }
    }
)
</script>

<style scoped></style>
