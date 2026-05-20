package com.easy.server.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.stp.parameter.SaLoginParameter;
import cn.hutool.crypto.digest.BCrypt;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.SystemConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.server.bean.dto.LoginDTO;
import com.easy.server.bean.entity.sys.SysLoginLogs;
import com.easy.server.bean.entity.sys.SysUser;
import com.easy.server.bean.vo.TokenInfo;
import com.easy.server.bean.vo.sys.config.ConfigVO;
import com.easy.server.service.sys.SysLoginLogsService;
import com.easy.server.service.sys.SysUserService;
import com.easy.server.utils.SystemUtils;
import com.easy.tool.http.IpLocation;
import com.easy.tool.lang.DateUtils;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 登录服务
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class LoginService {

    private final SysUserService userService;
    private final SysLoginLogsService loginLogsService;

    /**
     * 账号密码登录
     *
     * @param login 登录信息 {@link  LoginDTO}
     * @return {@link  TokenInfo}
     */
    @Transactional(rollbackFor = Exception.class)
    public TokenInfo loginWithPassword(LoginDTO login) {
        // 校验验证码
        validateCode(login.getVerifyCodeUuid(), login.getValidateCode());
        SysUser user = userService.lambdaQuery().eq(SysUser::getUsername, login.getUsername()).one();
        if (user == null) {
            throw new CustomizeException("账号不存在");
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new CustomizeException("密码错误");
        }
        // 登录
        SaLoginParameter loginModel = new SaLoginParameter()
                .setExtra("loginTime", DateUtils.now())
                .setDeviceType(login.getDevice());
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();

        // 校验菜单权限
        List<String> permissionList = StpUtil.getPermissionList();
        if (permissionList.isEmpty()) {
            throw new CustomizeException("菜单权限不足");
        }

        // 保存登录记录
        loginLogs(login, user);
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDeviceType());
    }

    /**
     * 保存登录记录
     *
     * @param login    登录信息 {@link LoginDTO}
     * @param userInfo 用户信息 {@link SysUser}
     */
    private void loginLogs(LoginDTO login, SysUser userInfo) {
        // 保存登录记录
        IpLocation location = login.getIpInfo();
        SysLoginLogs loginLogs = new SysLoginLogs();
        loginLogs.setUserId(userInfo.getId());
        loginLogs.setUsername(userInfo.getUsername());
        loginLogs.setLoginType(login.getLoginType());
        loginLogs.setIp(location.getIp());
        loginLogs.setBrowser(login.getDevice());
        loginLogs.setIpLocation(String.join(",", location.getCountry(), location.getProvince(), location.getCity()));
        loginLogs.setLoginTime(DateUtils.now());
        loginLogsService.save(loginLogs);
    }

    /**
     * 登录码登录
     *
     * @param login 登录信息 {@link LoginDTO}
     * @return {@link TokenInfo}
     */
    public TokenInfo loginWithCode(@Valid LoginDTO login) {
        Object cacheObject = RedisUtils.getCacheObject(SystemConstants.LOGIN_CODE + login.getUsername());
        if (cacheObject == null) {
            throw new CustomizeException("登录码不存在");
        }
        SysUser user = userService.lambdaQuery().eq(SysUser::getId, cacheObject).one();
        if (user == null) {
            throw new CustomizeException("账号不存在");
        }
        // 登录
        SaLoginParameter loginModel = new SaLoginParameter()
                .setDeviceType(login.getDevice());
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        // 保存登录记录
        loginLogs(login, user);
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDeviceType());
    }

    /**
     * 校验验证码
     */
    public void validateCode(String verifyCodeUuid, String validateCode) {
        // 判断是否需要校验验证码
        ConfigVO config = SystemUtils.getConfig(SystemConstants.SYSTEM_CONFIG_CAPTCHA_ENABLE);
        // 不需要校验验证码
        if (config == null || "0".equals(config.getConfigValue())) {
            return;
        }
        // 从缓存中获取验证码
        Object cacheObject = RedisUtils.getCacheObject(SystemConstants.CAPTCHA_CODE + verifyCodeUuid);
        // 校验验证码
        if (cacheObject == null || !validateCode.equalsIgnoreCase(cacheObject.toString())) {
            throw new CustomizeException("验证码不正确");
        }
    }
}