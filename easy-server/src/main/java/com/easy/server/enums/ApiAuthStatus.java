package com.easy.server.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * api证书授权状态
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum ApiAuthStatus {


    PENDING(0, "待审核"),
    AUTHORIZED(1, "已授权"),
    REVOKE(-8, "撤销"),
    REJECT(-9, "驳回");

    @EnumValue
    private final Integer value;
    private final String desc;
}