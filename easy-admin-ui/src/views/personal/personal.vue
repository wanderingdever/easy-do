<template>
  <div class="main-container">
    <el-row :gutter="20">
      <!-- 左侧用户信息卡片 -->
      <el-col :span="12">
        <el-card shadow="none" class="user-info">
          <div class="user-info-header">
            <el-upload
                class="avatar-uploader"
                :show-file-list="false"
                :before-upload="beforeAvatarUpload"
                :http-request="uploadAvatar"
                :on-success="handleAvatarSuccess">
              <el-avatar
                  :size="100"
                  :src="userInfo.avatar || 'https://cube.elemecdn.com/0/88/***REMOVE_SECRET***.png'"
                  fit="fill"
                  class="user-avatar"/>
            </el-upload>
            <div class="user-name">
              <h3>
                {{ userInfo.nickname || userInfo.username }}
                <el-tag
                    :type="userInfo.status === 'NORMAL' ? 'success' : userInfo.status === 'STOP' ? 'danger' : 'info'">
                  {{ userInfo.status === 'NORMAL' ? '正常' : userInfo.status === 'STOP' ? '停用' : '未激活' }}
                </el-tag>
              </h3>
              <el-tag v-for="role in userInfo.roleList" :key="role.id"
                      :type="role.roleKey === 'admin' ? 'danger' : 'info'">
                {{ role.roleName }}
              </el-tag>
            </div>
          </div>

          <el-divider/>

          <div class="user-details">
            <el-descriptions :column="1" border :label-width="100">
              <el-descriptions-item label-align="right" label="客户端">
                <easy-dict-tag optionsKey="account_client" :value="userInfo.client"/>
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="用户名">
                {{ userInfo.username }}
                <el-button link :icon="CopyDocument" @click="copyText(userInfo.username)"/>
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="手机号">
                {{ state.phone || '未设置' }}
                <el-button link :icon="state.phoneShow ?  View:Hide " @click="handleViewPhone"/>
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="邮箱">
                {{ userInfo.email || '未设置' }}
                <el-button link :icon="CopyDocument" @click="copyText(userInfo.email)"/>
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="性别">
                {{ userInfo.sex === 'MAN' ? '男' : userInfo.sex === 'WOMAN' ? '女' : '未设置' }}
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="注册时间">
                {{ userInfo.createTime }}
              </el-descriptions-item>
              <el-descriptions-item label-align="right" label="最后登录"> {{ userInfo.loginTime }} / {{
                  userInfo.ip
                }}
              </el-descriptions-item>
            </el-descriptions>
          </div>
        </el-card>
      </el-col>

      <!-- 右侧功能区域 -->
      <el-col :span="8">
        <el-tabs v-model="activeTab" type="border-card">
          <!-- 修改密码 -->
          <el-tab-pane label="变更密码" name="password">
            <el-form ref="passwordFormRef" :model="passwordForm" :rules="passwordRules" label-width="100px"
                     class="password-form">
              <el-form-item label="原密码" prop="oldPwd">
                <el-input v-model="passwordForm.oldPwd" type="password" show-password placeholder="请输入原密码"/>
              </el-form-item>
              <el-form-item label="新密码" prop="newPwd">
                <el-input v-model="passwordForm.newPwd" type="password" show-password placeholder="请输入新密码"/>
              </el-form-item>
              <el-form-item label="确认密码" prop="confirmPwd">
                <el-input v-model="passwordForm.confirmPwd" type="password" show-password
                          placeholder="请再次输入新密码"/>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmitPassword">更新密码</el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>

          <!-- 修改手机号 -->
          <el-tab-pane label="变更手机" name="phone">
            <el-form ref="phoneFormRef" :model="phoneForm" :rules="phoneRules" label-width="100px" class="phone-form">
              <el-form-item label="新手机号" prop="newPhone">
                <el-input v-model="phoneForm.newPhone" placeholder="请输入新手机号"/>
              </el-form-item>
              <el-form-item label="验证码" prop="code" class="code-item">
                <el-input v-model="phoneForm.code" placeholder="请输入验证码" style="width: 60%"/>
                <el-button type="primary" :disabled="isPhoneCodeDisabled" @click="sendPhoneCode"
                           style="width: 35%; margin-left: 5%">
                  {{ phoneCodeButtonText }}
                </el-button>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmitPhone">更新手机号</el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>

          <!-- 修改邮箱 -->
          <el-tab-pane label="变更邮箱" name="email">
            <el-form ref="emailFormRef" :model="emailForm" :rules="emailRules" label-width="100px" class="email-form">
              <el-form-item label="新邮箱" prop="email">
                <el-input v-model="emailForm.email" placeholder="请输入新邮箱"/>
              </el-form-item>
              <el-form-item label="验证码" prop="code" class="code-item">
                <el-input v-model="emailForm.code" placeholder="请输入验证码" style="width: 60%"/>
                <el-button type="primary" :disabled="isEmailCodeDisabled" @click="sendEmailCode"
                           style="width: 35%; margin-left: 5%">
                  {{ emailCodeButtonText }}
                </el-button>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmitEmail">更新邮箱</el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import {reactive, ref} from 'vue'
