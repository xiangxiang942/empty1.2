package vc.xji.empty.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vc.xji.empty.entity.Permissions;
import vc.xji.empty.entity.Role;
import vc.xji.empty.entity.User;
import vc.xji.empty.entity.UserPermission;
import vc.xji.empty.exception.MessageException;
import vc.xji.empty.mapper.PermissionsMapper;
import vc.xji.empty.mapper.RoleMapper;
import vc.xji.empty.mapper.UserMapper;
import vc.xji.empty.service.UserService;
import vc.xji.empty.util.JWTUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionsMapper permissionsMapper;

    @Override
    public String login(String username, String password) throws Exception {
        User user = userMapper.selectByPhone(username);

        if (user == null) {
            throw new MessageException("账号或密码错误");
        }
        // 缺少加密
        if (!password.equals(user.getPassword())) {
            throw new MessageException("账号或密码错误");
        }

        // 获取当前账号对应的角色和权限
        Role role = roleMapper.selectByPrimaryKey(user.getRoleId());
        List<Permissions> permissions = permissionsMapper.selectByUserId(user.getId().intValue());

        if (role == null || permissions == null) {
            throw new MessageException("获取账号权限失败");
        }

        List<String> list = new ArrayList<>();

        for (Permissions p : permissions) {
            list.add(p.getPermissionsValue());

        }

        return JWTUtil.create(user, role.getRoleValue(), list.toArray(new String[list.size()]));
    }

    @Override
    @Transactional
    public User addUser(User user) throws Exception {
        user.setId(null);
        user.setRoleId(2);
        userMapper.insertSelective(user);
        System.out.println(new UserPermission(user.getId().intValue(), 3));
        List<UserPermission> permissionList = new ArrayList<>();
        permissionList.add(new UserPermission(user.getId().intValue(), 3));

        permissionsMapper.insertPermissions(permissionList);

        return user;
    }
}
