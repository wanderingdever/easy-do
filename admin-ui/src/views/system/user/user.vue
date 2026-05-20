<template>
  <div class="main-container">
    <el-splitter>
      <el-splitter-panel size="10%">
        <div style="padding: 0 20px 0 0">
          <el-input v-model="orgName" :prefix-icon="Search" clearable placeholder="请输入机构名称"/>
          <div style="margin-top: 10px">
            <el-tree
                ref="treeRef"
                :current-node-key="tableData.queryForm.orgId"
                :data="state.orgData"
                :expand-on-click-node="false"
                :filter-node-method="filterNode"
                :highlight-current="true"
                :props="{ children: 'children', label: 'orgName' }"
                default-expand-all
                node-key="id"
                @node-click="handleNodeClick"/>
          </div>
        </div>
      </el-splitter-panel>
      <el-splitter-panel :min="200">
        <div style="padding: 0 10px">
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
        </div>
      </el-splitter-panel>
    </el-splitter>

    <!-- 查看 -->
    <el-dialog
        v-model="viewDialog.dialogVisible"
        :title="viewDialog.dialogTitle"
        :close-on-click-modal="false"
        @close="viewDialog.dialogVisible = false">
      <div class="user-info-card">
        <div class="user-header">
          <el-avatar :size="80"
                     :src="viewFormState.avatar || 'https://cube.elemecdn.com/0/88/***REMOVE_SECRET***.png'"
                     fit="fill"/>
          <div class="user-basic-info">
            <h3>{{ viewFormState.nickname || viewFormState.username }}</h3>
            <p class="user-id">ID: {{ viewFormState.userId }}</p>
            <easy-dict-tag optionsKey="account_status" :value="viewFormState.status"/>
          </div>
        </div>

        <el-divider/>

        <el-descriptions label-width="100px" :column="1" border>
          <el-descriptions-item label="用户名" label-align="right">
            {{ viewFormState.username }}
          </el-descriptions-item>
          <el-descriptions-item label="昵称" label-align="right">
            {{ viewFormState.nickname }}
          </el-descriptions-item>
          <el-descriptions-item label="手机号" label-align="right">
            <div style="display: inline-flex; gap: 5px">
              {{ state.phoneShow ? state.phone : viewFormState.phone }}
              <el-button v-if="viewFormState.phone!==null" link :icon="state.phoneShow ?  View:Hide "
                         @click="handleViewPhone(viewFormState)"/>
            </div>
          </el-descriptions-item>
          <el-descriptions-item label="邮箱" label-align="right">
            {{ viewFormState.email }}
          </el-descriptions-item>
          <el-descriptions-item label="性别" label-align="right">
            {{ viewFormState.sex === 'MAN' ? '男' : viewFormState.sex === 'WOMAN' ? '女' : '未设置' }}
          </el-descriptions-item>
          <el-descriptions-item label="客户端" label-align="right">
            <easy-dict-tag optionsKey="account_client" :value="viewFormState.client"/>
          </el-descriptions-item>
          <el-descriptions-item label="角色" label-align="right">
            <el-tag v-for="role in viewFormState.roleList" :key="role.id" style="margin-right: 5px">
              {{ role.roleName }}
            </el-tag>
          </el-descriptions-item>
        </el-descriptions>
      </div>
    </el-dialog>

    <!-- 操作弹窗 -->
    <el-dialog v-model="dialog.dialogVisible" :title="dialog.dialogTitle" :close-on-click-modal="false"
               @close="closeDialog">
      <el-form ref="ruleFormRef" :model="formState" :rules="rules" label-width="90px">
        <el-row :gutter="35">
          <el-form-item v-show="false" label="主键ID" prop="id"/>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="所属机构" prop="orgId">
              <el-cascader
                  v-model="orgIdList"
                  :options="state.orgData"
                  :props="{ checkStrictly: true, value: 'id', label: 'orgName' }"
                  class="w100"
                  placeholder="请选择所属机构">
                <template #default="{ node, data }">
                  <span>{{ data.orgName }}</span>
                  <span v-if="!node.isLeaf"> ({{ data.children.length }}) </span>
                </template>
              </el-cascader>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="用户名" prop="username">
              <el-input :disabled="dialog.type === 'update'" v-model="formState.username" clearable
                        placeholder="请输入用户名"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="昵称" prop="nickname">
              <el-input v-model="formState.nickname" clearable placeholder="请输入昵称"/>
            </el-form-item>
          </el-col>

          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="手机号" prop="phone">
              <el-input :disabled="dialog.type === 'update'" v-model="formState.phone" clearable
                        placeholder="请输入手机号"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="邮箱" prop="email">
              <el-input
                  :disabled="dialog.type === 'update'"
                  v-model="formState.email"
                  clearable
                  placeholder="请输入邮箱"
                  @input="onVerifyEmail($event)"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="角色" prop="roleList">
              <el-select v-model="formState.roleList" class="w100" multiple value-key="id">
                <el-option v-for="item in state.roleData" :key="item.id" :label="item.roleName" :value="item.id"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="性别" prop="gender">
              <el-select v-model="formState.sex" class="w100" clearable placeholder="请选择性别">
                <el-option label="男" value="MAN"/>
                <el-option label="女" value="WOMAN"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="客户端" prop="client">
              <el-select v-model="formState.client" class="w100" clearable placeholder="请选择客户端">
                <el-option label="管理端" value="ADMIN"/>
                <el-option label="WEB端" value="WEB"/>
                <el-option label="移动端" value="MOBILE"/>
                <el-option label="微信" value="WECHAT"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="状态" prop="status">
              <el-select v-model="formState.status" class="w100" clearable placeholder="请选择状态">
                <el-option label="未激活" value="INACTIVATED"/>
                <el-option label="正常" value="NORMAL"/>
                <el-option label="停用" value="STOP"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="排序" prop="sort">
              <el-input-number v-model="formState.sort" min="1"/>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12" :sm="12" :xl="12" :xs="24" class="mb20">
            <el-form-item label="头像" prop="avatar">
              <el-upload
                  :before-upload="beforeAvatarUpload"
                  :http-request="uploadImg"
                  :on-success="handleAvatarSuccess"
                  :show-file-list="false"
                  action="#"
                  class="avatar-uploader">
                <el-image v-if="formState.avatar" :src="formState.avatar" alt="头像" class="avatar"
                          style="width: 64px; height: 64px">
                  <template #error>
                    <div class="image-slot">
                      <el-icon>
                        <IconPicture/>
                      </el-icon>
                    </div>
                  </template>
                </el-image>
                <el-icon v-else class="avatar-uploader-icon">
                  <IconPlus/>
                </el-icon>
              </el-upload>
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

    <!-- 授权弹窗 -->
    <el-dialog
        v-model="apiAuthDialog.dialogVisible"
        :title="apiAuthDialog.dialogTitle"
        @close="apiAuthDialog.dialogVisible = false"
        :close-on-press-escape="false"
        :close-on-click-modal="false">
      <api-auth v-if="apiAuthDialog.dialogVisible" :user-id="apiAuthDialog.userId"/>
    </el-dialog>

    <!-- 修改密码弹窗 -->
    <el-dialog
        v-model="updatePwdDialog.dialogVisible"
        :title="updatePwdDialog.dialogTitle"
        @close="updatePwdDialog.dialogVisible = false"
        :close-on-press-escape="false"
        :close-on-click-modal="false"
        width="600">
      <el-form ref="updatePwdFormRef" :model="updateFormState" label-width="120" :rules="updatePwdRules">
        <el-form-item label="新密码" prop="newPwd">
          <el-input v-model="updateFormState.newPwd" type="password" clearable placeholder="请输入新密码"
                    show-password/>
        </el-form-item>
        <el-form-item label="确认新密码" prop="confirmPwd">
          <el-input v-model="updateFormState.confirmPwd" type="password" clearable placeholder="请重复输入新密码"
                    show-password/>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button type="warning" @click="updatePwdDialog.dialogVisible = false">取 消</el-button>
          <el-button type="success" @click="onUpdatePwdSubmit(updatePwdFormRef)">确认修改</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import EasyTable, {EasyTableColumn} from '@/components/table/easyTable.vue'
