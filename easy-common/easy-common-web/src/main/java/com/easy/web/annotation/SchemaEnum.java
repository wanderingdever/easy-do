package com.easy.web.annotation;


import com.easy.core.enums.EnumInterface;

import java.lang.annotation.*;

/**
 * <p>枚举文档注解</p>
 * <p>可将枚举属性展示在 swagger 文档上</p>
 * <p>使用 Integer 与 Enum 等类型接收参数时，传参如果不符合类型，会导致反序列化失败，所以建议使用 String 接收参数</p>
 * <p>接收参数后可使用 {@link EnumUtils#getByClass(Object, Class) XEnumUtils.getByClass()} 将参数转换为所需枚举</p>
 *
 * @author 小徐
 * @since 2022/12/9 11:42
 */
@Target({ElementType.FIELD, ElementType.CONSTRUCTOR, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SchemaEnum {

    /* 文档与校验公用参数 */

    /**
     * 支持的枚举类列表，支持多个枚举同时展示，需继承{@link EnumInterface EnumInterface}
     */
    Class<? extends Enum<? extends EnumInterface<?>>> clazz();
}