package com.easy.tool.http;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;


/**
 * 多线程文件下载工具类，支持类似aria2的配置功能，增加了下载耗时记录
 */
public class MultiThreadDownloader {

    // 下载配置
    private final DownloadConfig config;
    // 线程池
    private ExecutorService executorService;
    // 下载进度监听器
    private DownloadListener listener;
    // 总下载字节数
    private final AtomicLong totalDownloaded = new AtomicLong(0);
    // 取消标志
    private volatile boolean cancelled = false;
    // 文件总大小
    private long fileTotalSize = -1;
    // 下载开始时间(毫秒)
    private long startTime;
    // 下载结束时间(毫秒)
    private long endTime;
    // 格式化工具
    private static final DecimalFormat SPEED_FORMAT = new DecimalFormat("#.##");

    /**
     * 构造函数
     *
     * @param config 下载配置
     */
    public MultiThreadDownloader(DownloadConfig config) {
        this.config = config;
    }

    /**
     * 设置下载监听器
     *
     * @param listener 监听器
     */
    public void setDownloadListener(DownloadListener listener) {
        this.listener = listener;
    }

    /**
     * 开始下载文件
     *
     * @param fileUrl  文件URL
     * @param savePath 保存路径
     * @return 下载结果，包含是否成功、耗时等信息
     * @throws Exception 可能的异常
     */
    public DownloadResult download(String fileUrl, String savePath) throws Exception {
        // 初始化下载结果
        DownloadResult result = new DownloadResult();
        result.setFileUrl(fileUrl);
        result.setSavePath(savePath);

        File saveFile = new File(savePath);
        File tempDir = new File(config.getTempDir());

        // 确保临时目录和目标目录存在
        if (!tempDir.exists()) {
            tempDir.mkdirs();
        }
        if (saveFile.getParentFile() != null && !saveFile.getParentFile().exists()) {
            saveFile.getParentFile().mkdirs();
        }

        // 检查文件是否已存在且完整
        if (saveFile.exists() && checkFileComplete(fileUrl, saveFile)) {
            result.setSuccess(true);
            result.setStatus(DownloadStatus.COMPLETED);
            result.setMessage("文件已存在");
            result.setFileSize(saveFile.length());
            notifyListener(DownloadStatus.COMPLETED, 100, "文件已存在");
            return result;
        }

        try {
            // 记录开始时间
            startTime = System.currentTimeMillis();
            result.setStartTime(startTime);

            // 获取文件大小
            fileTotalSize = getFileSize(fileUrl);
            result.setFileSize(fileTotalSize);

            if (fileTotalSize <= 0) {
                String errorMsg = "无法获取文件大小";
                result.setSuccess(false);
                result.setStatus(DownloadStatus.FAILED);
                result.setMessage(errorMsg);
                notifyListener(DownloadStatus.FAILED, 0, errorMsg);
                return result;
            }

            String startMsg = String.format("开始下载，文件大小: %s", formatFileSize(fileTotalSize));
            notifyListener(DownloadStatus.STARTED, 0, startMsg);

            // 计算分块大小
            long chunkSize = calculateChunkSize(fileTotalSize);
            int threadCount = calculateThreadCount(fileTotalSize, chunkSize);

            // 创建线程池
            executorService = new ThreadPoolExecutor(
                    threadCount,
                    threadCount,
                    0L, TimeUnit.MILLISECONDS,
                    new LinkedBlockingQueue<>(),
                    new ThreadFactory() {
                        private int count = 0;

                        @Override
                        public Thread newThread(Runnable r) {
                            Thread thread = new Thread(r, "download-thread-" + (count++));
                            thread.setDaemon(true);
                            return thread;
                        }
                    },
                    new ThreadPoolExecutor.AbortPolicy()
            );

            // 提交下载任务
            List<Future<?>> futures = new ArrayList<>();
            for (int i = 0; i < threadCount; i++) {
                long start = i * chunkSize;
                long end = (i == threadCount - 1) ? fileTotalSize - 1 : (i + 1) * chunkSize - 1;

                // 如果是断点续传，获取已下载的起始位置
                File chunkFile = getChunkFile(tempDir, saveFile.getName(), i);
                if (chunkFile.exists()) {
                    start += chunkFile.length();
                    totalDownloaded.addAndGet(chunkFile.length());
                }

                if (start > end) {
                    continue; // 该分块已完成
                }

                DownloadTask task = new DownloadTask(fileUrl, chunkFile, start, end);
                futures.add(executorService.submit(task));
            }

            // 等待所有任务完成
            for (Future<?> future : futures) {
                try {
                    future.get();
                } catch (CancellationException e) {
                    // 任务被取消
                    break;
                } catch (ExecutionException e) {
                    String errorMsg = "下载出错: " + e.getCause().getMessage();
                    throw new Exception(errorMsg, e.getCause());
                }
            }

            // 检查是否被取消
            if (cancelled) {
                endTime = System.currentTimeMillis();
                result.setEndTime(endTime);
                result.setDuration(endTime - startTime);
                result.setSuccess(false);
                result.setStatus(DownloadStatus.CANCELLED);
                result.setDownloadedSize(totalDownloaded.get());
                result.setMessage("下载已取消");
                notifyListener(DownloadStatus.CANCELLED, getProgress(), "下载已取消");
                return result;
            }

            // 合并分块文件
            mergeChunks(tempDir, saveFile, threadCount);

            // 清理临时文件
            cleanTempFiles(tempDir, saveFile.getName(), threadCount);

            // 记录结束时间并计算耗时
            endTime = System.currentTimeMillis();
            long duration = endTime - startTime;
            double averageSpeed = calculateAverageSpeed(fileTotalSize, duration);

            result.setSuccess(true);
            result.setStatus(DownloadStatus.COMPLETED);
            result.setEndTime(endTime);
            result.setDuration(duration);
            result.setDownloadedSize(fileTotalSize);
            result.setAverageSpeed(averageSpeed);

            String completeMsg = String.format(
                    "下载完成，耗时: %s，平均速度: %s/s",
                    formatDuration(duration),
                    formatFileSize((long) (averageSpeed))
            );
            notifyListener(DownloadStatus.COMPLETED, 100, completeMsg);
            result.setMessage(completeMsg);

            return result;
        } catch (Exception e) {
            endTime = System.currentTimeMillis();
            result.setEndTime(endTime);
            result.setDuration(endTime - startTime);
            result.setSuccess(false);
            result.setStatus(DownloadStatus.FAILED);
            result.setDownloadedSize(totalDownloaded.get());
            result.setMessage("下载失败: " + e.getMessage());

            notifyListener(DownloadStatus.FAILED, getProgress(), "下载失败: " + e.getMessage());
            throw e;
        } finally {
            if (executorService != null) {
                executorService.shutdownNow();
            }
        }
    }