import EasySearchForm, {SearchFormButton, SearchFormItem} from '@/components/searchForm/easySearchForm.vue'
import {h, nextTick, onMounted, reactive, ref, watch} from 'vue'
import {
  Action,
  ElButton,
  ElDropdown,
  ElDropdownItem,
  ElDropdownMenu,
  ElIcon,
  ElMessage,
  ElMessageBox,
  ElTree,
  FormInstance,
  FormRules,
  TreeNodeData
} from 'element-plus'
import {roleApi} from '@/api/system/role'
import {ArrowDown, Hide, Picture as IconPicture, Plus as IconPlus, Search, View} from '@element-plus/icons-vue'
import {verifyCnAndSpace, verifyEmail} from '@/utils/toolsValidate.ts'
import {isImageFileType} from '@/utils/fileFunction.ts'
import {userApi} from '@/api/system/user'
import {orgApi} from '@/api/system/org'
import {copyText, sourcing} from '@/utils/commonFunction.ts'
import EasyDictTag from '@/components/dictTag/easyDictTag.vue'
import ApiAuth from '@/views/system/user/apiAuth.vue'
import {auth} from '@/utils/authFunction.ts'

const ruleFormRef = ref<FormInstance>()
const treeRef = ref<InstanceType<typeof ElTree>>()
const updatePwdFormRef = ref<FormInstance>()
const rules = reactive<FormRules>({
  username: [{required: true, message: '账号不能为空', trigger: 'blur'}],
  nickname: [{required: true, message: '昵称不能为空', trigger: 'blur'}],
  roleList: [{required: true, message: '角色不能为空', trigger: 'blur'}],
  client: [{required: true, message: '客户端不能为空', trigger: 'blur'}],
  status: [{required: true, message: '状态不能为空', trigger: 'blur'}]
})

