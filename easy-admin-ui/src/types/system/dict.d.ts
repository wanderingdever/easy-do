// 字典
declare interface DictState {
    id: string
    dictName: string
    dictType: string
    isSystem: false
    enable: boolean
    description: string
    createTime: string
    updateTime: string
    dictDataList: Array<DictDataState>
}

// 字典数据
declare interface DictDataState {
    id: string
    dictType: string
    dictTypeId: string
    dictLabel: string
    dictValue: string
    dictSort: number
    cssClass: string
    listClass: string
    enable: boolean
    createTime: string
    updateTime: string
}

// 字典列表
declare interface DictStates {
    dictList: Array<DictState>
}

// 字典类型
declare interface FormDictType {
    id: string | null
    dictName: string // 字典名字
    dictType: string // 字典类型
    description: string | null // 描述
    isSystem: boolean // 是否系统内置
    enable: boolean // 是否启用
}

declare interface RowDictType extends RowBase {
    id: string
    dictName: string // 字典名字
    dictType: string // 字典类型
    description: string | null // 描述
    isSystem: boolean // 是否系统内置
    enable: boolean // 是否启用
}

// 字典数据
declare interface FormDictData {
    id: string | null
    dictType: string // 字典类型
    dictTypeId: string // 字典类型ID
    dictLabel: string // 字典数据标签
    dictValue: string // 字典数据值
    listClass: string // 样式属性
    cssClass: string | null // 回显样式
    dictSort: number // 排序
    enable: boolean // 是否启用
}

// 字典数据
declare interface RowDictData extends RowBase {
    id: string
    dictType: string // 字典类型
    dictTypeId: string // 字典类型ID
    dictLabel: string // 字典数据标签
    dictValue: string // 字典数据值
    listClass: string // 样式属性
    cssClass: string | null // 回显样式
    dictSort: number // 排序
    enable: boolean // 是否启用
}

// 字典类型集合
declare interface DictTypeList {
    id: string
    dictName: string // 字典名字
    dictType: string // 字典类型
    description: string // 描述
    isSystem: boolean // 是否系统内置
    enable: boolean // 是否启用
    dictDataList: Array<RowDictData>
}
