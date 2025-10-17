package com.easy.core.exception;


import com.easy.core.base.R;
import com.easy.core.enums.EnumInterface;
import lombok.Getter;

/**
 * 自定义异常
 * </p>
 *
 * @author Matt
 */
@Getter
public class CustomizeException extends RuntimeException {

    private final R<String> result;


    public <E extends Enum<E> & EnumInterface<V>, V> CustomizeException(E rEnum) {
        super(rEnum.getIntroduction());
        this.result = R.fail(rEnum);
    }

    public CustomizeException(int code, String message) {
        super(message);
        this.result = R.fail(code, message);
    }

    public CustomizeException(String message) {
        super(message);
        this.result = R.fail(message);
    }

}