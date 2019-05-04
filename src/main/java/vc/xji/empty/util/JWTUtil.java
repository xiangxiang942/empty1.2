package vc.xji.empty.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vc.xji.empty.entity.User;

import java.nio.charset.Charset;
import java.util.Date;

public class JWTUtil {

    private static final long EXPIRE_TIME = 50 * 60 * 1000;
    private static Logger logger = LoggerFactory.getLogger(JWTUtil.class);

    public static String getClaim(String token, String claim) {
        try {
            DecodedJWT jwt = JWT.decode(token);

            return jwt.getClaim(claim).asString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String[] getArrayClaim(String token, String claim) {
        try {
            DecodedJWT jwt = JWT.decode(token);

            return jwt.getClaim(claim).asArray(String.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean verify(String token, String userId, String secret) {
        try {
            //根据密码生成JWT效验器
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("userId", userId)
                    .build();
            //效验TOKEN
            DecodedJWT jwt = verifier.verify(token);
            Date date = jwt.getExpiresAt();

            return date.getTime() > System.currentTimeMillis();
        } catch (Exception exception) {
            return false;
        }
    }


    public static String create(User user, String role, String permissions[]) {
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        Algorithm algorithm = Algorithm.HMAC256(user.getPassword());

        String jwt = JWT.create()
                .withClaim("userId", String.valueOf(user.getId()))
                .withClaim("username", user.getPhone())
                .withClaim("role", role)
                .withArrayClaim("permissions", permissions)
                .withExpiresAt(date)
                .sign(algorithm);

        return AESUtil.encrypt(jwt.getBytes(Charset.forName("utf-8")));
    }


}
