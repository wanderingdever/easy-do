package com.easy.apiClient;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.Arrays;
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
public class ClientApplication {

    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        SpringApplication app = new SpringApplication(ClientApplication.class);
        app.setApplicationStartup(new BufferingApplicationStartup(2048));
        app.setBannerMode(Banner.Mode.OFF);
        ConfigurableApplicationContext run = app.run(args);

        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        String logo = """
                PROFILE: %s
                SERVER PORT: %s
                """;
        log.error("\n{}", String.format(logo, Arrays.toString(env.getActiveProfiles()), severPort));
    }
}