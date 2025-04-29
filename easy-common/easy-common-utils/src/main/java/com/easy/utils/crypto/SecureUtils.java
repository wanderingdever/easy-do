package com.easy.utils.crypto;

import cn.hutool.core.codec.Base64;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.SmUtil;
import cn.hutool.crypto.symmetric.SymmetricCrypto;

import java.nio.charset.StandardCharsets;

/*
 * 加密解密工具
 * </p>
 *
 * @author Matt
 */
public class SecureUtils extends SecureUtil {

    private final static String PHONE_SM4_KEY = "2J5zadozy/JENzozCjx1xg==";

    private final static SymmetricCrypto PHONE_SM4 = SmUtil.sm4(Base64.decode(PHONE_SM4_KEY));

    /**
     * 生成sm4密钥并进行base64加密
     */
    public static String generateSm4Key() {
        return Base64.encode(generateKey("SM4").getEncoded());
    }

    /**
     * sm4加密
     *
     * @param data 明文
     */
    public static String sm4PhoneEncrypt(String data) {
        return PHONE_SM4.encryptHex(data);
    }

    /**
     * sm4解密
     *
     * @param data 密文
     * @return 明文
     */
    public static String sm4PhoneDecrypt(String data) {
        return PHONE_SM4.decryptStr(data, StandardCharsets.UTF_8);
    }
}