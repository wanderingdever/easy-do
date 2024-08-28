package com.easy.web.config;

import io.undertow.server.DefaultByteBufferPool;
import io.undertow.websockets.jsr.WebSocketDeploymentInfo;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.web.embedded.undertow.***REMOVE_SECRET***;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;

/**
 * Undertow 自定义配置
 *
 * @author matt
 */
@AutoConfiguration
public class UndertowConfig implements WebServerFactoryCustomizer<***REMOVE_SECRET***> {

    /**
     * 设置 Undertow 的 websocket 缓冲池
     */
    @Override
    public void customize(***REMOVE_SECRET*** factory) {
        // 默认不直接分配内存 如果项目中使用了 websocket 建议直接分配
        factory.addDeploymentInfoCustomizers(deploymentInfo -> {
            WebSocketDeploymentInfo webSocketDeploymentInfo = new WebSocketDeploymentInfo();
            webSocketDeploymentInfo.setBuffers(new DefaultByteBufferPool(false, 512));
            deploymentInfo.addServletContextAttribute("io.undertow.websockets.jsr.WebSocketDeploymentInfo", webSocketDeploymentInfo);
        });
    }

}