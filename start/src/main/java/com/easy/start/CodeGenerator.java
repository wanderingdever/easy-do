package com.easy.start;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.easy.core.bean.base.BaseIdEntity;

import java.nio.file.Paths;

/**
 * </p>
 *
 * @author Matt
 */
public class CodeGenerator {

    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://192.168.5.111:3124/easy_do_cloud?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useSSL=false&allowPublicKeyRetrieval=true", "xc_dev", "E7F@oFw2Ks")
                .globalConfig(builder -> builder
                        .author("Matt")
                        .enableSpringdoc()
                        .disableOpenDir()
                        .dateType(DateType.TIME_PACK) // 设置时间类型策略
                        .outputDir(Paths.get(System.getProperty("user.dir")) + "/gen")
                        .commentDate("yyyy-MM-dd")
                        .disableServiceInterface()
                )
                .packageConfig(builder -> builder
                        .parent("com.easy.start")
                        .moduleName("start")
                        .entity("bean")
                        .mapper("dao")
                        .serviceImpl("service")
                        .controller("")
                        .xml("mapper")
                )
                .strategyConfig(builder -> builder
                        .addInclude("sys_config")
                        .addTablePrefix("sys_")
                        .entityBuilder()
                        .disableSerialVersionUID()
                        .superClass(BaseIdEntity.class)
                        .enableTableFieldAnnotation()
                        .enableLombok()
                        .serviceBuilder().disableService()
                )
                // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}