package me.kiuber.demo.javamail.dao;

import me.kiuber.demo.javamail.bean.User;

import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public interface UserDao {
    void register(User user) throws SQLException;

    boolean queryDB(String code) throws SQLException;

    boolean updateUser(String code) throws SQLException;
}
