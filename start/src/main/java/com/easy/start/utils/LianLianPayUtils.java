package com.easy.start.utils;

import com.easy.start.config.LianLianPayConfig;
import com.easy.utils.crypto.SecureUtils;
import org.dromara.hutool.core.codec.binary.Base64;
import org.dromara.hutool.crypto.SignUtil;
import org.dromara.hutool.crypto.asymmetric.SignAlgorithm;

/**
 * 连连支付工具类
 * </p>
 *
 * @author Matt
 */
public class LianLianPayUtils {

    /**
     * 连连支付MD5withRSA签名
     *
     * @param signStr 待签名字符串
     */
    public static String signMd5withRsa(String signStr) {
        String md5 = SecureUtils.md5(signStr);
        byte[] sign = SignUtil.sign(SignAlgorithm.MD5withRSA, LianLianPayConfig.getPrivateKey(), LianLianPayConfig.getPublicKey()).sign(md5);
        return Base64.encode(sign);
    }

    /**
     * 连连支付验签
     */
    public static boolean verify(String data, String sign) {
        // 加密md5
        String md5 = SecureUtils.md5(data);
        // 解密签名
        byte[] decodeSign = Base64.decode(sign);
        return SignUtil.sign(SignAlgorithm.MD5withRSA, LianLianPayConfig.getPrivateKey(), LianLianPayConfig.getPublicKey()).verify(md5.getBytes(), decodeSign);
    }
}