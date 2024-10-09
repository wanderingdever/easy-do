package com.easy.start;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.easy.core.bean.base.BaseEntity;
import org.apache.ibatis.annotations.Mapper;

import java.nio.file.Paths;

/**
 * </p>
 *
 * @author Matt
 */
public class CodeGenerator {

    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://192.168.5.111:3124/lianlian_pay?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useSSL=false&allowPublicKeyRetrieval=true", "xc_dev", "E7F@oFw2Ks")
                .globalConfig(builder -> builder
                        .author("Matt")
                        .enableSpringdoc()
                        .disableOpenDir()
                        .dateType(DateType.TIME_PACK) // 设置时间类型策略
                        .outputDir(Paths.get(System.getProperty("user.dir")) + "/start/src/main/java")
                        // .outputDir(Paths.get(System.getProperty("user.dir")) + "/gen")
                        .commentDate("yyyy-MM-dd")
                        .disableServiceInterface()
                )
                .packageConfig(builder -> builder
                        .parent("com.easy.start")
                        .entity("bean.entity")
                        .mapper("dao")
                        .serviceImpl("service")
                        .controller("")
                        .xml("mapper")
                )
                .strategyConfig(builder -> builder
                        .addInclude("lianlian_pay_user_bank")
                        .addTablePrefix("lianlian_")
                        .entityBuilder().disableSerialVersionUID().superClass(BaseEntity.class).enableTableFieldAnnotation().enableLombok()
                        .mapperBuilder().disableMapperXml().mapperAnnotation(Mapper.class)
                        .serviceBuilder().disableService().formatServiceImplFileName("%sService")
                        .controllerBuilder().disable()
                )
                // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}