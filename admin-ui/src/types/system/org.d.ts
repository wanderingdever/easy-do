declare interface FormOrg {
    id: string | null
    orgParentIdList: string[] // 上级部门数据集合
    orgParentId: string // 上级部门ID
    orgName: string // 机构名字
    orgShortName: string | null // 机构简称
    orgCode: string | null // 机构代码
    orgLevel: string | null // 机构级别
    orgType: string | null // 机构类型
    orgNature: string | null // 机构性质
    orgTag: string | null // 机构标签
    orgProvince: string | null // 省
    orgCity: string | null // 区
    orgDistrict: string | null // 区
    orgAddress: string | null // 详细地址
    orgDesc: string | null // 简介
    orgLogo: string | null // logo
    orgSort: number // 排序
    orgStatus: string | null //  机构状态
    territory: string[] // 属地
    orgAreaCode: string | null // 属地
}

declare interface RowOrg extends RowBase {
    id: string
    orgParentId: string
    orgName: string
    orgShortName: string | null
    orgLevel: string | null
    orgType: string | null
    orgNature: string | null
    orgCode: string | null
    orgTag: string | null
    orgProvince: string | null
    orgCity: string | null
    orgDistrict: string
    orgAreaCode: string | null
    orgAddress: string | null
    orgDesc: string | null
    orgLogo: string | null
    orgSort: number
    orgStatus: string | null
    children: RowOrg[]
}

declare interface OrgUserTree {
    id: string
    parentId: string
    name: string
    type: string
    hasChildren: boolean
}

declare interface OrgTree {
    id: string
    orgCode: string
    orgName: string
    orgParentId: string
    orgShortName: string | null
    orgStatus: string | null
    children: SimpleOrgTree[] | null
}

declare interface SimpleOrgTree {
    id: string
    orgCode: string
    orgName: string
    orgParentId: string
    orgShortName: string | null
    orgStatus: string | null
    children: SimpleOrgTree[] | null
}
