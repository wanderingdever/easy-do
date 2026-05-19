import {defineStore} from 'pinia'
import {dictApi} from '@/api/system/dict'

export const useDictStore = defineStore('dict', {
    state: (): DictStates => ({
        dictList: [] as DictState[]
    }),
    actions: {
        async setDict() {
            const queryParam = {
                isSystem: true
            }
            await dictApi()
                .typeAndDataList(queryParam)
                .then((response: any) => {
                    this.dictList = response.data
                })
        }
    },
    persist: true
})
