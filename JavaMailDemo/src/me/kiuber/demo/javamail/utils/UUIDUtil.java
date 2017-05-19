package me.kiuber.demo.javamail.utils;

import java.util.UUID;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class UUIDUtil {
    private static UUIDUtil instance;

    public static UUIDUtil get() {
        if (instance == null) {
            instance = new UUIDUtil();
        }
        return instance;
    }

    public String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
