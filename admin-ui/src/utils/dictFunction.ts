import {useDictStore} from '@/stores/dict'
import {storeToRefs} from 'pinia'

const dict = useDictStore()
const {dictList} = storeToRefs(dict)

// 获取字典类型下面的字典数据
export function getDictDataList(dictType: string) {
    // 获取pinia内的字典数据
    const dictTypeData = dictList.value.find((dict: DictState) => dict.dictType === dictType)
    if (dictTypeData) {
        return dictTypeData.dictDataList
    }
    // 没有就实时查询
    else {
        return null
    }
}

// 根据字典类型和数据获取对应的字典
export function getDictByValue(dictType: string, value: any) {
    // 获取pinia内的字典数据
    const dictTypeData = dictList.value.find((dict: DictState) => dict.dictType === dictType)
    if (dictTypeData) {
        const dict = dictTypeData.dictDataList.filter((item) => item.dictValue === value)
        if (dict) {
            return dict[0].dictLabel
        }
    }
    // 没有就实时查询
    else {
        return null
    }
}
