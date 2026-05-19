import {createApp} from 'vue'
import '@/theme/index.scss'
import App from './App.vue'
import pinia from '@/stores'
import router from '@/router'
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import {elSvg} from '@/utils/other.ts'
import {directive} from '@/directive'

const app = createApp(App)

directive(app)
elSvg(app)

app.use(pinia)
    .use(router)
    .use(ElementPlus, {locale: zhCn})
    .mount('#app')

