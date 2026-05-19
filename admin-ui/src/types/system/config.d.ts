// 表单数据
declare interface FormConfig {
    id: string | null
    configName: string // 参数名称
    configKey: string // 参数键
    configValue: string // 参数值
    isSystem: boolean // 是否系统默认
    enable: boolean // 是否启用
}

// 表格数据
declare interface RowConfig extends RowBase {
    id: string
    configName: string // 参数名称
    configKey: string // 参数键
    configValue: string // 参数值
    isSystem: boolean // 是否系统默认
    enable: boolean // 是否启用
}