const updatePwdRules = reactive<FormRules>({
  newPwd: [{required: true, message: '新密码不能为空', trigger: 'blur'}],
  confirmPwd: [
    {required: true, message: '确认新密码不能为空', trigger: 'blur'},
    {
      validator: (rule: any, value: string, callback: any) => {
        if (value && updateFormState.newPwd && value !== updateFormState.newPwd) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ]
})

// 机构树筛选
const orgName = ref('')

const orgIdList = ref<string[]>([])

const tableData = reactive<TableType>({
  loading: false,
  total: 0,
  data: [],
  queryForm: {
    current: 1,
    size: 10,
    orders: [],
    orgId: '',
    username: null as string | null
  }
})
const viewFormState = reactive({
  orgId: null as string | null,
  userId: null as string | null,
  username: null as string | null,
  nickname: null as string | null,
  phone: null as string | null,
  email: null as string | null,
  sex: null as string | null,
  client: null as string | null,
  avatar: null as string | null,
  status: null as string | null,
  sort: 1,
  roleList: []
})

const formState = reactive({
  orgId: null as string | null,
  userId: null as string | null,
  username: null as string | null,
  nickname: null as string | null,
  phone: null as string | null,
  email: null as string | null,
  sex: 'MAN' as string,
  client: 'WEB' as string,
  avatar: null as string | null, // 头像
  status: 'INACTIVATED', // 用户状态
  sort: 1, // 排序
  roleList: [] as any
})

const updateFormState = reactive({
  userId: null as string | null,
  newPwd: null as string | null,
  confirmPwd: null as string | null
})
const apiAuthDialog = reactive({
  dialogVisible: false,
  dialogTitle: 'API授权信息',
  userId: ''
})

const updatePwdDialog = reactive({
  dialogVisible: false,
  dialogTitle: '修改密码'
})

const viewDialog = reactive({
  dialogVisible: false,
  dialogTitle: '用户信息'
})

const dialog = reactive({
  type: '',
  dialogVisible: false,
  dialogTitle: '',
  submitTxt: '新增'
})

const state = reactive({
  phone: '',
  phoneShow: false,
  previewAvatar: null as string | null,
  roleData: [] as RowRole[],
  orgData: [] as SimpleOrgTree[]
})

const columns = ref<EasyTableColumn[]>([
  {
    prop: 'username',
    label: '账号'
  },
  {
    prop: 'nickname',
    label: '昵称'
  },
  {
    prop: 'phone',
    label: '手机号'
  },
  {
    prop: 'email',
    label: '邮箱'
  },
  {
    prop: 'client',
    label: '客户端',
    align: 'center',
    type: 'tag',
    tagConfig: {
      optionsKey: 'account_client'
    }
  },
  {
    prop: 'status',
    label: '状态',
    align: 'center',

    type: 'tag',
    tagConfig: {
      optionsKey: 'account_status'
    }
  },
  {
    prop: 'btn',
    label: '操作',
    type: 'btn',
    width: 300,
    buttons: [
      {
        text: '查看',
        type: 'primary',
        handler: (row: any) => {
          openViewDialog(row)
        }
      },
      {
        auth: 'sys.user.edit',
        text: '编辑',
        type: 'warning',
        handler: (row: any) => {
          openDialog('update', row)
        }
      },
      {
        auth: 'sys.user.del',
        text: '删除',
        type: 'danger',
        handler: (row: any) => {
          onRowDel(row)
        }
      }
    ],
    defaultSlot: (scope) => {
      const dropdownItems = [] as any[]
      if (auth('sys.user.api')) {
        dropdownItems.push(h(ElDropdownItem, {onClick: () => handleAuth(scope.row)}, 'API授权'))
      }

      if (auth('sys.user.initPwd')) {
        dropdownItems.push(h(ElDropdownItem, {onClick: () => openUpdatePwdDialog(scope.row)}, '重置密码'))
      }
      if (dropdownItems.length == 0) {
        return null
      }
      return h(
          ElDropdown,
          {trigger: 'hover'},
          {
            default: () =>
                h(
                    ElButton,
                    {
                      type: 'default',
                      size: 'small',
                      style: 'margin-left: 12px'
                    },
                    ['更多', h(ElIcon, h(ArrowDown))]
                ),
            dropdown: () =>
                h(ElDropdownMenu, null, {
                  default: () => dropdownItems
                })
          }
      )
    }
  }
])

const searchColumns = ref<SearchFormItem[]>([
  {
    label: '账号',
    prop: 'username',
    type: 'input'
  },
  {
    label: '手机号',
    prop: 'phone',
    type: 'input'
  },
  {
    label: '邮箱',
    prop: 'email',
    type: 'input'
  },
  {
    label: '状态',
    prop: 'status',
    type: 'select',
    options: {
      data: [
        {label: '未激活', value: 'INACTIVATED'},
        {label: '正常', value: 'NORMAL'},
        {label: '停用', value: 'STOP'}
      ],
      handler: (row: any) => {
        getUserPage()
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
    auth: 'sys.user.add',
    label: '新增',
    type: 'success',
    action: 'add'
  }
])

// 节点单击事件
async function handleNodeClick(data: SimpleOrgTree) {
  tableData.queryForm.orgId = data.id
  // 选中复制给表单orgId
  formState.orgId = data.id
  await getUserPage()
  await initRoleList()
}

// 初始化机构树数据
async function initOrgInfo() {
  tableData.loading = true
  await orgApi()
      .treeOrg()
      .then((response) => {
        state.orgData = response.data
        // 初始化默认选中第一条数据加载用户信息
        tableData.queryForm.orgId = response.data[0].id
        formState.orgId = response.data[0].id
        getUserPage()
        initRoleList()
      })
  tableData.loading = false
}

// 初始化角色列表
async function initRoleList() {
  roleApi()
      .page({current: 1, size: 100})
      .then((res) => {
        state.roleData = res.data.records
      })
}

// 筛选机构
function filterNode(value: string, data: TreeNodeData) {
  if (!value) return true
  return data.orgName.includes(value)
}

async function getUserPage() {
  tableData.loading = true
  userApi()
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
  getUserPage()
}

// 邮箱
function onVerifyEmail(val: any) {
  formState.email = verifyCnAndSpace(val)
  return verifyEmail(formState.email)
}

// 重置
function handleReset() {
  getUserPage()
}

// 操作
function handleAction(action: string) {
  // 根据action执行不同操作
  if (action === 'add') {
    openDialog('add', null)
  }
}

function openViewDialog(row: any) {
  viewDialog.dialogVisible = true
  userApi()
      .getUserInfo(row.userId)
      .then((res) => {
        nextTick(() => {
          Object.assign(viewFormState, res.data)
        })
      })
}

// 打开重置密码窗口
function openUpdatePwdDialog(row: any) {
  updatePwdDialog.dialogVisible = true
  updateFormState.userId = row.userId
  updateFormState.newPwd = null
  updateFormState.confirmPwd = null
}

// 重置密码提交
function onUpdatePwdSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      ElMessageBox.confirm('确定要修改该用户的密码吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            userApi()
                .resetPwd(updateFormState)
                .then((res) => {
                  ElMessage.success(res.msg)
                  updatePwdDialog.dialogVisible = false
                })
          })
          .catch(() => {
            ElMessage.info('已取消操作')
          })
    }
  })
}

