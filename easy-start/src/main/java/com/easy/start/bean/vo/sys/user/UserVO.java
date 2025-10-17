package com.easy.start.bean.vo.sys.user;

import com.easy.start.enums.AccountClient;
import com.easy.start.enums.AccountStatus;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户")
public class UserVO extends UserInfoVO {

    @Schema(description = "userId")
    private String userId;

    @Schema(description = "账号")
    private String username;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "手机号")
    private String phone;

    @Schema(description = "账号客户端")
    private AccountClient client;

    @Schema(description = "账号状态")
    private AccountStatus status;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    // 解密手机号 并且脱敏
//    public void setPhone(String phone) {
//        this.phone = DesensitizedUtil.mobilePhone(SecureUtils.sm4PhoneDecrypt(phone));
//    }
}