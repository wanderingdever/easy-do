<script setup lang="ts">
import {computed, reactive, ref, watch} from 'vue'
import {ElMessage, FormInstance, FormRules, UploadRequestOptions, UploadUserFile} from 'element-plus'
import {UploadFilled} from '@element-plus/icons-vue'
import {noticeApi} from '@/api/system/notice'
import {getFileExtension} from '@/utils/fileFunction'

const props = withDefaults(
    defineProps<{
      modelValue: boolean
      editing: NoticeForm | NoticeDetail | null
    }>(),
    {
      modelValue: false,
      editing: null
    }
)

const emit = defineEmits<{
  (e: 'update:modelValue', v: boolean): void
  (e: 'saved'): void
}>()

const api = noticeApi()

const dialogState = reactive({
  visible: false,
  uploading: false,
  submitting: false
})

const formRef = ref<FormInstance>()
const formModel = reactive<NoticeForm>({
  id: undefined,
  title: '',
  content: '',
  noticeType: 'ANNOUNCEMENT'
})

const fileList = ref<UploadUserFile[]>([])

const rules = reactive<FormRules<NoticeForm>>({
  title: [{required: true, message: '请输入标题', trigger: 'blur'}],
  content: [{required: true, message: '请输入内容', trigger: 'blur'}]
})

const dialogTitle = computed(() => (formModel.id ? '编辑公告' : '新增公告'))

watch(
    () => props.modelValue,
    (val) => {
      dialogState.visible = val
      if (val) {
        initForm(props.editing)
      }
    }
)

watch(
    () => dialogState.visible,
    (val) => emit('update:modelValue', val)
)

function initForm(editing: NoticeForm | NoticeDetail | null) {
  resetForm()
  if (editing) {
    Object.assign(formModel, {
      id: editing.id,
      title: editing.title,
      content: editing.content,
      noticeType: editing.noticeType || 'ANNOUNCEMENT'
    })
    const attachments = (editing as any)?.attachments as UploadUserFile[] | undefined
    fileList.value =
        attachments?.map((item) => ({
          name: item.name,
          url: item.url,
          status: 'success'
        })) || []
  }
}

function resetForm() {
  formRef.value?.clearValidate()
  Object.assign(formModel, {
    id: undefined,
    title: '',
    content: '',
    noticeType: 'ANNOUNCEMENT'
  })
  fileList.value = []
}

function handleClose() {
  dialogState.visible = false
}

function onContentInput(evt: Event) {
  const target = evt.target as HTMLDivElement
  formModel.content = target.innerHTML
}

function beforeUpload(file: File) {
  if (fileList.value.length >= 5) {
    ElMessage.error('最多上传 5 个文件')
    return false
  }
  const sizeOk = file.size / 1024 / 1024 < 5
  if (!sizeOk) {
    ElMessage.error('文件大小需小于 5MB')
    return false
  }
  return true
}

function handleUpload(options: UploadRequestOptions) {
  const file = options.file
  if (!file) return
  dialogState.uploading = true
  const reader = new FileReader()
  reader.readAsDataURL(file)
  reader.onload = () => {
    fileList.value = [
      ...fileList.value,
      {
        name: file.name,
        url: reader.result as string,
        status: 'success'
      }
    ]
    dialogState.uploading = false
  }
  reader.onerror = () => {
    dialogState.uploading = false
    ElMessage.error('文件读取失败')
  }
}

function removeFile(file: UploadUserFile) {
  fileList.value = fileList.value.filter((item) => item.name !== file.name)
}

async function submit() {
  if (!formRef.value) return
  const valid = await formRef.value.validate().catch(() => false)
  if (!valid) return
  dialogState.submitting = true
  const payload = {
    ...formModel,
    attachments: fileList.value.map((f) => ({
      name: f.name,
      url: f.url,
      ext: getFileExtension(f.name)
    }))
  }
  const action = formModel.id ? api.update(payload) : api.add(payload)
  try {
    await action
    ElMessage.success(formModel.id ? '更新成功' : '新增成功')
    emit('saved')
    handleClose()
  } catch (err) {
    console.error(err)
    ElMessage.error('保存失败')
  } finally {
    dialogState.submitting = false
  }
}
</script>

<template>
  <el-dialog
      v-model="dialogState.visible"
      :title="dialogTitle"
      width="820px"
      :close-on-click-modal="false"
      destroy-on-close
      @close="handleClose"
  >
    <el-form ref="formRef" :model="formModel" :rules="rules" label-width="88px">
      <el-form-item label="标题" prop="title">
        <el-input v-model="formModel.title" maxlength="200" show-word-limit placeholder="请输入公告标题"/>
      </el-form-item>
      <el-form-item label="类型" prop="noticeType">
        <el-select v-model="formModel.noticeType" class="w-full" placeholder="选择类型">
          <el-option label="公告" value="ANNOUNCEMENT"/>
        </el-select>
      </el-form-item>
      <el-form-item label="内容" prop="content">
        <div class="content-editor">
          <div class="content-editor__body" contenteditable v-html="formModel.content" @input="onContentInput"></div>
          <div class="content-editor__footer">支持粘贴图片、超链接，提交前请确认样式</div>
        </div>
      </el-form-item>
      <el-form-item label="附件/图片">
        <el-upload
            class="w-full"
            drag
            :limit="5"
            multiple
            :http-request="handleUpload"
            :on-remove="removeFile"
            :file-list="fileList"
            :before-upload="beforeUpload"
            :auto-upload="false"
            :disabled="dialogState.uploading || dialogState.submitting"
            accept="image/*,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        >
          <el-icon class="el-icon--upload">
            <UploadFilled/>
          </el-icon>
          <div class="el-upload__text">拖拽或点击上传（最多 5 个，单个 ≤ 5MB）</div>
        </el-upload>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" :loading="dialogState.submitting" @click="submit">保存</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<style scoped>
.content-editor {
  border: 1px solid var(--el-border-color);
  border-radius: 4px;
  overflow: hidden;
}

.content-editor__body {
  min-height: 180px;
  padding: 12px;
  outline: none;
  background: #fff;
}

.content-editor__footer {
  padding: 8px 12px;
  font-size: 12px;
  color: #909399;
  background: #f5f7fa;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
}
</style>
