<script setup lang="ts">
import {computed, onBeforeMount, reactive, ref, Ref, watch} from 'vue'
import {apiAuthApi} from '@/api/system/apiAuth'
import {ElMessageBox} from 'element-plus'
import {apiApi} from '@/api/system/api'
import {copyText} from '@/utils/commonFunction.ts'

const props = defineProps({
  userId: {
    type: String,
    default: ''
  }
})

const data = reactive({
  id: null,
  createTime: '',
  updateTime: '',
  userId: '1',
  appid: '',
  sm2PublicKey: '',
  sm2PrivateKey: '',
  aesKey: '',
  aesIv: '',
  status: '',
  openApiList: null
})

const allApiList = ref([]) as Ref<Array<any>>

const dataApiList = ref([]) as Ref<Array<any>>

// 获取用户授权信息
function getUserApiAuthInfo(userId: string) {
  apiAuthApi()
      .get({id: userId})
      .then((res) => {
        if (res.data != null) {
          const resData = res.data
          // 逐个属性更新 data 对象
          Object.keys(resData).forEach((key) => {
            if (key in data) {
              ;(data as any)[key] = resData[key]
            }
          })
        } else {
          ElMessageBox.confirm('用户未授权，是否确定授权？', '提示', {
            confirmButtonText: '确认',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(async () => {
            try {
              await apiAuthApi().applyFor({id: userId})
              getUserApiAuthInfo(userId)
            } finally {
            }
          })
        }
      })
}

// 获取api列表
function getApiList() {
  apiApi()
      .getList({})
      .then((res) => {
        allApiList.value = res.data
      })
}

const allApiListIds = computed(
    () =>
        allApiList.value?.map((i) => ({
          key: i.id,
          label: i.apiName + `（${i.apiUrl}）`
        })) || []
)

function handleChangeTransfer(value: string[], direction: 'left' | 'right', movedKeys: string[]) {
  apiAuthApi().applyApi({
    userId: data.userId,
    appid: data.appid,
    apiIdList: dataApiList.value
  })
}

function copyAuth() {
  const json = {
    appid: data.appid,
    sm2_public_key: data.sm2PublicKey,
    sm2_private_key: data.sm2PrivateKey,
    aes_key: data.aesKey,
    aes_iv: data.aesIv
  }
  copyText(JSON.stringify(json))
}

watch(
    () => data.openApiList,
    () => {
      dataApiList.value = data?.openApiList?.map((i) => i.id) || []
    }
)

onBeforeMount(() => {
  getUserApiAuthInfo(props.userId)
  getApiList()
})
</script>

<template>
  <div>
    <el-button type="primary" style="margin-bottom: 10px" @click="copyAuth()">一键复制</el-button>
    <el-descriptions column="3" direction="vertical" border>
      <el-descriptions-item label="appid">{{ data.appid }}</el-descriptions-item>
      <el-descriptions-item label="aesKey">{{ data.aesKey }}</el-descriptions-item>
      <el-descriptions-item label="aesIv">{{ data.aesIv }}</el-descriptions-item>
      <el-descriptions-item label="sm2公钥" span="3">
        <p class="long-text">{{ data.sm2PublicKey }}</p>
      </el-descriptions-item>
      <el-descriptions-item label="sm2私钥" span="3">
        <p class="long-text">{{ data.sm2PrivateKey }}</p>
      </el-descriptions-item>
      <el-descriptions-item label="授权接口" span="3">
        <el-transfer filterable @change="handleChangeTransfer" :titles="['未授权接口', '已授权']" v-model="dataApiList"
                     :data="allApiListIds"/>
      </el-descriptions-item>
    </el-descriptions>
  </div>
</template>

<style scoped>
::v-deep(.el-transfer-panel) {
  width: 40% !important;
}

.long-text {
  word-wrap: break-word;
  word-break: break-all;
  white-space: wrap;
}
</style>