// 打开编辑新增窗口
function openDialog(action: string, row: any) {
  dialog.type = action
  // 重置表单
  resetRuleForm()
  // 根据action执行不同操作
  if (action === 'add') {
    dialog.dialogTitle = '新增用户'
    dialog.submitTxt = '新增'
    nextTick(() => {
      Object.assign(formState, {
        id: null,
        username: null,
        nickname: null,
        phone: null,
        email: null,
        gender: 'MAN',
        client: 'WEB',
        avatar: null,
        status: 'INACTIVATED',
        sort: 1,
        roleList: []
      })
    }).then(() => {
      dialog.dialogVisible = true
    })
  }
  if (action === 'update') {
    dialog.dialogTitle = '编辑用户'
    dialog.submitTxt = '更新'
    userApi()
        .getUserInfo(row.userId)
        .then((res) => {
          nextTick(() => {
            Object.assign(formState, res.data)
            // 上级菜单回显
            orgIdList.value = sourcing(state.orgData, res.data.orgId)
            formState.roleList = formState.roleList.map((role: any) => role.id)
          }).then(() => {
            dialog.dialogVisible = true
          })
        })
  }
}

// 新增提交
function onSubmit(formEl: FormInstance | undefined) {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      formState.orgId = orgIdList.value.at(-1) as string
      if (dialog.type === 'add') {
        userApi()
            .addUser(formState)
            .then((res) => {
              closeDialog()
              ElMessageBox.alert(`初始密码为：${res.data}`, '初始密码', {
                confirmButtonText: '一键复制',
                callback: (action: Action) => {
                  copyText(res.data)
                }
              })
            })
      }
      if (dialog.type === 'update') {
        userApi()
            .updateUser(formState)
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
  ElMessageBox.confirm(`此操作将永久删除用户 ${row.nickname}，是否继续?`, '提示', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning'
  })
      .then(() => {
        userApi()
            .delUser({id: row.userId})
            .then((res) => {
              ElMessage.success(res.msg)
              getUserPage()
            })
      })
      .catch(() => {
      })
}

