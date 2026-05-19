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
      :default-expand-all="tableData.expandAll"
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
    <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="130px">
      <el-row :gutter="35">
        <el-form-item v-show="false" label="主键ID" prop="id"/>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="上级菜单" prop="parentId" required>
            <el-cascader
                v-model="parentIds"
                :key="cascaderKey"
                :options="orgOptions"
                :props="{
                checkOnClickNode: true,
                checkStrictly: true,
                value: 'id',
                label: 'menuName',
                disabled: (node, data) => {
                  return disabledMenu(node, data)
                }
              }"
                class="w100"
                clearable
                placeholder="请选择上级菜单,不选择则为一级菜单">
              <template #default="{ node, data }">
                <span>{{ data.menuName }}</span>
                <span v-if="!node.isLeaf"> ({{ data.children.length }}) </span>
              </template>
            </el-cascader>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="名称" prop="menuName" required>
            <el-input v-model="formState.menuName" clearable placeholder="请输入名称"/>
          </el-form-item>
        </el-col>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20">
          <el-form-item label="类型" prop="menuType" required>
            <el-radio-group v-model="formState.menuType" :disabled="state.disabledMenuType">
              <el-radio-button v-for="item in menuTypeOptions" :label="item.value" :key="item.value">{{
                  item.label
                }}
              </el-radio-button>
            </el-radio-group>
            <el-button v-show="state.disabledMenuType" text :icon="WarnTriangleFilled" type="warning" size="small">
              存在子菜单，或上级是页面，不能切换菜单类型
            </el-button>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="35">
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20" v-show="formState.menuType != 'BUTTON'">
          <el-form-item label="路由地址" prop="path">
            <el-input v-model="formState.path" clearable placeholder="请输入路由"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20" v-show="formState.menuType === 'PAGE'">
          <el-form-item label="组件路径" prop="component">
            <el-input v-model="formState.component" clearable placeholder="请输入组件路径"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20" v-show="formState.menuType != 'BUTTON'">
          <el-form-item label="重定向" prop="redirect">
            <el-input v-model="formState.redirect" clearable placeholder="请输入重定向"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="权限标识" prop="perms">
            <el-input v-model="formState.perms" clearable placeholder="请输入权限标识"/>
          </el-form-item>
        </el-col>
        <el-col v-show="formState.menuType !== 'BUTTON'" :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="菜单图标" prop="icon">
            <easy-icons-select v-model="formState.icon"></easy-icons-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="35" v-show="formState.menuType === 'PAGE'">
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否为外链" prop="isLink" required>
            <el-switch v-model="formState.isLink" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20" v-show="formState.isLink">
          <el-form-item label="是否为内嵌外链" prop="isIframe" required>
            <el-switch v-model="formState.isIframe" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="24" :md="24" :sm="24" :xl="24" :xs="24" class="mb20" v-show="formState.isLink">
          <el-form-item label="外链地址" prop="link">
            <el-input v-model="formState.link" clearable placeholder="请输入外链地址"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否为固定" prop="isAffix" required>
            <el-switch v-model="formState.isAffix" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否缓存" prop="isKeepAlive" required>
            <el-switch v-model="formState.isKeepAlive" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="是否隐藏" prop="isHide" required>
            <el-switch v-model="formState.isHide" inline-prompt active-text="是" inactive-text="否"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
          <el-form-item label="排序" prop="orderNum" required>
            <el-input-number v-model="formState.orderNum" :min="1" controls-position="right"/>
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
import {h, nextTick, onMounted, reactive, ref, watch} from 'vue'
import {WarnTriangleFilled} from '@element-plus/icons-vue'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'
import {menuApi} from '@/api/system/menu'
import EasyIconsSelect from '@/components/iconSelect/easyIconsSelect.vue'
import EasyIcon from '@/components/icon/easyIcon.vue'
import {sourcing} from '@/utils/commonFunction.ts'

const ruleFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  menuName: [{required: true, message: '菜单名称不能为空', trigger: 'blur'}],
  menuType: [{required: true, message: '菜单类型不能为空', trigger: 'blur'}],
  orderNum: [{required: true, message: '排序不能为空', trigger: 'blur'}]
})

const tableData = reactive<TableType>({
  expandAll: false,
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    menuName: null as string | null,
    current: 1,
    size: 10,
    orders: []
  }
})
const parentIds = ref<string[]>([])
// 添加一个新的响应式变量来存储带根目录选项的菜单数据
const orgOptions = ref<any[]>([])

