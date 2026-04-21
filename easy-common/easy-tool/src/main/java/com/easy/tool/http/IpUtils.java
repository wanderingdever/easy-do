package com.easy.tool.http;


import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.lionsoul.ip2region.xdb.Searcher;

import java.io.InputStream;
import java.net.*;
import java.util.Enumeration;

/**
 * </p>
 *
 * @author Matt
 */
public class IpUtils {
    /**
     * 字符常量0
     */
    private static final String ZERO = "0";
    /**
     * 本级ip
     */
    private static final String LOCALHOST = "127.0.0.1";

    /**
     * 获取客户端的IP地址
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (LOCALHOST.equals(ipAddress)) {
                // 根据网卡取本机配置的IP
                InetAddress inet = null;
                try {
                    inet = InetAddress.getLocalHost();
                    ipAddress = inet.getHostAddress();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
            }
        }
        // 对于通过多个代理转发的情况，取第一个非unknown的IP地址。
        // 这里假设第一个IP为真实IP，后面的为代理IP。
        if (ipAddress != null && ipAddress.length() > 15) {
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 根据iP获取归属地信息
     *
     * @return
     */
    public static IpLocation getLocation(String ip) {
        IpLocation location = new IpLocation();
        location.setIp(ip);
        try (InputStream inputStream = IpUtils.class.getResourceAsStream("/ip2region.xdb");) {
            byte[] bytes = IoUtil.readBytes(inputStream);
            Searcher searcher = Searcher.newWithBuffer(bytes);
            String region = searcher.search(ip);
            if (StrUtil.isAllNotBlank(region)) {
                // xdb返回格式 国家|区域|省份|城市|ISP，
                // 只有中国的数据绝大部分精确到了城市，其他国家部分数据只能定位到国家，后前的选项全部是0
                String[] result = region.split("\\|");
                location.setCountry(ZERO.equals(result[0]) ? StrUtil.EMPTY : result[0]);
                location.setProvince(ZERO.equals(result[2]) ? StrUtil.EMPTY : result[2]);
                location.setCity(ZERO.equals(result[3]) ? StrUtil.EMPTY : result[3]);
                location.setIsp(ZERO.equals(result[4]) ? StrUtil.EMPTY : result[4]);
            }
            searcher.close();
        } catch (Exception e) {
            return location;
        }
        return location;
    }

    public static IpLocation getLocation(HttpServletRequest request) {
        String ipAddress = getIpAddress(request);
        return getLocation(ipAddress);
    }

    /**
     * 获取真实的本机IP地址（排除虚拟网卡等）
     */
    public static String getRealLocalIpAddress() {
        try (DatagramSocket socket = new DatagramSocket()) {
            // 随便填一个公网IP，这里用Google的DNS。端口随便填。
            // 注意：因为 UDP 是无连接的，这行代码并不会真正发送网络包！
            // 它的作用是让操作系统的路由表去计算：“如果要访问 8.8.8.8，我应该用哪张网卡的哪个IP？”
            socket.connect(InetAddress.getByName("8.8.8.8"), 10000);

            // 拿到操作系统选出来的那个“天选IP”
            String localIp = socket.getLocalAddress().getHostAddress();

            // 兜底：如果是回环地址，或者全0地址，可能是在纯断网/无网卡环境下，再去走老逻辑
            if (!"127.0.0.1".equals(localIp) && !"0.0.0.0".equals(localIp)) {
                return localIp;
            }
        } catch (Exception e) {
            // 忽略异常，降级走到常规遍历网卡的兜底方案
        }

        // 降级：如果连UDP都失败了，走加强版的网卡遍历逻辑
        return getFallbackLocalIp();
    }

    /**
     * 强力过滤版：遍历网卡获取本地IP
     */
    public static String getFallbackLocalIp() {
        try {
            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            String candidateIp = null;

            while (interfaces.hasMoreElements()) {
                NetworkInterface networkInterface = interfaces.nextElement();
                String name = networkInterface.getName().toLowerCase();
                String displayName = networkInterface.getDisplayName().toLowerCase();

                // 核心拦截器：跳过回环、未启动、以及常见的虚拟网卡关键字！
                if (networkInterface.isLoopback() || !networkInterface.isUp()
                        || name.contains("docker") || displayName.contains("docker")
                        || name.contains("vmware") || displayName.contains("vmware")
                        || name.contains("vbox") || displayName.contains("virtual")
                        || name.contains("wsl") || displayName.contains("hyper")
                        || name.contains("tailscale") || name.contains("tun")) {
                    continue;
                }

                Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress address = addresses.nextElement();

                    // 只处理 IPv4，且不是回环地址 127.x.x.x
                    if (address instanceof Inet4Address && !address.isLoopbackAddress()) {

                        // 过滤掉 169.254.x.x 这种 Windows 分配不到IP时的私有保留地址
                        if (address.isLinkLocalAddress()) {
                            continue;
                        }

                        // isSiteLocalAddress 意味着这是一个局域网IP (10.x.x.x, 172.16.x.x, 192.168.x.x)
                        // 优先返回这个！
                        if (address.isSiteLocalAddress()) {
                            return address.getHostAddress();
                        }

                        // 记录一下候选IP（万一是公网IP呢），如果没有SiteLocalIP，最后兜底用它
                        candidateIp = address.getHostAddress();
                    }
                }
            }

            // 如果没找到局域网IP，看看有没有其他候选IP
            if (candidateIp != null) {
                return candidateIp;
            }

            return InetAddress.getLocalHost().getHostAddress();
        } catch (Exception e) {
            return "127.0.0.1";
        }
    }
}