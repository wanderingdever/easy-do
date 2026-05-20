package com.easy.api.server.model;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class ApiServerAuthInfo {

    private String appId;

    private String sm2PublicKey;

    private String sm2PrivateKey;

    private String aesKey;

    private String aesIv;

    private boolean enabled = true;

    private List<ApiServerApiInfo> apis = new ArrayList<>();

}
