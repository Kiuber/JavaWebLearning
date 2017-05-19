package me.kiuber.demo.javamail.dao.impl;


import me.kiuber.demo.javamail.bean.User;
import me.kiuber.demo.javamail.dao.UserDao;
import me.kiuber.demo.javamail.utils.DBUtil;
import me.kiuber.demo.javamail.utils.MailUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class UserDaoImpl implements UserDao {

    @Override
    public void register(User user) throws SQLException {
        Connection conn = DBUtil.get().getConn();
        if (conn != null) {
            String sql = "INSERT INTO user (username, email, password, state, code ,nickname) VALUE (?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setInt(4, user.getState());
            pstmt.setString(5, user.getCode());
            pstmt.setString(6, user.getNickname());
            int num = pstmt.executeUpdate();
            if (num == 1) {
                MailUtil.get().sendMail(user.getEmail(), user.getCode());
            }
        }
    }

    @Override
    public boolean queryDB(String code) throws SQLException {
        Connection conn = DBUtil.get().getConn();
        if (conn != null) {
            String sql = "SELECT * FROM user WHERE user.code =?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, code);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } else {
            return false;
        }
    }

    @Override
    public boolean updateUser(String code) throws SQLException {
        Connection conn = DBUtil.get().getConn();
        if (conn != null) {
            String sql = "UPDATE user SET user.state = 1 WHERE user.code = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, code);
            int execute = preparedStatement.executeUpdate();
            return execute == 1;
        } else {
            return false;
        }
    }
}
