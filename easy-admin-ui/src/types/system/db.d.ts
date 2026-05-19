/**
 * 数据库连接配置表单数据
 */
declare interface FormDb {
    id: string | null // 主键ID（新增时不传，更新时必传）
    secretKey: string // 数据库连接配置ID
    dbType: string // 数据库类型
    host: string // 数据库主机
    port: number // 数据库端口
    databaseName: string // 数据库名称
    username: string // 数据库用户名
    password: string // 数据库密码
    enabled: number // 是否启用（1:启用 0:禁用）
}

/**
 * 数据库连接配置表格数据
 */
declare interface RowDb extends RowBase {
    id: string // 主键ID
    secretKey: string // 数据库连接配置ID
    dbType: string // 数据库类型
    host: string // 数据库主机
    port: number // 数据库端口
    databaseName: string // 数据库名称
    username: string // 数据库用户名
    password: string // 数据库密码
    enabled: boolean // 是否启用
    createTime: string // 创建时间
    updateTime: string // 更新时间
}

/**
 * 数据库连接测试结果
 */
declare interface DbTestResult {
    success: boolean // 连接是否成功
    message: string // 测试消息（成功或失败原因）
    connectionTime: number // 连接耗时（毫秒）
    databaseVersion: string // 数据库版本
    databaseProductName: string // 数据库产品名称
    jdbcUrl: string // JDBC连接URL
}

/**
 * 数据库连接配置搜索表单
 */
declare interface DbSearchForm {
    current: number // 当前页
    size: number // 每页大小
    orders: any[] // 排序
    id?: string | null // ID
    dbName?: string | null // 数据库名称
    host?: string | null // 数据库主机
    dbKey?: string | null // 数据库键名
    enable?: boolean | null // 是否启用
}
