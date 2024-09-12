package com.easy.start.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * </p>
 *
 * @author Matt
 */
@Component
public class LianLianPayConfig {
    @Getter
    private static String publicKeyOnline;
    @Getter
    private static String publicKey;
    @Getter
    private static String privateKey;
    @Getter
    private static String oidPartner;

    @Value("${lianlian-pay.public-key-online}")
    public void setPublicKeyOnline(String publicKeyOnline) {
        LianLianPayConfig.publicKeyOnline = publicKeyOnline;
    }

    @Value("${lianlian-pay.public-key}")
    public void setPublicKey(String publicKey) {
        LianLianPayConfig.publicKey = publicKey;
    }

    @Value("${lianlian-pay.private-key}")
    public void setPrivateKey(String privateKey) {
        LianLianPayConfig.privateKey = privateKey;
    }

    @Value("${lianlian-pay.oid-partner}")
    public void setOidPartner(String oidPartner) {
        LianLianPayConfig.oidPartner = oidPartner;
    }
}