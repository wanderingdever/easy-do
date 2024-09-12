package com.easy.auth.enums;

import cn.dev33.satoken.exception.NotLoginException;
import com.easy.utils.enums.EnumInterface;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum SaTokenException implements EnumInterface<Integer> {


    NOT_TOKEN(11011, NotLoginException.NOT_TOKEN_MESSAGE),
    INVALID_TOKEN(11012, NotLoginException.INVALID_TOKEN_MESSAGE),
    TOKEN_TIMEOUT(11013, NotLoginException.TOKEN_TIMEOUT_MESSAGE),
    BE_REPLACED(11014, NotLoginException.BE_REPLACED_MESSAGE),
    KICK_OUT(11015, NotLoginException.KICK_OUT_MESSAGE),
    TOKEN_FREEZE(11016, NotLoginException.TOKEN_FREEZE_MESSAGE),
    NO_PREFIX(11017, NotLoginException.NO_PREFIX_MESSAGE),
    ;

    private final Integer code;

    private final String introduction;

}