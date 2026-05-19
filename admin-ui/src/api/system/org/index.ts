import request from '@/utils/request'

export function orgApi() {
    return {
        // 树形机构数据
        treeOrg: () => {
            return request.get('/org/tree')
        },
        // 分页查询
        page: (data: object) => {
            return request.post('/org/page', data)
        },
        // 新增机构信息
        add: (data: object) => {
            return request.post('/org/add', data)
        },
        // 更新机构信息
        update: (data: object) => {
            return request.post('/org/update', data)
        },
        // 删除机构信息
        del: (data: object) => {
            return request.post('/org/del', data)
        },

        // 查询机构和用户组成的树形数据
        orgUserTree: (data: object) => {
            return request.post('/org/org_user_tree', data)
        }
    }
}
