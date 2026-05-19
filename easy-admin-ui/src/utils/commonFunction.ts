// 通用函数
import useClipboard from 'vue-clipboard3'
import {ElMessage} from 'element-plus'
import {formatDate} from '@/utils/formatTime'

const {toClipboard} = useClipboard()

// 百分比格式化
export function percentFormat(cellValue: string) {
    return cellValue ? `${cellValue}%` : '-'
}

// 列表日期时间格式化
export function dateFormatYMD(cellValue: string) {
    if (!cellValue) return '-'
    return formatDate(new Date(cellValue), 'YYYY-mm-dd')
}

// 列表日期时间格式化
export function dateFormatYMDHMS(cellValue: string) {
    if (!cellValue) return '-'
    return formatDate(new Date(cellValue), 'YYYY-mm-dd HH:MM:SS')
}

// 小数格式化
export function scaleFormat(value: string = '0', scale: number = 4) {
    return Number.parseFloat(value).toFixed(scale)
}

// 小数格式化
export function scale2Format(value: string = '0') {
    return Number.parseFloat(value).toFixed(2)
}

// 点击复制文本
export function copyText(text: string) {
    return new Promise((resolve, reject) => {
        try {
            //复制
            toClipboard(text).then(() => {
                //下面可以设置复制成功的提示框等操作
                ElMessage.success('复制成功')
                resolve(text)
            })
        } catch (e) {
            //复制失败
            ElMessage.error('复制失败')
            reject(e)
        }
    })
}

// 组装el-cascader父节点
export function sourcing(dataList: any[], id: string) {
    const arrRes: string[] = []
    dataList.forEach((item) => {
        if (item.id == id) {
            arrRes.unshift(item.id)
        } else {
            if (item.children && item.children.length) {
                const child = sourcing(item.children, id)
                if (child.length) {
                    arrRes.unshift(...sourcing(item.children, id))
                    arrRes.unshift(item.id)
                }
            }
        }
    })
    return arrRes
}
