package com.easy.start.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.RedisConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.start.bean.dto.user.UserDTO;
import com.easy.start.bean.vo.login.PwdLogin;
import com.easy.start.bean.vo.login.TokenInfo;
import com.easy.start.bean.vo.user.UserVO;
import com.easy.utils.lang.StringUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 登录服务
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class LoginService {

    private final UserService userService;

    /**
     * 检查用户是否已存在
     *
     * @param dto 用户名
     * @return 存在true; 不存在false;
     */
    public boolean checkUser(UserDTO dto) {
        UserVO userVO = userService.selectUserByUsername(dto.getUsername());
        return userVO != null;
    }

    /**
     * 账号密码登录
     *
     * @param login 登录信息 {@link  PwdLogin}
     * @return {@link  TokenInfo}
     */
    public TokenInfo pwdLogin(PwdLogin login) {
        Object cacheObject = RedisUtils.getCacheObject(RedisConstants.CAPTCHA_CODE + login.getVerifyCodeUuid());
        if (StringUtils.isNull(cacheObject) || !login.getValidateCode().equalsIgnoreCase(cacheObject.toString())) {
            throw new CustomizeException("验证码不正确");
        }
        UserVO user = userService.selectUserByUsername(login.getUsername());
        if (user == null) {
            throw new CustomizeException("账号不存在");
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new CustomizeException("密码错误");
        }
        // 登录
        SaLoginModel loginModel = new SaLoginModel().build()
                .setExtra("machine_code", login.getMachineCode());
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }

}