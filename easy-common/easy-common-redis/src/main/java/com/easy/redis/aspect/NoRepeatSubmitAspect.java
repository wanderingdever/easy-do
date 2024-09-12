package com.easy.redis.aspect;

import com.easy.core.constant.Constants;
import com.easy.core.enums.REnum;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.annotation.RepeatSubmit;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.utils.http.IpUtils;
import com.easy.utils.json.JacksonUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.dromara.hutool.crypto.digest.DigestUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.reflect.Method;
import java.time.Duration;
import java.util.Objects;


/**
 * 防止重复提交切面
 * </p>
 *
 * @author Matt
 */
@Component
@Aspect
public class NoRepeatSubmitAspect {

    /**
     * 定义切点
     */
    @Pointcut("@annotation(com.easy.redis.annotation.RepeatSubmit)")
    public void preventDuplication() {
    }

    @Around("preventDuplication()")
    public Object around(ProceedingJoinPoint joinPoint) {
        // 获取请求信息
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        HttpServletRequest request = null;
        if (attributes != null) {
            request = attributes.getRequest();
        }
        // 获取执行方法
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        // 获取防重复提交注解
        RepeatSubmit annotation = method.getAnnotation(RepeatSubmit.class);
        // 获取token以及方法标记，生成redisKey和redisValue
        if (request == null) {
            throw new CustomizeException(REnum.RUNTIME_EXCEPTION);
        }
        // FIXME 前端需要生成浏览器指纹放入请求头中
        String machineCode = request.getHeader(Constants.MACHINE_CODE);
        String ip = IpUtils.getIpAddress(request);
        String url = request.getRequestURI();
        // 通过前缀 + url + token + 函数参数签名 来生成redis上的 key
        String redisKey = RedisConstants.REPEAT_SUBMIT
                .concat(url)
                .concat(machineCode)
                .concat(getMethodSign(method, joinPoint.getArgs()));
        // 这个值只是为了标记，不重要
        String redisValue = redisKey.concat("submit duplication");
        if (!RedisUtils.hasKey(redisKey)) {
            // 设置防重复操作限时标记（前置通知）
            RedisUtils.setCacheObject(redisKey, redisValue, Duration.ofMillis(annotation.interval()));
            try {
                // 正常执行方法并返回
                // ProceedingJoinPoint类型参数可以决定是否执行目标方法，
                // 且环绕通知必须要有返回值，返回值即为目标方法的返回值
                return joinPoint.proceed();
            } catch (Throwable throwable) {
                // 确保方法执行异常实时释放限时标记(异常后置通知)
                RedisUtils.deleteObject(redisKey);
                throw new RuntimeException(throwable);
            }
        } else {
            throw new CustomizeException(REnum.DUPLICATE_SUBMIT);
        }


    }

    /**
     * 生成方法标记：采用数字签名算法SHA1对方法签名字符串加签
     *
     * @param method 方法
     * @param args   参数
     * @return String
     */
    private String getMethodSign(Method method, Object... args) {
        StringBuilder sb = new StringBuilder(method.toString());
        for (Object arg : args) {
            sb.append(toString(arg));
        }
        return DigestUtil.sha1Hex(sb.toString());
    }

    private String toString(Object arg) {
        if (Objects.isNull(arg)) {
            return "null";
        }
        if (arg instanceof Number) {
            return arg.toString();
        }
        return JacksonUtils.toJsonString(arg);
    }
}