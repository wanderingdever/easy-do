package com.easy.api.client.utils;

import cn.hutool.core.codec.Base64;
import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.SmUtil;
import cn.hutool.crypto.asymmetric.SM2;
import cn.hutool.crypto.symmetric.AES;
import cn.hutool.crypto.symmetric.SymmetricAlgorithm;
import com.easy.tool.crypto.SecureUtils;
import com.easy.tool.lang.IdUtils;
import org.bouncycastle.util.Strings;
import org.bouncycastle.util.encoders.Hex;


/**
 * 签名工具
 * </p>
 *
 * @author Matt
 */
public class ApiSignUtils {

    /**
     * TOKEN是SHA1生成16位小写签名串。将AppSecret参数拼接到timestamp头部、randomStr拼接到timestamp参数字符串尾部,SHA1加密后格式是示例：SHA1(AppSecret+timestamp+randomStr)。
     *
     * @param timestamp 时间戳
     * @param randomStr 随机字符串
     * @return token
     */
    public static String generateToken(String appid, Long timestamp, String randomStr) {
        return SecureUtils.sha1().digestHex(appid + timestamp + randomStr).toLowerCase();
    }

    /**
     * 验证签名
     *
     * @param appid        应用ID
     * @param timestamp    时间戳
     * @param randomStr    随机字符串
     * @param receivedSign 接收到的签名
     * @return 验证结果
     */
    public static boolean verifyToken(String appid, Long timestamp, String randomStr, String receivedSign) {
        // 生成签名
        String generatedSign = generateToken(appid, timestamp, randomStr);
        // 比较生成的签名和接收到的签名
        return generatedSign.equals(receivedSign);
    }

    /**
     * 公共参数 reqParams
     * reqParamter:{"APPID": "5T6U3BU78COS897", "TIMESTAMP": 1584502672530, "RANDOMSTR": "L58Ece1W", "TOKEN": "***REMOVE_SECRET***"}
     * TOKEN是SHA1生成16位小写签名串。将AppSecret参数拼接到timestamp头部、randomStr拼接到timestamp参数字符串尾部,SHA1加密后格式是示例：SHA1(AppSecret+timestamp+randomStr)。
     */
    public static String generateReqParams(String appid) {
        long timestamp = System.currentTimeMillis();
        String randomStr = IdUtils.generateCode(8);
        return "{\"APPID\":\"" + appid + "\",\"TIMESTAMP\":" + timestamp + ",\"RANDOMSTR\":\"" + randomStr + "\",\"TOKEN\":\"" + generateToken(appid, timestamp, randomStr) + "\"}";
    }

    /**
     * 加密业务参数bizParameter
     * <p>
     * 使用SM2非对称加密算法对业务参数进行加密，其中私钥privateKey和公钥publicKey是SM2算法的密钥对。
     *
     * @param privateKey sm2私钥
     * @param publicKey  sm2公钥
     * @param data       业务参数
     */
    public static String encryptBizParameter(String privateKey, String publicKey, String data) {
        byte[] msg = Strings.toUTF8ByteArray(data);
        byte[] encrypt = SmUtil.sm2(privateKey, publicKey).encrypt(msg);
        return Strings.fromUTF8ByteArray(Hex.encode(encrypt));
    }

    /**
     * 解密业务参数
     * <p>
     * 公钥加密，私钥解密
     *
     * @param data       加密后的十六进制字符串
     * @param privateKey sm2私钥
     * @param publicKey  sm2公钥
     * @return 解密后的字符串
     */
    public static String decryptBizParameter(String privateKey, String publicKey, String data) {
        // 将十六进制字符串转换为字节数组
        byte[] encryptedData = Hex.decode(data);
        // 使用 SM2 算法解密
        byte[] decryptedData = SmUtil.sm2(privateKey, publicKey).decrypt(encryptedData);
        // 将解密后的字节数组转换为字符串
        return Strings.fromUTF8ByteArray(decryptedData);
    }

    /**
     * 解密响应参数
     * 使用AES对称加解密工具文件中AESUtils类的decrypt方法对加密文本进行解密，其中密钥secretKey和向量偏移量ivKey
     *
     * @param data   加密后的字符串
     * @param aesKey aes密钥
     * @param aesIv  aes向量偏移量
     * @return 解密后的字符串
     */
    public static String decryptResponse(String data, String aesKey, String aesIv) {
        AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, aesKey.getBytes(), aesIv.getBytes());
        return aes.decryptStr(data);
    }

    /**
     * 加密响应参数
     * 使用AES对称加解密工具文件中AESUtils类的encrypt方法对加密文本进行加密，其中密钥secretKey和向量偏移量ivKey
     */
    public static String encryptResponse(String data, String aesKey, String aesIv) {
        AES aes = new AES(Mode.CBC, Padding.PKCS5Padding, aesKey.getBytes(), aesIv.getBytes());
        return aes.encryptBase64(data);
    }


    /**
     * 生成 SM2 公钥和私钥
     *
     * @return {@link SM2KeyPair}
     */
    public static SM2KeyPair generateSM2KeyPair() {
        SM2 sm2 = SmUtil.sm2();
        String privateKey = sm2.getDHex();
        byte[] q = sm2.getQ(false);
        String publicKey = Hex.toHexString(q);
        return new SM2KeyPair(privateKey, publicKey);
    }

    /**
     * 生成 16 位字符串的 AES Key 和 IV
     *
     * @return 包含 Key 和 IV 的数组，索引 0 为 Key，索引 1 为 IV
     */
    public static String[] generateAesKeyAndIv() {
        byte[] keyBytes = SecureUtil.generateKey(SymmetricAlgorithm.AES.getValue(), 256).getEncoded();
        // 将密钥转换为 16 位字符串 ***REMOVE_SECRET***
        String key = Base64.encodeWithoutPadding(keyBytes).substring(0, 16);
        // 将 IV 转换为 16 位字符串
        String iv = Base64.encodeWithoutPadding(keyBytes).substring(17, 33);
        return new String[]{key, iv};
    }

    /**
     * 验证时间戳是否正确,时间戳要小于当前时间戳,且在五分钟之内
     *
     * @param timestamp 时间戳
     * @return true/false
     */
    public static boolean verifyTimestamp(Long timestamp) {
        long currentTimeMillis = System.currentTimeMillis();
        long fiveMinutesInMillis = 5 * 60 * 1000;
        return timestamp != null
                && timestamp <= currentTimeMillis
                && (currentTimeMillis - timestamp) <= fiveMinutesInMillis;
    }
}