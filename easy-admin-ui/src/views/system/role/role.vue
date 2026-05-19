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
          <el-form-item label="角色名称" prop="roleName">
            <el-input v-model="formState.roleName" clearable placeholder="请输入角色名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="角色键名" prop="roleKey">
            <el-input v-model="formState.roleKey" clearable placeholder="请输入角色键名"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="权限范围" prop="scope">
            <el-select v-model="formState.authorityLevel" clearable placeholder="请选择权限范围">
              <el-option label="本级" value="ONESELF"/>
              <el-option label="本级及以下数据" value="LOWER"/>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否启用" prop="enable" required>
            <el-switch v-model="formState.enable" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="菜单权限" prop="menuList">
            <el-checkbox v-model="state.menuData.isExpand" @change="handleCheckedTreeExpand">展开/折叠</el-checkbox>
            <el-checkbox @change="handleCheckedTreeNodeAll($event)">全选/全不选</el-checkbox>
            <el-checkbox v-model="state.menuData.strictly" @change="handleCheckedTreeConnect($event)">父子联动
            </el-checkbox>
            <el-tree
                ref="menuRef"
                :check-strictly="!state.menuData.strictly"
                :data="state.menuData.data"
                :default-expand-all="state.menuData.isExpand"
                :props="{ children: 'children', label: 'menuName' }"
                class="menu-data-tree w100 tree-border"
                clearable
                filterable
                node-key="id"
                show-checkbox/>
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
import {ElMessage, ElMessageBox, ElTree, FormInstance, FormRules} from 'element-plus'
import {roleApi} from '@/api/system/role'
import {menuApi} from '@/api/system/menu'

const menuRef = ref<InstanceType<typeof ElTree>>()
const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  roleName: [{required: true, message: '角色名称不能为空', trigger: 'blur'}],
  roleKey: [{required: true, message: '角色键名不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    roleKey: null as string | null,
    roleName: null as string | null,
    enable: null as boolean | null
  }
})

const formState = reactive({
  id: null as string | null,
  orgId: null as string | null,
  roleName: null as string | null,
  roleKey: null as string | null,
  authorityLevel: null as string | null,
  roleSort: null as number | null,
  enable: true as boolean,
  menuList: [] as string[]
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const state = reactive({
  menuData: {
    data: [] as any[],
    isExpand: false,
    strictly: true
  }
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'roleName',
    label: '角色名称'
  },
  {
    prop: 'roleKey',
    label: '角色Key'
  },
  {
    prop: 'authorityLevel',
    label: '权限级别',
    type: 'tag',
    tagConfig: {
      options: [
        {dictLabel: '本级', dictValue: 'ONESELF', cssClass: 'success'},
        {dictLabel: '本级及以下', dictValue: 'LOWER', cssClass: 'success'}
      ]
    }
  },
  {
    prop: 'roleSort',
    label: '顺序',
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
        auth: 'sys.role.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.role.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '角色名称',
    prop: 'roleName',
    type: 'input'
  },
  {
    label: '角色Key',
    prop: 'roleKey',
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
      handler: (row: any) => {
        getRolePage()
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
    auth: 'sys.role.add'
  }
])

// 获取菜单信息树形结构
async function initMenuData() {
  await menuApi()
      .tree({})
      .then((res) => {
        buildMenuTree(res.data)
        state.menuData.data = res.data
      })
}

async function getRolePage() {
  tableData.loading = true
  roleApi()
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
  getRolePage()
}

// 重置
function handleReset() {
  getRolePage()
}

// 操作
function handleAction(action: string) {
  // 根据action执行不同操作
  if (action === 'add') {
    openDialog('add', null)
  }
}

function openDialog(action: string, row: any) {
  dialog.type = action
  // 重置表单
  resetRuleForm()
  // 清空脏数据
  menuRef.value?.store.setCheckedKeys([])
  // 根据action执行不同操作
  if (action === 'add') {
    dialog.dialogTitle = '新增角色'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        orgId: null,
        roleName: null,
        roleKey: null,
        authorityLevel: null,
        roleSort: null,
        enable: true,
        menuList: []
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑参数'
    dialog.submitTxt = '更新'
    nextTick(() => {
      // 获取角色关联菜单ID
      roleApi()
          .roleMenuIds({id: row.id})
          .then((res) => {
            Object.assign(formState, {...row})
            if (res.data != null && res.data.length > 0) {
              formState.menuList = res.data
              formState.menuList.forEach((v: any) => {
                menuRef.value?.store.setChecked(v, true, false)
              })
            }
          })
          .catch(() => {
            ElMessage.error('获取菜单权限失败')
          })
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
      // 目前被选中的菜单节点
      formState.menuList = [...(menuRef.value?.getHalfCheckedKeys() || []), ...(menuRef.value?.getCheckedKeys() || [])] as string[]
      if (dialog.type === 'add') {
        roleApi()
            .add(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        roleApi()
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
  ElMessageBox.confirm(`此操作将永久删除角色 ${row.roleName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        roleApi()
            .delete({id: row.id})
            .then((res) => {
              ElMessage.success(res.msg)
              getRolePage()
            })
      })
      .catch(() => {
      })
}

// 重置表单
function resetRuleForm() {
  ruleFormRef.value?.resetFields()
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getRolePage()
}

//展开/折叠
function handleCheckedTreeExpand() {
  const nodes = menuRef.value?.store.nodesMap
  for (const node in nodes) {
    nodes[node].expanded = state.menuData.isExpand
  }
}

//全选/全不选
function handleCheckedTreeNodeAll(value: boolean) {
  menuRef.value?.setCheckedNodes(value ? state.menuData.data : [])
}

// 树权限（父子联动）
function handleCheckedTreeConnect(value: boolean) {
  state.menuData.strictly = value
}

// 构建菜单选择器 页面和按钮不能选择为上级
function buildMenuTree(menuData: any[]) {
  menuData.forEach((item: any) => {
    // 按钮不能被选中为父级
    item.disable = item.menuType === 'BUTTON'
    if (item.children) {
      buildMenuTree(item.children)
    }
  })
}

// 关闭弹窗
async function closeDialog() {
  await getRolePage()
  dialog.dialogVisible = false
}

onMounted(() => {
  getRolePage()
  initMenuData()
})
</script>

<style scoped>
.menu-data-tree {
  width: 100%;
  border: 1px solid var(--el-border-color);
  border-radius: var(--el-input-border-radius, var(--el-border-radius-base));
  padding: 5px;
}
</style>
