package com.easy.server;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;
import org.springframework.context.***REMOVE_SECRET***;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.TimeZone;

/**
 * 启动
 * </p>
 *
 * @author Matt
 */
@SpringBootApplication(scanBasePackages = {"com.easy"})
@EnableAsync
@EnableScheduling
@Slf4j
public class ServerApplication {

    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        SpringApplication app = new SpringApplication(ServerApplication.class);
        app.setApplicationStartup(new BufferingApplicationStartup(2048));
        ***REMOVE_SECRET*** run = app.run(args);
        String logo = """
                ███████╗████████╗ █████╗ ██████╗ ████████╗
                ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
                ███████╗   ██║   ███████║██████╔╝   ██║
                ╚════██║   ██║   ██╔══██║██╔══██╗   ██║
                ███████║   ██║   ██║  ██║██║  ██║   ██║
                ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝
                """;
        log.error("\n{}", logo);
    }
}