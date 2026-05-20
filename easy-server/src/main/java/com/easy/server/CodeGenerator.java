package com.easy.server;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.easy.core.base.BaseEntity;
import org.apache.ibatis.annotations.Mapper;

import java.nio.file.Paths;
import java.sql.Types;

/**
 * </p>
 *
 * @author Matt
 */
public class CodeGenerator {

    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://192.168.1.111:3124/easy_boot?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useSSL=false&allowPublicKeyRetrieval=true", "xc_dev", "E7F@oFw2Ks")
                .globalConfig(builder -> builder
                        .author("Matt")
                        .enableSpringdoc()
                        .disableOpenDir()
                        .dateType(DateType.TIME_PACK) // 设置时间类型策略
                        .outputDir(Paths.get(System.getProperty("user.dir")) + "/easy-start/src/main/java")
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
                .dataSourceConfig(builder ->
                        builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                            int typeCode = metaInfo.getJdbcType().TYPE_CODE;
                            if (typeCode == Types.TINYINT) {
                                // 自定义类型转换
                                return DbColumnType.INTEGER;
                            }
                            if (typeCode == Types.BIGINT) {
                                return DbColumnType.STRING;
                            }
                            return typeRegistry.getColumnType(metaInfo);
                        })
                )
                .strategyConfig(builder -> builder
                        .addInclude("sys_user", "sys_user_info", "sys_user_org", "sys_user_role", "sys_user_wechat", "sys_role_menu", "sys_login_logs")
                        .addTablePrefix("")
                        .entityBuilder().disableSerialVersionUID().superClass(BaseEntity.class)
                        .enableTableFieldAnnotation()
                        .enableLombok()
                        .mapperBuilder().disableMapperXml().mapperAnnotation(Mapper.class)
                        .serviceBuilder().disableService().formatServiceImplFileName("%sService")
                        .controllerBuilder().disable()
                )
                // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}