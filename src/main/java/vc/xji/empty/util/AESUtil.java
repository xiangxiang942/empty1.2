package vc.xji.empty.util;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class AESUtil {
    private static final Logger logger = LoggerFactory.getLogger(AESUtil.class);

    private static final String AES_STRING = "AES/CBC/PKCS5Padding";
    private static final String KEY = "eba4ceb075be539481f411e92d1a8f10";
    private static final String IV = "6638e088f147eaed";

    /**
     * AES加密
     *
     * @param srcData 加密内容
     * @return 加密后Base64编码结果
     */
    public static String encrypt(byte[] srcData) {
        SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(), "AES");
        try {
            Cipher cipher = Cipher.getInstance(AES_STRING);
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(IV.getBytes()));

            return Base64.encodeBase64String(cipher.doFinal(srcData));
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("AES加密失败: " + new String(srcData));
            return null;
        }
    }

    /**
     * AES解密
     *
     * @param encodeString Base64字符串
     * @return 解密结果
     */
    public static String decrypt(String encodeString) {
        byte[] bytes = Base64.decodeBase64(encodeString);
        SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(), "AES");
        Cipher cipher;
        try {
            cipher = Cipher.getInstance(AES_STRING);
            cipher.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(IV.getBytes()));
            return new String(cipher.doFinal(bytes), "utf-8");
        } catch (Exception e) {
            logger.error("AES解密失败: " + encodeString);
            return null;
        }
    }
}

