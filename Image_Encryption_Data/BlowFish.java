package cryptography;

import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
public class BlowFish {

    
    public static byte[] getRawKey(byte[] seed) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("Blowfish");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seed);
        kgen.init(128, sr); 
        SecretKey skey = kgen.generateKey();
        byte[] raw = skey.getEncoded();
        return raw;
    }

    public static byte[] encrypt(byte[] sk, byte[] fildata) throws Exception {

        byte[] rawKey = getRawKey(sk);
        SecretKeySpec skeySpec = new SecretKeySpec(rawKey, "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(fildata);
        return encrypted;
    }

    public static byte[] decrypt(byte[] sk, byte[] encrypted)
            throws Exception {
                byte[] rawKey = getRawKey(sk);
        SecretKeySpec skeySpec = new SecretKeySpec(rawKey, "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

}