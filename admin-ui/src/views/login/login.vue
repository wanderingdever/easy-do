<template>
  <div class="login-container">
    <el-card shadow="none" class="login-box">
      <h2>登录</h2>
      <el-form label-position="left" class="login-form" :model="loginFrom">
        <el-form-item>
          <el-input :prefix-icon="User" v-model="loginFrom.username" placeholder="请输入账号"></el-input>
        </el-form-item>
        <el-form-item>
          <el-input :prefix-icon="Lock" type="password" v-model="loginFrom.password" placeholder="请输入密码"
                    show-password></el-input>
        </el-form-item>
        <el-form-item v-if="state.isShowCode">
          <el-row :gutter="5">
            <el-col :span="16">
              <el-input :prefix-icon="CircleCheck" v-model="loginFrom.validateCode" type="text" maxlength="4"
                        placeholder="验证码"/>
            </el-col>
            <el-col :span="8" style="display: flex; align-items: center">
              <el-image style="height: 100%" :src="state.codeUrl" @click="getVerificationCode()"/>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" class="login-button" @click="handleLogin" :loading="state.loading">登录</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import {onMounted, reactive} from 'vue'
import {ElButton, ElForm, ElFormItem, ElInput, ElMessage} from 'element-plus'
import {CircleCheck, Lock, User} from '@element-plus/icons-vue'
import {authApi} from '@/api/auth.ts'
import {Session} from '@/utils/storage.ts'
import {configApi} from '@/api/system/config'
import {initRouter} from '@/router/init.ts'

const loginFrom = reactive({
  username: 'admin',
  password: '123456',
  loginType: 'PWD',
  client: 'ADMIN',
  validateCode: '',
  verifyCodeUuid: ''
})

const state = reactive({
  isShowCode: false,
  loading: false,
  codeUrl: ''
})

// 获取是否开启验证码
async function getEnableCaptcha() {
  await configApi()
      .get('captcha_enable')
      .then((res) => {
        console.log(res.data);
        // 如果data==null或者data==0，说明没有开启验证码
        if (res.data == null || res.data.configValue == '0') {
          return
        } else {
          state.isShowCode = true
          // 开启验证码，获取验证码
          getVerificationCode()
        }
      })
}

// 获取验证码
async function getVerificationCode() {
  await authApi()
      .getVerificationCode()
      .then((res) => {
        state.codeUrl = window.URL.createObjectURL(new Blob([res.data]))
        loginFrom.verifyCodeUuid = res.headers['verify-code-uuid']
      })
      .catch(() => {
        ElMessage.error('获取验证码失败')
      })
}

async function handleLogin() {
  state.loading = true
  authApi()
      .login(loginFrom)
      .then((res) => {
        // 登录成功，将token存储到sessionStorage
        Session.set('token', res.data.accessToken)
        // 初始化路由
        initRouter()
        setTimeout(() => {
          // 登录成功，跳转到首页
          ElMessage.success('登录成功')
          location.href = '/'
        }, 1000)
        state.loading = false
      })
      .catch(() => {
        // 重置验证码
        getVerificationCode()
        state.loading = false
      })
}

onMounted(() => {
  getEnableCaptcha()
})
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: var(--bg-color);

  .login-box {
    width: 500px;
    height: 350px;
    text-align: center;
    display: flex;
    justify-content: center;
    padding: 20px;

    .login-form {
      width: 300px;
      margin-top: 20px;

      .el-form-item {
        width: 100%;

        .login-button {
          width: 100%;
        }
      }
    }
  }
}
</style>
