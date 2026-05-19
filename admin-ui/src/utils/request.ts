import axios, {AxiosInstance, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig} from 'axios'
import qs from 'qs'
import {Session} from '@/utils/storage.ts'
import {ElMessage, ElMessageBox} from 'element-plus'
// 创建一个 axios 实例
const service: AxiosInstance = axios.create({
    baseURL: import.meta.env.VITE_APP_BASE_API,
    timeout: 5000, // 请求超时时间
    paramsSerializer: {
        serialize(params) {
            return qs.stringify(params, {allowDots: true})
        }
    }
})

// 请求拦截器
service.interceptors.request.use(
    (config: InternalAxiosRequestConfig<any>) => {
        // 设置token和机器码
        if (Session.get('token')) {
            config.headers!['Easy-Token'] = 'Bearer ' + `${Session.get('token')}`
        }
        return config
    },
    (error) => {
        return Promise.reject(error)
    }
)

// 响应拦截器
service.interceptors.response.use(
    (response: AxiosResponse) => {
        // 对响应数据做点什么
        const res = response.data
        if (res.code && res.code !== 200) {
            // 登录过期
            if ([11011, 11012, 11013, 11014, 11015, 11016, 11017].includes(res.code)) {
                let msg = ''
                switch (res.code) {
                    case 11011:
                        msg = '请登录后再操作！'
                        break
                    case 11012:
                        msg = '登录无效，请重新登录！'
                        break
                    case 11013:
                        msg = '登录已失效，请重新登录！'
                        break
                    case 11014:
                        msg = '您已被顶下线！'
                        break
                    case 11015:
                        msg = '您已被踢下线！'
                        break
                    case 11017:
                        msg = '请登录后再操作！'
                        break
                    default:
                        msg = '请重新登录！'
                }
                ElMessageBox.alert(msg, '提示', {}).then(() => {
                    // 清除token
                    Session.remove('token')
                    // 跳转到登录页
                    window.location.href = import.meta.env.VITE_PUBLIC_PATH + '/login'
                })

            } else {
                ElMessage.error(res.msg)
            }
            return Promise.reject(res)
        } else {
            if (response.config.responseType === 'blob' || response.config.responseType === 'arraybuffer') {
                return response
            } else {
                return res
            }
        }
    },
    (error) => {
        return Promise.reject(error)
    }
)

// 封装请求方法
const request = {
    get<T = any>(url: string, config?: AxiosRequestConfig): Promise<T> {
        return service.get(url, config)
    },
    post<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<T> {
        return service.post(url, data, config)
    },
    put<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<T> {
        return service.put(url, data, config)
    },
    delete<T = any>(url: string, config?: AxiosRequestConfig): Promise<T> {
        return service.delete(url, config)
    }
}

export default request
