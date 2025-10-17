package com.easy.start.bean.vo.sys.user;

import com.easy.start.bean.entity.sys.SysRole;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

/**
 * 用户拓展详情 关联角色 权限 机构 岗位
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户信息-拓展")
public class UserExpandVO extends UserVO implements Serializable {

    @Schema(description = "机构id")
    private String orgId;

    @Schema(description = "登录IP")
    private String ip;

    @Schema(description = "IP属地")
    private String ipLocation;

    @Schema(description = "登录时间")
    private String loginTime;

    @Schema(description = "角色Key列表")
    private List<String> roleKeyList;

    @Schema(description = "角色列表")
    private List<SysRole> roleList;

    @Schema(description = "权限列表")
    private List<String> permissionList;

}