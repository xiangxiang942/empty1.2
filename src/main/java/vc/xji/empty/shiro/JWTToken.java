package vc.xji.empty.shiro;

import org.apache.shiro.authc.AuthenticationToken;
import org.springframework.util.StringUtils;
import vc.xji.empty.util.AESUtil;


public class JWTToken implements AuthenticationToken {

    private String token;

    public JWTToken(String token) {
        this.token = token;
//        try {
//            this.token = AESUtil.encrypt(token.getBytes("utf-8"));
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    public Object getPrincipal() {
//        return token;
        if (StringUtils.isEmpty(token)) {
            return null;
        } else {
            return AESUtil.decrypt(token);
        }
    }

    @Override
    public Object getCredentials() {
//        return token;token
        if (StringUtils.isEmpty(token)) {
            return null;
        } else {
            return AESUtil.decrypt(token);
        }
    }
}
