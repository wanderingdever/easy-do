export function downloadFile(filePath: string, fileName: string) {
    const link = document.createElement('a')
    link.href = filePath
    link.setAttribute('download', fileName) // 设置下载文件名
    // 触发下载
    document.body.appendChild(link)
    link.click()
    // 清理资源
    document.body.removeChild(link)
}

/**
 * 获取文件后缀
 * @param fileName 文件名
 */
export function getFileExtension(fileName: any) {
    return fileName.split('.').pop().toLowerCase()
}

/**
 * 判断是否是图片
 * @param fileName 文件名字
 */
export function isImageFile(fileName: any) {
    const formatArr = ['png', 'jpg', 'jpeg', 'gif', 'svg', 'webp', 'bmp', 'ico']
    // 获取文件后缀名
    const extension = fileName.split('.').pop().toLowerCase()
    return formatArr.indexOf(extension) != -1
}

/**
 * 判断是否是图片 imgType: ['image/jpeg', 'image/png', 'image/jpg'],
 * @param fileType 文件名字
 */
export function isImageFileType(fileType: string) {
    const formatArr = ['image/jpeg', 'image/png', 'image/jpg']
    // 获取文件后缀名
    return formatArr.includes(fileType)
}

/**
 * 判断是否是视频
 * @param fileName 文件名字
 */
export function isVideoFile(fileName: any) {
    const formatArr = ['mp4', 'mkv', 'wmv', 'avi', 'mov']
    // 获取文件后缀名
    const extension = fileName.split('.').pop().toLowerCase()
    return formatArr.indexOf(extension) != -1
}

/**
 * 判断是否是文本文档
 * @param fileName 文件名字
 */
export function isOfficeFile(fileName: any) {
    const formatArr = ['doc', 'docx', 'pdf', 'ppt', 'pptx', 'xlsx', 'xls', 'xlsm', 'xlsb', 'xltx', 'txt']
    // 获取文件后缀名
    const extension = fileName.split('.').pop().toLowerCase()
    return formatArr.indexOf(extension) != -1
}
