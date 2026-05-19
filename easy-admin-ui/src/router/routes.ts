import {RouteRecordRaw} from 'vue-router'
import Layout from '@/layout/index.vue'
import Parent from '@/layout/routerView/mainRouter.vue'

export const dynamicRoutes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: '/',
        component: Layout,
        meta: {
            isKeepAlive: true
        },
        children: [
            {
                path: '/home',
                name: 'home',
                component: () => import('@/views/home/home.vue'),
                meta: {
                    isKeepAlive: true,
                    title: '首页',
                    icon: 'icon-shouye'
                }
            },
        ]
    },
    {
        path: '/message/center',
        name: 'messageCenter',
        component: () => import('@/views/message/center/index.vue'),
        meta: {
            isKeepAlive: true,
            title: '我的消息'
        }
    },
    {
        path: '/personal',
        name: 'personal',
        component: () => import('@/views/personal/personal.vue'),
        meta: {
            title: '个人中心',
            isLink: '',
            isHide: false,
            isKeepAlive: false,
            isAffix: false,
            isIframe: false
        }
    },
    {
        path: '/system',
        name: 'system',
        component: Parent,
        meta: {
            isHide: true
        },
        children: [
            {
                path: '/system/dict_data',
                name: 'dictData',
                component: () => import('@/views/system/dict/dictData.vue'),
                meta: {
                    isKeepAlive: true,
                    title: '字典数据'
                }
            },
            {
                path: '/system/table_demo',
                name: 'demo',
                component: () => import('@/views/system/demo/tableDemo.vue'),
                meta: {
                    isKeepAlive: true,
                    title: '表格demo'
                }
            }
        ]
    }
]

export const staticRoutes: Array<RouteRecordRaw> = [
    {
        path: '/login',
        name: 'login',
        component: () => import('@/views/login/login.vue'),
        meta: {
            title: '登录'
        }
    },
    {
        path: '/message/notice/view/:id',
        component: Layout,
        meta: {
            isHide: true
        },
        children: [
            {
                path: '',
                name: 'messageNoticeView',
                component: () => import('@/views/message/notice/detail.vue'),
                meta: {
                    title: '公告详情',
                    isHide: true,
                    isKeepAlive: false
                }
            }
        ]
    }
]

export const notFoundAndNoPower = []