const menuTypeOptions = ref([
  {label: '目录', value: 'DIR', disabled: false},
  {label: '页面', value: 'PAGE', disabled: false},
  {label: '按钮', value: 'BUTTON', disabled: false}
])
const formState = reactive({
  id: null as number | null,
  parentId: null as string | null,
  menuName: null as string | null,
  menuType: 'DIR' as string | null,
  orderNum: 1 as number,
  path: null as string | null,
  component: null as string | null,
  redirect: null as string | null,
  isIframe: false as boolean,
  isLink: false as boolean,
  isAffix: false as boolean,
  isKeepAlive: false as boolean,
  isHide: false as boolean,
  link: null as string | null,
  perms: null as string | null,
  icon: '' as string | null,
  enable: true as boolean
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const state = reactive({
  disabledMenuType: false
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'menuName',
    label: '菜单名称',
    slotFirst: true,
    defaultSlot: (scope) => {
      return h('div', {style: 'display: inline-flex;align-items: center;'}, [
        h(EasyIcon, {
          name: scope.row.icon,
          size: 16
        })
      ])
    }
  },
  {
    prop: 'path',
    label: '菜单路由'
  },
  {
    prop: 'component',
    label: '组件路径'
  },
  {
    prop: 'perms',
    label: '权限标识'
  },
  {
    prop: 'menuType',
    label: '菜单类型',
    align: 'center',
    type: 'tag',
    tagConfig: {
      optionsKey: 'menu_type'
    }
  },
  {
    prop: 'orderNum',
    label: '排序',
    align: 'center'
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    buttons: [
      {
        show: (row) => {
          return row.menuType != 'BUTTON'
        },
        text: '新增',
        type: 'success',
        auth: 'sys.menu.add',
        handler: (row: any) => {
          openDialog('add', row)
        }
      },
      {
        text: '编辑',
        type: 'warning',
        auth: 'sys.menu.edit',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        text: '删除',
        type: 'danger',
        auth: 'sys.menu.del',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ]
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '菜单名称',
    prop: 'menuName',
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
    auth: 'sys.menu.add'
  }
])

async function getMenuTree() {
  tableData.loading = true
  menuApi()
      .tree(tableData.queryForm)
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
  searchMenu()
  tableData.expandAll = true
}

// 重置
function handleReset() {
  getMenuTree()
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
  cascaderKey.value = 0
  // 重置表单
  resetRuleForm()
  // 根据action执行不同操作
  if (action === 'add') {
    dialog.dialogTitle = '新增菜单'
    dialog.submitTxt = '新增'
    nextTick(() => {
      state.disabledMenuType = false
      Object.assign(formState, {
        id: null as number | null,
        parentId: '0' as string | null,
        menuName: null as string | null,
        menuType: 'DIR' as string | null,
        orderNum: 1 as number,
        path: null as string | null,
        component: null as string | null,
        redirect: null as string | null,
        isIframe: false as boolean,
        isLink: false as boolean,
        isAffix: false as boolean,
        isKeepAlive: false as boolean,
        isHide: false as boolean,
        link: null as string | null,
        perms: null as string | null,
        icon: '' as string | null,
        enable: true as boolean
      })
      if (row != null) {
        // 上级菜单回显
        parentIds.value = sourcing(tableData.data, row.id)
        if (row.menuType === 'PAGE') {
          // 页面类型只能是按钮，不能切换
          formState.menuType = 'BUTTON'
          state.disabledMenuType = true
        }
      }
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑菜单'
    dialog.submitTxt = '更新'
    nextTick(() => {
      Object.assign(formState, {...row})
      state.disabledMenuType = formState.menuType === 'DIR' && row.children.length > 0
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  // 临时添加根目录选项到级联选择器数据中
  const rootOption = {
    id: '0',
    menuName: '根目录',
    menuType: 'DIR',
    children: []
  }
  // 在打开对话框时，将根目录选项添加到菜单树数据的拷贝中
  // 这样不会影响原始数据，只在当前组件中生效
  const tempMenuData = JSON.parse(JSON.stringify(tableData.data))
  tempMenuData.unshift(rootOption)
  orgOptions.value = tempMenuData
}

// 禁止选择
function disabledMenu(node: any, data: any) {
  // 不能选择自己
  if (formState.id === node.id) {
    return true
  }
  // 不能选择首页
  if (node.path === 'home') {
    return true
  }
  // 如果当前表单类型是页面，则不能选择页面类型的选项
  if (formState.menuType === 'PAGE' && node.menuType === 'PAGE') {
    return true
  }
  if (formState.menuType === 'DIR' && node.menuType === 'PAGE') {
    return true
  }
  return node.menuType == 'BUTTON'
}

// 新增提交
function onSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      formState.parentId = parentIds.value != undefined ? (parentIds.value.at(-1) as string) : '0'
      if (dialog.type === 'add') {
        menuApi()
            .add(formState)
            .then((res) => {
              ElMessage.success(res.msg)
              closeDialog()
            })
      }
      if (dialog.type === 'update') {
        menuApi()
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
  ElMessageBox.confirm(`此操作将永久删除菜单 ${row.menuName}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        menuApi()
            .delete({id: ids})
            .then((res) => {
              ElMessage.success(res.msg)
              getMenuTree()
            })
      })
      .catch(() => {
      })
}

// 搜索
function searchMenu() {
  if (tableData.queryForm.menuName != null && tableData.queryForm.menuName != '') {
    tableData.data = cascadeSearch(tableData.data, tableData.queryForm.menuName)
  } else {
    getMenuTree()
  }
}

// 组装el-cascade节点搜索
function cascadeSearch(dataList: any[], condition: string) {
  let arrRes: any[] = []
  dataList.forEach((item) => {
    if (item.menuName.includes(condition)) {
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
  getMenuTree()
}

// 关闭弹窗
async function closeDialog() {
  await getMenuTree()
  dialog.dialogVisible = false
}

// 添加一个用于强制重新渲染的key
const cascaderKey = ref(0)

// 监听menuType变化，当变化时重新计算禁用状态
watch(
    () => formState.menuType,
    (newVal, oldVal) => {
      // 只有当对话框可见且menuType确实发生变化时才触发更新
      if (dialog.dialogVisible && newVal !== oldVal) {
        // 增加key值强制重新渲染级联选择器
        cascaderKey.value++
      }
    }
)

onMounted(() => {
  getMenuTree()
})
</script>

<style scoped></style>
