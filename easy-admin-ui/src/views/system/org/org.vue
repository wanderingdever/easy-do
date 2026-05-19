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
      :default-expand-all="tableData.expandAll"
      :pagination="true"
      :page-total="tableData.total"
      :page-current="tableData.queryForm.current"
      :page-size="tableData.queryForm.size"
      @pagination-change="handleChangePage">
  </easy-table>
  <!-- 操作弹窗 -->
  <el-dialog v-model="dialog.dialogVisible" :title="dialog.dialogTitle" :close-on-click-modal="false"
             @close="closeDialog">
    <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="130px">
      <el-row :gutter="35">
        <el-form-item v-show="false" label="主键ID" prop="id"/>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="上级机构" prop="parentId" required>
            <el-cascader
                v-model="parentIds"
                :options="tableData.data"
                :props="{ checkOnClickNode: true, checkStrictly: true, value: 'id', label: 'orgName' }"
                class="w100"
                clearable
                placeholder="请选择上级机构,不选择则为一级机构">
              <template #default="{ node, data }">
                <span>{{ data.orgName }}</span>
                <span v-if="!node.isLeaf"> ({{ data.children.length }}) </span>
              </template>
            </el-cascader>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构名称" prop="orgName" required>
            <el-input v-model="formState.orgName" clearable placeholder="请输入机构名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构简称" prop="orgShortName">
            <el-input v-model="formState.orgShortName" clearable placeholder="请输入机构简称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构代码" prop="orgCode">
            <el-input v-model="formState.orgCode" clearable placeholder="请输入机构代码"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构级别" prop="orgLevel">
            <el-input v-model="formState.orgLevel" clearable placeholder="请选择机构级别"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构类型" prop="orgType">
            <el-input v-model="formState.orgType" clearable placeholder="请输入机构类型"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构标签" prop="orgTag">
            <el-input v-model="formState.orgTag" clearable placeholder="请输入机构标签"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构地区代码" prop="orgAreaCode">
            <el-input v-model="formState.orgAreaCode" clearable placeholder="请输入机构地区代码"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构地址" prop="orgAddress">
            <el-input v-model="formState.orgAddress" clearable placeholder="请输入机构地址"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="机构描述" prop="orgDesc">
            <el-input v-model="formState.orgDesc" clearable placeholder="请输入机构描述"/>
          </el-form-item>
        </el-col>

        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="排序" prop="orgSort" required>
            <el-input-number v-model="formState.orgSort" :min="1" controls-position="right"/>
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
import {sourcing} from '@/utils/commonFunction.ts'
import {orgApi} from '@/api/system/org'

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  orgName: [{required: true, message: '名字不能为空', trigger: 'blur'}],
  orgCode: [{required: true, message: '机构代码不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  expandAll: false,
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    orgName: null as string | null,
    current: 1,
    size: 10,
    orders: []
  }
})
const parentIds = ref<string[]>([])

const formState = reactive({
  id: null as number | null,
  parentId: '0' as string | null,
  orgName: null as string | null,
  orgShortName: null as string | null,
  orgCode: null as string | null,
  orgSort: 1 as number,
  orgStatus: '' as string | null,
  orgLevel: null as string | null,
  orgType: null as string | null,
  orgTag: null as string | null,
  orgAreaCode: null as string | null,
  orgAddress: null as string | null,
  orgDesc: null as string | null
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'orgName',
    label: '机构名称'
  },
  {
    prop: 'orgShortName',
    label: '机构简称'
  },
  {
    prop: 'orgCode',
    label: '机构代码'
  },
  {
    prop: 'orgStatus',
    label: '机构状态',
    align: 'center'
  },
  {
    prop: 'orgSort',
    label: '排序',
    align: 'center'
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    buttons: [
      {
        text: '新增',
        type: 'success',
        auth: 'sys.org.add',
        handler: (row: any) => {
          openDialog('add', row)
        }
      },
      {
        text: '编辑',
        type: 'warning',
        auth: 'sys.org.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.org.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '机构名称',
    prop: 'orgName',
    type: 'input'
  },

  {
    label: '机构代码',
    prop: 'orgCode',
    type: 'input'
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
    auth: 'sys.org.add'
  }
])

async function getOrgTree() {
  tableData.loading = true
  orgApi()
      .treeOrg()
      .then((res) => {
        tableData.data = res.data
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
  searchOrg()
  tableData.expandAll = true
}

// 重置
function handleReset() {
  getOrgTree()
  tableData.expandAll = false
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
  parentIds.value = []
  // 根据action执行不同操作
  if (action === 'add') {
    dialog.dialogTitle = '新增机构'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null as number | null,
        parentId: '0' as string | null,
        orgName: null as string | null,
        orgShortName: null as string | null,
        orgCode: null as string | null,
        orgSort: 1 as number,
        orgStatus: '0' as string | null
      })
      if (row != null) {
        // 上级菜单回显
        parentIds.value = sourcing(tableData.data, row.id)
      }
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑机构'
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
      formState.parentId = parentIds.value.length > 0 ? (parentIds.value.at(-1) as string) : '0'
      if (dialog.type === 'add') {
        orgApi()
            .add(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        orgApi()
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
function onRowDel(row: any) {
  let ids: any = row.id
  ElMessageBox.confirm(`此操作将永久删除机构 ${row.orgName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        orgApi()
            .del({id: ids})
            .then((res) => {
              ElMessage.success(res.msg)
              getOrgTree()
            })
      })
      .catch(() => {
      })
}

// 搜索机构
function searchOrg() {
  if (tableData.queryForm.orgName != null && tableData.queryForm.orgName != '') {
    tableData.data = cascadeSearch(tableData.data, tableData.queryForm.orgName)
  } else {
    getOrgTree()
  }
}

// 组装el-cascade节点搜索
function cascadeSearch(dataList: any[], condition: string) {
  let arrRes: any[] = []
  dataList.forEach((item) => {
    if (item.orgName.includes(condition)) {
      arrRes.unshift(item)
    } else {
      if (item.children && item.children.length) {
        const child = cascadeSearch(item.children, condition)
        if (child.length) {
          item.children = child
          arrRes.unshift(item)
        }
      }
    }
  })
  return arrRes
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getOrgTree()
}

// 关闭弹窗
async function closeDialog() {
  await getOrgTree()
  dialog.dialogVisible = false
}

onMounted(() => {
  getOrgTree()
})
</script>

<style scoped></style>
