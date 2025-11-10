package com.easy.start.service.sys;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.core.exception.CustomizeException;
import com.easy.datasource.utils.PageUtils;
import com.easy.start.bean.dto.sys.user.UserDTO;
import com.easy.start.bean.dto.sys.user.UserEditDTO;
import com.easy.start.bean.dto.sys.user.UserPwdDTO;
import com.easy.start.bean.dto.sys.user.UserSearchDTO;
import com.easy.start.bean.entity.sys.*;
import com.easy.start.bean.vo.sys.UserRoleAndPermissionVO;
import com.easy.start.bean.vo.sys.user.UserExpandVO;
import com.easy.start.bean.vo.sys.user.UserVO;
import com.easy.start.dao.sys.SysUserMapper;
import com.easy.tool.crypto.SecureUtils;
import com.easy.tool.lang.IdUtils;
import com.easy.tool.lang.StringUtils;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 账号信息 服务实现类
 * </p>
 *
 * @author Matt
 * @since 2025-07-21
 */
@Service
@AllArgsConstructor
public class SysUserService extends ServiceImpl<SysUserMapper, SysUser> {

    private final SysUserInfoService userInfoService;

    private final SysUserRoleService userRoleService;

    private final SysUserOrgService userOrgService;

    private final SysRoleService roleService;

    /**
     * 检查用户是否已存在
     *
     * @param username 用户名
     * @return 存在true; 不存在false;
     */
    public boolean checkUser(String username) {
        SysUser user = lambdaQuery().eq(SysUser::getUsername, username).one();
        return user != null;
    }

    public Page<UserVO> pageUser(UserSearchDTO search) {
        // 校验机构ID是否存在
        if (StringUtils.isBlank(search.getOrgId())) {
            throw new CustomizeException("机构ID不能为空");
        }
        // 找出所有用户ID
        List<SysUserOrg> orgUserList = userOrgService.lambdaQuery().eq(SysUserOrg::getOrgId, search.getOrgId()).list();
        if (CollUtil.isEmpty(orgUserList)) {
            return PageUtils.getPage(search);
        }
        List<String> allUserIdList = orgUserList.stream().map(SysUserOrg::getUserId).toList();
        // 分页查询
        Page<SysUser> userPage = lambdaQuery()
                .in(SysUser::getId, allUserIdList)
                .eq(StringUtils.isNotNull(search.getStatus()), SysUser::getStatus, search.getStatus())
                .like(StringUtils.isNotBlank(search.getUsername()), SysUser::getUsername, search.getUsername())
                .like(StringUtils.isNotBlank(search.getEmail()), SysUser::getEmail, search.getEmail())
                .like(StringUtils.isNotBlank(search.getPhone()), SysUser::getPhonePrefix, search.getPhone())
                .or().like(StringUtils.isNotBlank(search.getPhone()), SysUser::getPhoneSuffix, search.getPhone())
                .page(PageUtils.getPage(search));
        List<SysUser> records = userPage.getRecords();
        if (CollUtil.isEmpty(records)) {
            return PageUtils.getPage(search);
        }
        // 关联查询用户信息
        List<String> userIdList = records.stream().map(SysUser::getId).toList();
        List<SysUserInfo> userInfoList = userInfoService.lambdaQuery().in(SysUserInfo::getUserId, userIdList).list();

        Map<String, SysUserInfo> userInfoMap = userInfoList.stream().collect(Collectors.toMap(SysUserInfo::getUserId, Function.identity()));
        List<UserVO> list = records.stream().map(user -> {
            UserVO userVO = new UserVO();
            BeanUtil.copyProperties(user, userVO);
            if (StringUtils.isNotBlank(user.getPhone())) {
                userVO.setPhone(user.getPhonePrefix() + "****" + user.getPhoneSuffix());
            }
            SysUserInfo userInfo = userInfoMap.get(user.getId());
            if (userInfo != null) {
                BeanUtil.copyProperties(userInfo, userVO);
                userVO.setUserInfoId(userInfo.getId());
            }
            return userVO;
        }).toList();
        return PageUtils.getPage(userPage, list);
    }

