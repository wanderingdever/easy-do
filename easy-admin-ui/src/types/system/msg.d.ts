declare type NoticeStatus = 'DRAFT' | 'PUBLISHED' | 'REVOKED'

declare type NoticeType = 'ANNOUNCEMENT' | string

declare interface NoticeRow extends RowBase {
    id: string
    title: string
    noticeType: NoticeType
    status: NoticeStatus
    senderId: string
    publishTime?: string
    createTime?: string
    isRead?: 0 | 1
    readTime?: string
}

declare interface NoticeDetail extends NoticeRow {
    content: string
    revokeTime?: string
    updateTime?: string
    readCount?: number
}

declare interface NoticeForm {
    id?: string
    title: string
    content: string
    noticeType?: NoticeType
}

declare interface NoticeListQuery {
    title?: string
    status?: NoticeStatus
    noticeType?: NoticeType
    readStatus?: 'READ' | 'UNREAD' | ''
    pageNum?: number
    pageSize?: number
    current?: number
    size?: number
}

declare interface UnreadNoticeItem {
    id: string
    title: string
    publishTime?: string
    status: NoticeStatus
}

declare interface MessageRow extends RowBase {
    id: string
    title: string
    content: string
    senderId: string
    receiverId: string
    isRead: 0 | 1
    readTime?: string
    createTime?: string
}

declare interface UnreadCountData {
    unreadCount: number
    unreadNoticeCount: number
    unreadMessageCount: number
}
