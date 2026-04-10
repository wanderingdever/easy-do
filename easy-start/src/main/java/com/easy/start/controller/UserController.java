package com.easy.start.controller;


import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.base.dto.IdDTO;
import com.easy.start.bean.dto.EmailDTO;
import com.easy.start.bean.dto.sys.user.UserDTO;
import com.easy.start.bean.dto.sys.user.UserEditDTO;
import com.easy.start.bean.dto.sys.user.UserPwdDTO;
import com.easy.start.bean.dto.sys.user.UserSearchDTO;
import com.easy.start.bean.vo.sys.user.UserExpandVO;
import com.easy.start.bean.vo.sys.user.UserVO;
import com.easy.start.service.sys.SysUserService;
import com.easy.tool.http.IpLocation;
import com.easy.tool.http.IpUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


/**
 * 用户
 * </p>
 *
 * @author Matt
 */
@RestController
@AllArgsConstructor
@RequestMapping("/user")
@Tag(name = "用户管理")
public class UserController {

    private final SysUserService userService;

    @PostMapping(value = "/user_info", headers = "Easy-Token")
    @Operation(summary = "获取用户信息")
    public UserExpandVO userInfo(HttpServletRequest request) {
        IpLocation location = IpUtils.getLocation(request);
        UserExpandVO userInfo = userService.getUserInfo(StpUtil.getLoginIdAsString());
        // 设置登录的IP和属地
        userInfo.setIp(location.getIp());
        userInfo.setIpLocation(String.join("/", location.getCountry(), location.getProvince(), location.getCity()));
        userInfo.setLoginTime((String) StpUtil.getExtra("loginTime"));
        return userInfo;
    }

    @GetMapping("/get/{userId}")
    @Operation(summary = "根据ID获取用户信息")
    public UserExpandVO getUserAllInfo(@PathVariable("userId") String userId) {
        return userService.getUserInfo(userId);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<UserVO> page(@RequestBody UserSearchDTO dto) {
        return userService.pageUser(dto);
    }

    @PostMapping("/add")
    @Operation(summary = "新增用户")
    @SaIgnore
    public String add(@Valid @RequestBody UserDTO dto) {
        return userService.addUser(dto);
    }

    @PostMapping("/update")
    @Operation(summary = "更新用户")
    public String update(@Valid @RequestBody UserEditDTO user) {
        userService.updateUser(user);
        return "更新成功";
    }

    @PostMapping("/del")
    @Operation(summary = "删除用户")
    public String del(@RequestBody IdDTO dto) {
        userService.deleteUser(dto.getId());
        return "删除成功";
    }

    /**
     * 修改密码
     */
    @PostMapping("/change_password")
    @Operation(summary = "修改密码")
    public String changePassword(@Valid @RequestBody UserPwdDTO dto) {
        userService.changePassword(dto);
        return "修改成功";
    }

    /**
     * 重置密码
     *
     * @return 操作结果
     */
    @PostMapping("/reset_password")
    @Operation(summary = "重置密码")
    public String resetPassword(@Valid @RequestBody UserPwdDTO dto) {
        userService.resetPassword(dto);
        return "重置成功";
    }

    /**
     * 更新用户头像
     */
    @PostMapping("/update_avatar")
    @Operation(summary = "更新用户头像")
    public void updateAvatar(@RequestPart(name = "avatar") MultipartFile avatar) throws IOException {
        userService.updateAvatar(avatar);
    }

    /**
     * 获取用户手机号
     */
    @GetMapping("/get_phone/{userId}")
    @Operation(summary = "获取用户手机号")
    public String getPhone(@PathVariable("userId") String userId) {
        return userService.getPhone(userId);
    }

    /**
     * 绑定邮箱
     */
    @PostMapping("/bind_email")
    @Operation(summary = "绑定邮箱")
    public String bindEmail(@Valid @RequestBody EmailDTO dto) {
        userService.bindEmail(dto);
        return "绑定成功";
    }
}