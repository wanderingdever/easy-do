declare interface RoleInfo {
    id: string
    roleName: string // 角色名称
    roleKey: string // 角色标识
    authorityLevel: string // 权限范围
    roleSort: number // 排序
    enable: boolean // 角色状态
    createTime: string
    updateTime: string
}

declare interface FormRole {
    id: string | null
    roleName: string // 角色名称
    roleKey: string // 角色标识
    authorityLevel: string // 权限范围
    roleSort: number // 排序
    enable: boolean // 角色状态
    menuList: any[]
}

declare interface RowRole extends RowBase {
    id: string
    roleName: string // 角色名称
    roleKey: string // 角色标识
    authorityLevel: string // 权限范围
    roleSort: number // 排序
    enable: boolean // 角色状态
    menuList: []
}
