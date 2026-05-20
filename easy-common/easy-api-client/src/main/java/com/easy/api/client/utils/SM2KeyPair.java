package com.easy.api.client.utils;

/**
 * </p>
 *
 * @author Matt
 */
public class SM2KeyPair {

    private final String privateKey;
    private final String publicKey;

    public SM2KeyPair(String privateKey, String publicKey) {
        this.privateKey = privateKey;
        this.publicKey = publicKey;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    @Override
    public String toString() {
        return "SM2KeyPair{" +
                "privateKey='" + privateKey + '\'' +
                ", publicKey='" + publicKey + '\'' +
                '}';
    }
}