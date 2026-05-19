import {defineStore} from 'pinia'
import {Session} from '@/utils/storage.ts'

// 定义本地存储的键名
const TAGS_VIEW_LIST_KEY = 'tagsViewList'

const ACTIVE_KEY = 'active'

export const useTagsView = defineStore('tagsView', {
    state: (): TagsViewListState => ({
        tagsViewRoutes: [] as Array<TagViewState>,
        tagsViewList: [] as Array<TagViewState>, // 从本地存储初始化
        active: Session.get(ACTIVE_KEY) || '/home' // 从本地存储初始化
    }),
    getters: {
        getTagsViewList: (state) => state.tagsViewList,
        getActive: (state) => state.active
    },
    actions: {
        async setTagsViewRoutes(data: Array<TagViewState>) {
            this.tagsViewRoutes = data
            // 筛选出tagsViewRoutes中mate的isHide为false的
            this.tagsViewList =
                Session.get(TAGS_VIEW_LIST_KEY) ||
                this.tagsViewRoutes.filter((item) => {
                    return item.meta.isAffix === true
                })
        },
        setTagsViewList(targetPath: string) {
            // 判断path是否存在，存在就不添加，直接激活
            const index = this.tagsViewList.findIndex((item) => {
                // 只比较路径部分，忽略查询参数
                const itemPath = item.path.split('?')[0]
                return itemPath === targetPath
            })
            if (index === -1) {
                this.tagsViewList.push(
                    ...this.tagsViewRoutes.filter((item) => {
                        return item.path === targetPath
                    })
                )
            } else {
                // 如果标签页已存在，更新其路径为完整路径（包含参数）
                this.tagsViewList[index].path = targetPath
            }
            this.active = targetPath
            // 持久化状态
            Session.set(TAGS_VIEW_LIST_KEY, this.tagsViewList)
            Session.set(ACTIVE_KEY, this.active)
        },
        setActive(index: string) {
            this.active = index
            // 持久化状态
            Session.set(ACTIVE_KEY, this.active)
        }
    }
})