// 授权
function handleAuth(row: any) {
  apiAuthDialog.dialogVisible = true
  apiAuthDialog.userId = row.userId
}

// 重置表单
function resetRuleForm() {
  ruleFormRef.value?.resetFields()
}

// 分页操作
function handleChangePage(item: { current: number; size: number }) {
  tableData.queryForm.current = item.current
  tableData.queryForm.size = item.size
  getUserPage()
}

// 关闭弹窗
async function closeDialog() {
  await getUserPage()
  dialog.dialogVisible = false
}

// 上传文件
async function uploadImg(file: any) {
  const reader = new FileReader()
  // 读取 File 对象
  reader.readAsDataURL(file.file)
  // 加载完成后
  reader.onload = () => {
    // 将读取的数据转换为 base64 编码的字符串
    const base64String = reader.result
    formState.avatar = base64String as string
  }
}

// 上传文件前校验
function beforeAvatarUpload(rawFile: File) {
  if (!isImageFileType(rawFile.type)) {
    ElMessage.error('头像图片必须是jpg/jpeg/png格式!')
    return false
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('头像图片大小不能超过2MB!')
    return false
  }
  return true
}

// 上传成功回调
function handleAvatarSuccess(response: any, uploadFile: any) {
  state.previewAvatar = URL.createObjectURL(uploadFile.raw!)
}

// 查看手机号
function handleViewPhone(row: any) {
  if (state.phoneShow) {
    state.phoneShow = false
  } else {
    userApi().getPhone(row.userId).then((response: any) => {
      state.phone = response.data
      state.phoneShow = true
    })
  }
}

onMounted(() => {
  initOrgInfo()
})

// 监听新密码变化，如果确认密码有值则触发校验
watch(
    () => updateFormState.newPwd,
    (newVal) => {
      if (updateFormState.confirmPwd) {
        // 触发确认密码的校验
        nextTick(() => {
          updatePwdFormRef.value?.validateField('confirmPwd')
        })
      }
    }
)

watch(orgName, (val) => {
  treeRef.value!.filter(val)
})
</script>

<style scoped>
.menu-data-tree {
  width: 100%;
  border: 1px solid var(--el-border-color);
  border-radius: var(--el-input-border-radius, var(--el-border-radius-base));
  padding: 5px;
}

.user-info-card {
  border-radius: 8px;
}

.user-header {
  display: flex;
  align-items: center;
  padding: 20px;
  background-color: #f5f7fa;
  border-radius: 4px;
}

.user-basic-info {
  margin-left: 20px;
}

.user-basic-info h3 {
  margin: 0 0 10px 0;
  font-size: 18px;
  font-weight: 600;
}

.user-id {
  margin: 5px 0;
  color: #909399;
  font-size: 14px;
}

.el-divider {
  margin: 15px 0;
}

.el-descriptions {
  padding: 0 10px;
}
</style>
