package me.kiuber.demo.javamail.service;

import me.kiuber.demo.javamail.bean.User;

import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public interface UserService {
    void register(User user) throws SQLException;

    boolean activityUser(String code);
}
