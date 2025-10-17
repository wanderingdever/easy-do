package com.easy.start.bean.vo.sys.user;

import com.easy.core.enums.Sex;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "用户信息")
public class UserInfoVO implements Serializable {

    @Schema(description = "用户信息ID")
    private String userInfoId;

    @Schema(description = "昵称")
    private String nickname;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "性别")
    private Sex sex;
}