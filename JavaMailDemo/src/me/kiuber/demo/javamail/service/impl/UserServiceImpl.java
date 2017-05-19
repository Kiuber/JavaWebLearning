package me.kiuber.demo.javamail.service.impl;

import me.kiuber.demo.javamail.bean.User;
import me.kiuber.demo.javamail.dao.UserDao;
import me.kiuber.demo.javamail.dao.impl.UserDaoImpl;
import me.kiuber.demo.javamail.service.UserService;

import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class UserServiceImpl implements UserService {
    @Override
    public void register(User user) {
        UserDao userDao = new UserDaoImpl();
        try {
            userDao.register(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean activityUser(String code) {
        try {
            UserDao userDao = new UserDaoImpl();
            boolean b = userDao.queryDB(code);
            boolean b1 = userDao.updateUser(code);
            System.out.println(b);
            System.out.println(b1);
            return b && b1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
