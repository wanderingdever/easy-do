package com.easy.api.server.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ApiServerApiInfo {

    private String name;

    private String path;

    private int limitNum;

    private boolean enabled = true;

    public ApiServerApiInfo() {
    }

    public ApiServerApiInfo(String name, String path, int limitNum, boolean enabled) {
        this.name = name;
        this.path = path;
        this.limitNum = limitNum;
        this.enabled = enabled;
    }

}
