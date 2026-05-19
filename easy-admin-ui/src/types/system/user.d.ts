// 用户信息
declare interface UserInfo {
    userId: string
    userInfoId: string
    orgId: string
    username: string
    avatar: string | null
    phone: string
    email: string
    nickname: string
    sex: string
    client: string
    createTime: string
    status: string
    roleKeyList: string[]
    roleList: RoleInfo[]
    permissionList: string[]
    ip: string
    ipLocation: string
    loginTime: string
}

declare interface UserInfosState {
    userInfo: UserInfo
}

declare interface FormUser {
    id: string | null
    orgId: string | null // 机构ID
    orgIdList: string[] // 机构ID
    username: string // 账户名称
    nickname: string // 用户昵称
    phone: string | null // 手机号
    email: string | null // 邮箱
    sex: string | null // 性别
    client: string | null // 客户端
    avatar: string | null // 头像
    status: string | null // 用户状态
    sort: number // 排序
    roleList: string[] // 角色ID集合
}

declare interface RowUser extends RowBase {
    id: string
    username: string
    email: string | null
    phone: string | null
    client: string
    sort: number | null
    status: string
    userInfoId: string
    nickname: string
    avatar: string
    sex: string
    orgId: string
    ip: string | null
    ipLocation: string | null
    loginTime: string | null
    roleList: string[]
    roles: any[]
    permissionList: string[]
    postList: null
}
