package com.easy.start.bean.vo.sys.role;

import com.easy.start.enums.AuthorityLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 角色信息
 * </p>
 *
 * @author Matt
 */
@Schema(description = "角色信息")
@Data
public class RoleVO implements Serializable {
    /**
     * 角色名字
     */
    @Schema(description = "角色名字")
    private String roleName;

    /**
     * 角色key
     */
    @Schema(description = "角色key")
    private String roleKey;

    /**
     * 权限级别
     */
    @Schema(description = "权限级别")
    private AuthorityLevel authorityLevel;

}