    /**
     * 取消下载
     */
    public void cancel() {
        cancelled = true;
        if (executorService != null) {
            executorService.shutdownNow();
        }
        notifyListener(DownloadStatus.CANCELLED, getProgress(), "正在取消下载...");
    }

    /**
     * 计算平均下载速度 (字节/毫秒)
     */
    private double calculateAverageSpeed(long totalSize, long durationMs) {
        if (durationMs <= 0) return 0;
        // 转换为字节/秒
        return (totalSize * 1.0) / (durationMs / 1000.0);
    }

    /**
     * 格式化时长（毫秒）为人类可读形式
     */
    private String formatDuration(long durationMs) {
        if (durationMs < 1000) {
            return durationMs + "ms";
        }

        long seconds = durationMs / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;

        if (hours > 0) {
            return String.format("%d时%d分%d秒", hours, minutes % 60, seconds % 60);
        } else if (minutes > 0) {
            return String.format("%d分%d秒", minutes, seconds % 60);
        } else {
            return String.format("%d秒", seconds);
        }
    }

    /**
     * 检查文件是否完整
     */
    private boolean checkFileComplete(String fileUrl, File file) throws Exception {
        if (!file.exists()) {
            return false;
        }

        long remoteSize = getFileSize(fileUrl);
        return remoteSize == file.length();
    }

