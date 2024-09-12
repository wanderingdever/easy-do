package com.easy.start.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 性别枚举
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum Sex {

    /**
     * 性别
     */
    FEMALE(0, "女"),
    MALE(1, "男"),
    OTHER(3, "其他");

    @EnumValue
    private final Integer code;
    private final String name;

}