import {useUserInfo} from '@/stores/userInfo'
import {ElMessage, ElMessageBox, FormInstance, FormRules} from 'element-plus'
import {isImageFileType} from '@/utils/fileFunction'
import {verifyEmail, verifyPhone} from '@/utils/toolsValidate'
import {CopyDocument, Hide, View} from '@element-plus/icons-vue'
import EasyDictTag from "@/components/dictTag/easyDictTag.vue";
import {userApi} from "@/api/system/user";
import {copyText} from "@/utils/commonFunction.ts";
import {authApi} from "@/api/auth.ts";

// 获取用户信息
const userInfoStore = useUserInfo()
const userInfo = reactive({...userInfoStore.userInfo})

// 激活的标签页
const activeTab = ref('password')

// 表单引用
const passwordFormRef = ref<FormInstance>()
const phoneFormRef = ref<FormInstance>()
const emailFormRef = ref<FormInstance>()

// 修改密码表单
const passwordForm = reactive({
  oldPwd: '',
  newPwd: '',
  confirmPwd: ''
})

const state = reactive({
  phone: userInfo.phone || '',
  phoneShow: false
})

// 修改手机号表单
const phoneForm = reactive({
  newPhone: '',
  code: ''
})

// 修改邮箱表单
const emailForm = reactive({
  email: '',
  type: 'BAND_EMAIL',
  code: ''
})