    /**
     * 获取文件大小
     */
    private long getFileSize(String fileUrl) throws Exception {
        HttpURLConnection connection = null;
        try {
            URL url = new URL(fileUrl);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("HEAD");
            connection.setConnectTimeout(config.getConnectTimeout());
            connection.setReadTimeout(config.getReadTimeout());
            connection.setRequestProperty("User-Agent", config.getUserAgent());

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                return connection.getContentLengthLong();
            } else {
                throw new Exception("获取文件信息失败，响应码: " + responseCode);
            }
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    /**
     * 计算分块大小
     */
    private long calculateChunkSize(long fileSize) {
        // 如果文件小于最小分块大小，则不分块
        if (fileSize <= config.getMinChunkSize()) {
            return fileSize;
        }

        // 根据线程数计算分块大小，但不小于最小分块大小，不大于最大分块大小
        long chunkSize = fileSize / config.getMaxThreadCount();
        return Math.max(config.getMinChunkSize(), Math.min(chunkSize, config.getMaxChunkSize()));
    }

    /**
     * 计算实际需要的线程数
     */
    private int calculateThreadCount(long fileSize, long chunkSize) {
        if (chunkSize <= 0) {
            return 1;
        }

        int threadCount = (int) (fileSize / chunkSize);
        if (fileSize % chunkSize != 0) {
            threadCount++;
        }

        return Math.min(threadCount, config.getMaxThreadCount());
    }

    /**
     * 获取分块文件
     */
    private File getChunkFile(File tempDir, String fileName, int index) {
        return new File(tempDir, fileName + ".part" + index);
    }

    /**
     * 合并分块文件
     */
    private void mergeChunks(File tempDir, File targetFile, int threadCount) throws Exception {
        try (FileChannel targetChannel = FileChannel.open(
                targetFile.toPath(),
                StandardOpenOption.CREATE,
                StandardOpenOption.WRITE)) {

            for (int i = 0; i < threadCount; i++) {
                File chunkFile = getChunkFile(tempDir, targetFile.getName(), i);
                if (!chunkFile.exists() || chunkFile.length() == 0) {
                    continue;
                }

                try (FileChannel chunkChannel = FileChannel.open(
                        chunkFile.toPath(),
                        StandardOpenOption.READ)) {

                    chunkChannel.transferTo(0, chunkChannel.size(), targetChannel);
                }
            }
        }
    }

    /**
     * 清理临时文件
     */
    private void cleanTempFiles(File tempDir, String fileName, int threadCount) {
        for (int i = 0; i < threadCount; i++) {
            File chunkFile = getChunkFile(tempDir, fileName, i);
            if (chunkFile.exists()) {
                chunkFile.delete();
            }
        }
    }

    /**
     * 获取当前下载进度
     */
    private int getProgress() {
        if (fileTotalSize <= 0) {
            return 0;
        }
        return (int) (totalDownloaded.get() * 100 / fileTotalSize);
    }

    /**
     * 通知监听器
     */
    private void notifyListener(DownloadStatus status, int progress, String message) {
        if (listener != null) {
            // 计算当前速度（最近一段时间的平均速度）
            long currentTime = System.currentTimeMillis();
            long elapsedTime = currentTime - startTime;
            double currentSpeed = 0;

            if (elapsedTime > 0) {
                currentSpeed = (totalDownloaded.get() * 1000.0) / elapsedTime;
            }

            listener.onStatusChanged(status, progress, message, currentSpeed);
        }
    }

    /**
     * 下载任务
     */
    private class DownloadTask implements Runnable {
        private final String fileUrl;
        private final File chunkFile;
        private final long start;
        private final long end;

        public DownloadTask(String fileUrl, File chunkFile, long start, long end) {
            this.fileUrl = fileUrl;
            this.chunkFile = chunkFile;
            this.start = start;
            this.end = end;
        }

        @Override
        public void run() {
            if (cancelled) {
                return;
            }

            HttpURLConnection connection = null;
            InputStream in = null;
            OutputStream out = null;

            try {
                URL url = new URL(fileUrl);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setConnectTimeout(config.getConnectTimeout());
                connection.setReadTimeout(config.getReadTimeout());
                connection.setRequestProperty("User-Agent", config.getUserAgent());
                connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
                connection.connect();

                int responseCode = connection.getResponseCode();
                if (responseCode != HttpURLConnection.HTTP_PARTIAL &&
                        responseCode != HttpURLConnection.HTTP_OK) {
                    throw new IOException("服务器不支持断点续传，响应码: " + responseCode);
                }

                in = connection.getInputStream();

                // 以追加模式写入，支持断点续传
                out = new BufferedOutputStream(
                        Files.newOutputStream(chunkFile.toPath(),
                                StandardOpenOption.CREATE,
                                StandardOpenOption.APPEND));

                byte[] buffer = new byte[config.getBufferSize()];
                int bytesRead;
                long bytesDownloadedInThisChunk = 0;

                while ((bytesRead = in.read(buffer)) != -1) {
                    if (cancelled) {
                        return;
                    }

                    out.write(buffer, 0, bytesRead);
                    bytesDownloadedInThisChunk += bytesRead;
                    totalDownloaded.addAndGet(bytesRead);

                    // 计算当前速度
                    long currentTime = System.currentTimeMillis();
                    long elapsedTime = currentTime - startTime;
                    double currentSpeed = 0;
                    if (elapsedTime > 0) {
                        currentSpeed = (totalDownloaded.get() * 1000.0) / elapsedTime;
                    }

                    // 通知进度更新，包含当前速度
                    String speedInfo = currentSpeed > 0 ?
                            String.format("，速度: %s/s", formatFileSize((long) currentSpeed)) : "";

                    notifyListener(DownloadStatus.DOWNLOADING, getProgress(),
                            String.format("已下载: %s/%s%s",
                                    formatFileSize(totalDownloaded.get()),
                                    formatFileSize(fileTotalSize),
                                    speedInfo));
                }

                // 验证下载的分块大小是否正确
                if (bytesDownloadedInThisChunk != (end - start + 1)) {
                    throw new IOException("分块下载不完整，预期: " + (end - start + 1) +
                            "，实际: " + bytesDownloadedInThisChunk);
                }

            } catch (Exception e) {
                if (!cancelled) {
                    notifyListener(DownloadStatus.FAILED, getProgress(),
                            "线程下载出错: " + e.getMessage());
                    throw new RuntimeException(e);
                }
            } finally {
                try {
                    if (out != null) out.close();
                    if (in != null) in.close();
                    if (connection != null) connection.disconnect();
                } catch (IOException e) {
                    // 忽略关闭时的异常
                }
            }
        }
    }

    /**
     * 格式化文件大小为人类可读形式
     */
    private String formatFileSize(long size) {
        if (size <= 0) return "0 B";
        final String[] units = {"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
        return String.format("%.2f %s", size / Math.pow(1024, digitGroups), units[digitGroups]);
    }

    /**
     * 下载状态枚举
     */
    public enum DownloadStatus {
        STARTED, DOWNLOADING, PAUSED, CANCELLED, COMPLETED, FAILED
    }

    /**
     * 下载监听器接口，增加当前速度参数
     */
    public interface DownloadListener {
        /**
         * 状态变化回调
         *
         * @param status       下载状态
         * @param progress     进度(0-100)
         * @param message      状态消息
         * @param currentSpeed 当前速度(字节/秒)
         */
        void onStatusChanged(DownloadStatus status, int progress, String message, double currentSpeed);
    }

    /**
     * 下载配置类
     */
    public static class DownloadConfig {
        // 默认配置
        private static final int DEFAULT_MAX_THREAD_COUNT = 5;
        private static final long DEFAULT_MIN_CHUNK_SIZE = 1024 * 1024; // 1MB
        private static final long DEFAULT_MAX_CHUNK_SIZE = 10 * 1024 * 1024; // 10MB
        private static final int DEFAULT_BUFFER_SIZE = 8192; // 8KB
        private static final int DEFAULT_CONNECT_TIMEOUT = 10000; // 10秒
        private static final int DEFAULT_READ_TIMEOUT = 30000; // 30秒
        private static final String DEFAULT_USER_AGENT = "MultiThreadDownloader/1.0";
        private static final String DEFAULT_TEMP_DIR = System.getProperty("java.io.tmpdir") + File.separator + "downloads";

        private int maxThreadCount = DEFAULT_MAX_THREAD_COUNT;
        private long minChunkSize = DEFAULT_MIN_CHUNK_SIZE;
        private long maxChunkSize = DEFAULT_MAX_CHUNK_SIZE;
        private int bufferSize = DEFAULT_BUFFER_SIZE;
        private int connectTimeout = DEFAULT_CONNECT_TIMEOUT;
        private int readTimeout = DEFAULT_READ_TIMEOUT;
        private String userAgent = DEFAULT_USER_AGENT;
        private String tempDir = DEFAULT_TEMP_DIR;

        // Getters and Setters
        public int getMaxThreadCount() {
            return maxThreadCount;
        }

        public void setMaxThreadCount(int maxThreadCount) {
            this.maxThreadCount = maxThreadCount;
        }

        public long getMinChunkSize() {
            return minChunkSize;
        }

        public void setMinChunkSize(long minChunkSize) {
            this.minChunkSize = minChunkSize;
        }

        public long getMaxChunkSize() {
            return maxChunkSize;
        }

        public void setMaxChunkSize(long maxChunkSize) {
            this.maxChunkSize = maxChunkSize;
        }

        public int getBufferSize() {
            return bufferSize;
        }

        public void setBufferSize(int bufferSize) {
            this.bufferSize = bufferSize;
        }

        public int getConnectTimeout() {
            return connectTimeout;
        }

        public void setConnectTimeout(int connectTimeout) {
            this.connectTimeout = connectTimeout;
        }

        public int getReadTimeout() {
            return readTimeout;
        }

        public void setReadTimeout(int readTimeout) {
            this.readTimeout = readTimeout;
        }

        public String getUserAgent() {
            return userAgent;
        }

        public void setUserAgent(String userAgent) {
            this.userAgent = userAgent;
        }

        public String getTempDir() {
            return tempDir;
        }

        public void setTempDir(String tempDir) {
            this.tempDir = tempDir;
        }
    }

    /**
     * 下载结果类，包含下载耗时等详细信息
     */
    public static class DownloadResult {
        private String fileUrl;
        private String savePath;
        private boolean success;
        private DownloadStatus status;
        private String message;
        private long fileSize; // 文件总大小(字节)
        private long downloadedSize; // 已下载大小(字节)
        private long startTime; // 开始时间(毫秒)
        private long endTime; // 结束时间(毫秒)
        private long duration; // 耗时(毫秒)
        private double averageSpeed; // 平均速度(字节/秒)

        // Getters and Setters
        public String getFileUrl() {
            return fileUrl;
        }

        public void setFileUrl(String fileUrl) {
            this.fileUrl = fileUrl;
        }

        public String getSavePath() {
            return savePath;
        }

        public void setSavePath(String savePath) {
            this.savePath = savePath;
        }

        public boolean isSuccess() {
            return success;
        }

        public void setSuccess(boolean success) {
            this.success = success;
        }

        public DownloadStatus getStatus() {
            return status;
        }

        public void setStatus(DownloadStatus status) {
            this.status = status;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public long getFileSize() {
            return fileSize;
        }

        public void setFileSize(long fileSize) {
            this.fileSize = fileSize;
        }

        public long getDownloadedSize() {
            return downloadedSize;
        }

        public void setDownloadedSize(long downloadedSize) {
            this.downloadedSize = downloadedSize;
        }

        public long getStartTime() {
            return startTime;
        }

        public void setStartTime(long startTime) {
            this.startTime = startTime;
        }

        public long getEndTime() {
            return endTime;
        }

        public void setEndTime(long endTime) {
            this.endTime = endTime;
        }

        public long getDuration() {
            return duration;
        }

        public void setDuration(long duration) {
            this.duration = duration;
        }

        public double getAverageSpeed() {
            return averageSpeed;
        }

        public void setAverageSpeed(double averageSpeed) {
            this.averageSpeed = averageSpeed;
        }

        @Override
        public String toString() {
            return String.format("DownloadResult{url='%s', path='%s', success=%s, status=%s, duration=%s, avgSpeed=%s/s}",
                    fileUrl, savePath, success, status, formatDuration(duration),
                    formatFileSize((long) averageSpeed));
        }

        private String formatDuration(long durationMs) {
            if (durationMs <= 0) return "0ms";

            long seconds = durationMs / 1000;
            long minutes = seconds / 60;
            long hours = minutes / 60;

            if (hours > 0) {
                return String.format("%d时%d分%d秒", hours, minutes % 60, seconds % 60);
            } else if (minutes > 0) {
                return String.format("%d分%d秒", minutes, seconds % 60);
            } else {
                return String.format("%d秒", seconds);
            }
        }

        private String formatFileSize(long size) {
            if (size <= 0) return "0 B";
            final String[] units = {"B", "KB", "MB", "GB", "TB"};
            int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
            return String.format("%.2f %s", size / Math.pow(1024, digitGroups), units[digitGroups]);
        }
    }

    // 使用示例
    public static void main(String[] args) {
        try {
            // 创建配置
            DownloadConfig config = new DownloadConfig();
            config.setMaxThreadCount(5); // 设置最大线程数
            config.setMinChunkSize(1024 * 1024); // 1MB
            config.setMaxChunkSize(10 * 1024 * 1024); // 10MB
            config.setConnectTimeout(15000); // 15秒连接超时
            config.setReadTimeout(60000); // 60秒读取超时

            // 创建下载器
            MultiThreadDownloader downloader = new MultiThreadDownloader(config);

            // 设置监听器
            downloader.setDownloadListener((status, progress, message, currentSpeed) -> {
                String speedStr = currentSpeed > 0 ?
                        String.format("，当前速度: %s/s", downloader.formatFileSize((long) currentSpeed)) : "";
                System.out.printf("[%s] 进度: %d%% - %s%s%n", status, progress, message, speedStr);
            });

            // 开始下载
            String fileUrl = "https://noaa-gfs-bdp-pds.s3.amazonaws.com/gfs.20210901/00/atmos/gfs.t00z.pgrb2.0p25.f064"; // 替换为实际的文件URL
            String savePath = "/Users/matt/Downloads/demo/20210901_gfs.t00z.pgrb2.0p25.f064"; // 替换为实际的保存路径

            DownloadResult result = downloader.download(fileUrl, savePath);
            System.out.println("下载结果: " + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}