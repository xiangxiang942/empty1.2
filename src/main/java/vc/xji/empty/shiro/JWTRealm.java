package vc.xji.empty.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import vc.xji.empty.entity.User;
import vc.xji.empty.service.UserService;
import vc.xji.empty.util.JWTUtil;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Service
public class JWTRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 权限判断
        String token = principalCollection.toString();

        String role = JWTUtil.getClaim(token, "role");
        String permissions[] = JWTUtil.getArrayClaim(token, "permissions");

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRole(role);
        Set<String> permissionSet = new HashSet();
        permissionSet.addAll(Arrays.asList(permissions));
        simpleAuthorizationInfo.addStringPermissions(permissionSet);

        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        JWTToken jwtToken = (JWTToken) authenticationToken;
        String token = (String) jwtToken.getPrincipal();

        if (StringUtils.isEmpty(token)) {
            throw new AuthenticationException("请重新登录");
        }
        String userId = JWTUtil.getClaim(token, "userId");

        if (StringUtils.isEmpty(userId)) {
            throw new AuthenticationException("请重新登录");
        }

        User user = userService.getById(Integer.valueOf(userId));

        if (user == null) {
            throw new AuthenticationException("账号或密码错误");
        }

        if (!user.getPhone().equals(JWTUtil.getClaim(token, "username"))) {
            throw new AuthenticationException("账号或密码错误");
        }

        if (!JWTUtil.verify(token, userId, user.getPassword())) {
            throw new AuthenticationException("请重新登录");
        }

        return new SimpleAuthenticationInfo(token, token, "jwt_realm");
    }
}