// 验证规则
const passwordRules = reactive<FormRules>({
  oldPwd: [{required: true, message: '请输入原密码', trigger: 'blur'}],
  newPwd: [
    {required: true, message: '请输入新密码', trigger: 'blur'},
    {min: 6, max: 16, message: '密码长度为6-16位', trigger: 'blur'}, {
      validator: (rule: any, value: string, callback: any) => {
        if (value === passwordForm.oldPwd) {
          callback(new Error('新密码不能与原密码相同'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ],
  confirmPwd: [
    {required: true, message: '请确认新密码', trigger: 'blur'},
    {
      validator: (rule: any, value: string, callback: any) => {
        if (value !== passwordForm.newPwd) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ]
})

const phoneRules = reactive<FormRules>({
  newPhone: [
    {required: true, message: '请输入新手机号', trigger: 'blur'},
    {
      validator: (rule: any, value: string, callback: any) => {
        if (value && !verifyPhone(value)) {
          callback(new Error('请输入正确的手机号'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ],
  code: [{required: true, message: '请输入验证码', trigger: 'blur'}]
})

const emailRules = reactive<FormRules>({
  newEmail: [
    {required: true, message: '请输入新邮箱', trigger: 'blur'},
    {
      validator: (rule: any, value: string, callback: any) => {
        if (value && !verifyEmail(value)) {
          callback(new Error('请输入正确的邮箱'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ],
  code: [{required: true, message: '请输入验证码', trigger: 'blur'}]
})

// 手机号验证码按钮状态
const isPhoneCodeDisabled = ref(false)
const phoneCodeButtonText = ref('发送验证码')
let phoneCodeTimer: NodeJS.Timeout | null = null
let phoneCodeCountdown = 60

// 邮箱验证码按钮状态
const isEmailCodeDisabled = ref(false)
const emailCodeButtonText = ref('发送验证码')
let emailCodeTimer: NodeJS.Timeout | null = null
let emailCodeCountdown = 60

// 发送手机号验证码
const sendPhoneCode = () => {
  if (!phoneForm.newPhone) {
    ElMessage.warning('请输入手机号')
    return
  }

  if (!verifyPhone(phoneForm.newPhone)) {
    ElMessage.warning('请输入正确的手机号')
    return
  }

  // 这里应该调用发送验证码的API
  // mock发送验证码
  ElMessage.success('验证码已发送')

  // 启动倒计时
  isPhoneCodeDisabled.value = true
  phoneCodeCountdown = 60
  phoneCodeButtonText.value = `${phoneCodeCountdown}秒后重新发送`

  phoneCodeTimer = setInterval(() => {
    phoneCodeCountdown--
    phoneCodeButtonText.value = `${phoneCodeCountdown}秒后重新发送`

    if (phoneCodeCountdown <= 0 && phoneCodeTimer) {
      clearInterval(phoneCodeTimer)
      phoneCodeTimer = null
      isPhoneCodeDisabled.value = false
      phoneCodeButtonText.value = '发送验证码'
    }
  }, 1000)
}

// 发送邮箱验证码
const sendEmailCode = () => {
  if (!emailForm.email) {
    ElMessage.warning('请输入邮箱')
    return
  }

  if (!verifyEmail(emailForm.email)) {
    ElMessage.warning('请输入正确的邮箱')
    return
  }

  // 这里应该调用发送验证码的API
  authApi().sendEmailCode(emailForm).then(() => {
    ElMessage.success('验证码已发送')
  })
  // 启动倒计时
  isEmailCodeDisabled.value = true
  emailCodeCountdown = 60
  emailCodeButtonText.value = `${emailCodeCountdown}秒后重新发送`

  emailCodeTimer = setInterval(() => {
    emailCodeCountdown--
    emailCodeButtonText.value = `${emailCodeCountdown}秒后重新发送`

    if (emailCodeCountdown <= 0 && emailCodeTimer) {
      clearInterval(emailCodeTimer)
      emailCodeTimer = null
      isEmailCodeDisabled.value = false
      emailCodeButtonText.value = '发送验证码'
    }
  }, 1000)
}

// 更新密码
const onSubmitPassword = async () => {
  if (!passwordFormRef.value) return
  await passwordFormRef.value.validate((valid) => {
    if (valid) {
      // 这里应该调用更新密码的API
      // mock更新密码
      ElMessageBox.confirm('确定要更新密码吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            // 调用API更新密码
            userApi().changePassword(passwordForm).then(() => {
              ElMessage.success('密码更新成功')
              // 重置表单
              passwordFormRef.value?.resetFields()
            })
          })
          .catch(() => {
            ElMessage.info('已取消操作')
          })
    }
  })
}

// 更新手机号
const onSubmitPhone = async () => {
  if (!phoneFormRef.value) return

  await phoneFormRef.value.validate((valid) => {
    if (valid) {
      // 这里应该调用更新手机号的API
      // mock更新手机号
      ElMessageBox.confirm('确定要更新手机号吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            // 调用API更新手机号
            // userApi().updatePhone(phoneForm)
            ElMessage.success('手机号更新成功')
            // 更新用户信息
            userInfo.phone = phoneForm.newPhone
            userInfoStore.userInfo.phone = phoneForm.newPhone
            // 重置表单
            phoneFormRef.value?.resetFields()

            // 重置验证码倒计时
            if (phoneCodeTimer) {
              clearInterval(phoneCodeTimer)
              phoneCodeTimer = null
            }
            isPhoneCodeDisabled.value = false
            phoneCodeButtonText.value = '发送验证码'
          })
          .catch(() => {
            ElMessage.info('已取消操作')
          })
    }
  })
}

// 更新邮箱
const onSubmitEmail = async () => {
  if (!emailFormRef.value) return

  await emailFormRef.value.validate((valid) => {
    if (valid) {
      // 这里应该调用更新邮箱的API
      // mock更新邮箱
      ElMessageBox.confirm('确定要更新邮箱吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
          .then(() => {
            // 调用API更新邮箱
            userApi().bindEmail(emailForm).then((res) => {
              ElMessage.success(res.msg)
              // 更新用户信息
              // userInfo.email = emailForm.newEmail
              userInfoStore.userInfo.email = emailForm.newEmail
              // 重置表单
              emailFormRef.value?.resetFields()
            })
            // 重置验证码倒计时
            if (emailCodeTimer) {
              clearInterval(emailCodeTimer)
              emailCodeTimer = null
            }
            isEmailCodeDisabled.value = false
            emailCodeButtonText.value = '发送验证码'
          })
          .catch(() => {
            ElMessage.info('已取消操作')
          })
    }
  })
}

// 上传头像前校验
const beforeAvatarUpload = (rawFile: File) => {
  if (!isImageFileType(rawFile.type)) {
    ElMessage.error('头像图片必须是jpg/jpeg/png格式!')
    return false
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('头像图片大小不能超过2MB!')
    return false
  }
  return true
}

async function uploadAvatar(file: any) {
  // await userApi()
  // 	.updateAvatar(file.file)
  // 	.then((response: any) => {
  // 		ElMessage.success('上传成功');
  // 		// console.log(file)
  // 	});
  const reader = new FileReader()
  // 读取 File 对象
  reader.readAsDataURL(file.file)
  // 加载完成后
  reader.onload = () => {
    // 将读取的数据转换为 base64 编码的字符串
    const base64String = reader.result
    userInfo.avatar = base64String as string
  }
}

// 上传成功回调
function handleAvatarSuccess(response: any, uploadFile: any) {
  userInfo.avatar = URL.createObjectURL(uploadFile.raw!)
}

// 查看手机号
function handleViewPhone() {
  if (state.phoneShow) {
    state.phone = userInfo.phone
    state.phoneShow = false
  } else {
    userApi().getPhone(userInfo.userId).then((response: any) => {
      state.phone = response.data
      state.phoneShow = true
      copyText(state.phone)
    })
  }
}
</script>

<style scoped>
.main-container {
  .user-info {
    .user-info-header {
      display: flex;
      align-items: center;
    }
  }
}
</style>
