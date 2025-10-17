package com.easy.core.base;

import com.easy.core.enums.EnumInterface;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.validation.ObjectError;

/**
 * 响应类
 *
 * @author 小徐
 */
@Data
@AllArgsConstructor
@Schema(description = "响应类")
public class R<T> {
    /**
     * 成功
     */
    public static final int SUCCESS = 200;
    public static final String SUCCESS_MSG = "success";

    public static final int ERROR = 500;
    public static final String ERROR_MSG = "error";

    /**
     * 失败
     */
    public static final int FAIL = 500;

    @Schema(description = "返回编码", example = "200")
    public int code;

    @Schema(description = "返回消息", example = "success")
    private String msg;

    @Schema(description = "响应参数 data")
    private T data;

    public R() {
    }

    public R(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static <T> R<T> success() {
        return success(null);
    }

    public static <T> R<T> success(T t) {
        R<T> r = new R<>(SUCCESS, SUCCESS_MSG);
        r.setData(t);
        return r;
    }

    public static <T> R<T> fail(int code, String msg) {
        R<T> r = new R<>();
        r.setCode(code);
        r.setMsg(msg);
        return r;
    }

    public static <T> R<T> fail(String msg) {
        R<T> r = new R<>(ERROR, ERROR_MSG);
        r.setMsg(msg);
        return r;
    }

    public static <E extends Enum<E> & EnumInterface<V>, V, T> R<T> fail(E rEnum) {
        R<T> r = new R<>();
        r.setCode(Integer.parseInt(rEnum.getCode().toString()));
        r.setMsg(rEnum.getIntroduction());
        return r;
    }

    public static <T> R<T> fail(ObjectError objectError) {
        R<T> r = new R<>(ERROR, ERROR_MSG);
        r.setMsg(objectError.getDefaultMessage());
        return r;
    }
}