package me.kiuber.demo.javamail.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class DBHelper {

    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://139.199.16.32:3306/shopping?useUnicode=true&characterEncoding=UTF-8";
    private static final String username = "root";
    private static final String password = "password";
    private static Connection mConnection = null;

    static {
        try {
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        if (mConnection == null) {
            mConnection = DriverManager.getConnection(url, username, password);
        }
        return mConnection;
    }

    public static void main(String[] args) {
        try {
            Connection connection = DBHelper.getConnection();
            if (connection != null) {
                System.out.println("connection ok");
            } else {
                System.out.println("connection fail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
