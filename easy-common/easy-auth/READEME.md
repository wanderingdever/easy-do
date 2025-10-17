# 权限模块

> 继承该模块需要实现StpInterface

## SaTokenPermissionConfig

```java


/**
 * satoken权限认证的接口实现类
 * </p>
 *
 * @author Matt
 */
@Component
public class SaTokenPermissionConfig implements StpInterface {

    // 角色服务,可以自定义
    private final RoleService roleService;

    public SaTokenPermissionConfig(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        // 获取用户权限接口
        UserRoleAndPermissionVO userRoleAndPermission = roleService.getUserRoleKeyList((String) loginId);
        if (userRoleAndPermission == null) {
            throw new CustomizeException("用户权限异常");
        }
        return userRoleAndPermission.getPermissions();
    }

    /**
     * 返回一个账号所拥有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        // 获取用户角色接口
        UserRoleAndPermissionVO userRoleAndPermission = roleService.getUserRoleKeyList((String) loginId);
        if (userRoleAndPermission == null) {
            throw new CustomizeException("用户角色异常");
        }
        return userRoleAndPermission.getRoles().stream().map(RoleVO::getRoleKey).toList();
    }
}

```