    /**
     * 添加账号
     *
     * @param dto 账号信息
     * @return 密码
     */
    @Transactional(rollbackFor = Exception.class)
    public String addUser(@Valid UserDTO dto) {
        // 校验用户名是否已存在
        if (checkUser(dto.getUsername())) {
            throw new CustomizeException("用户名已存在");
        }
        // 处理user
        SysUser user = new SysUser();
        user.setUsername(dto.getUsername());
        // FIXME 随机密码
        String password = IdUtils.generateCode(8);
        user.setPassword(BCrypt.hashpw(password));
        // 处理手机号
        if (StringUtils.isNotBlank(dto.getPhone())) {
            user.setPhone(SecureUtils.sm4PhoneEncrypt(dto.getPhone()));
            // 手机号前三位
            user.setPhonePrefix(dto.getPhone().substring(0, 3));
            // 手机号后四位
            user.setPhoneSuffix(dto.getPhone().substring(7));
        }
        user.setEmail(dto.getEmail());
        user.setClient(dto.getClient());
        user.setStatus(dto.getStatus());
        save(user);
        // 处理user_info
        SysUserInfo userInfo = new SysUserInfo();
        userInfo.setUserId(user.getId());
        userInfo.setNickname(dto.getNickname());
        userInfo.setAvatar(dto.getAvatar());
        userInfo.setSex(dto.getSex());
        userInfoService.save(userInfo);
        // 处理账号关联信息
        addUserAssociation(user.getId(), dto.getOrgId(), dto.getRoleList());
        return password;
    }


    /**
     * 更新账号
     *
     * @param user 账号信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateUser(@Valid UserEditDTO user) {
        // 处理user
        SysUser sysUser = getById(user.getUserId());
        if (sysUser == null) {
            throw new CustomizeException("账号不存在");
        }
        sysUser.setStatus(user.getStatus());
        sysUser.setClient(user.getClient());
        updateById(sysUser);

        // 处理user_info
        SysUserInfo userInfo = userInfoService.getById(user.getUserId());
        userInfo.setNickname(user.getNickname());
        userInfo.setAvatar(user.getAvatar());
        userInfo.setSex(user.getSex());
        userInfoService.updateById(userInfo);
        // 处理账号关联信息
        delInfo(user.getUserId());
        addUserAssociation(user.getUserId(), user.getOrgId(), user.getRoleList());
    }

    /**
     * 删除账号
     *
     * @param userId 账号ID
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteUser(String userId) {
        // 删除账号
        this.removeById(userId);
        userInfoService.lambdaUpdate().eq(SysUserInfo::getUserId, userId).remove();
        // 岗位、角色、组织关联删除
        delInfo(userId);
    }

    /**
     * 删除账号关联信息
     *
     * @param userId 账号ID
     */
    private void delInfo(String userId) {
        userOrgService.lambdaUpdate().eq(SysUserOrg::getUserId, userId).remove();
        userRoleService.lambdaUpdate().eq(SysUserRole::getUserId, userId).remove();
    }


    /**
     * 添加账号关联信息
     *
     * @param userId   账号ID
     * @param orgId    组织ID
     * @param roleList 角色ID列表
     */
    private void addUserAssociation(String userId, String orgId, List<String> roleList) {
        // 组织关联新增
        SysUserOrg userOrg = new SysUserOrg();
        userOrg.setUserId(userId);
        userOrg.setOrgId(orgId);
        userOrgService.save(userOrg);
        // 角色关联新增
        if (CollUtil.isNotEmpty(roleList)) {
            List<SysUserRole> userRoles = userRoleService.getList(userId, roleList);
            userRoleService.saveBatch(userRoles);
        }
    }

    /**
     * 获取账号信息
     *
     * @param userId 账号ID
     * @return 账号信息
     */
    public UserExpandVO getUserInfo(String userId) {
        UserExpandVO userInfo = this.baseMapper.selectUserAndInfo(userId);
        //  岗位、角色、组织关联查询
        try {
            UserRoleAndPermissionVO roleAndPermission = roleService.getUserRoleKeyList(userInfo.getUserId());
            if (roleAndPermission != null) {
                userInfo.setRoleKeyList(roleAndPermission.getRoles().stream().map(SysRole::getRoleKey).toList());
                userInfo.setRoleList(roleAndPermission.getRoles());
                userInfo.setPermissionList(roleAndPermission.getPermissions());
            }
            SysUserOrg userOrg = userOrgService.lambdaQuery().eq(SysUserOrg::getUserId, userId).one();
            if (userOrg != null) {
                userInfo.setOrgId(userOrg.getOrgId());
            }
        } catch (Exception e) {
            StpUtil.logout(userId);
            throw new CustomizeException(e.getMessage());
        }

        return userInfo;
    }

    public void resetPassword(@Valid UserPwdDTO dto) {
        // 校验两个密码是否一致
        if (!dto.getNewPwd().equals(dto.getConfirmPwd())) {
            throw new CustomizeException("两次输入密码不一致");
        }
        SysUser user = this.lambdaQuery().eq(SysUser::getId, dto.getUserId()).one();
        user.setPassword(BCrypt.hashpw(dto.getConfirmPwd()));
        this.updateById(user);
    }
}