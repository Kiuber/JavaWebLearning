package me.kiuber.demo.javamail.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class DBUtil {
    private static DBUtil instance;
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://139.199.16.32:3306/javamailtest?useUnicode=true&characterEncoding=UTF-8";
    //    private static final String url = "jdbc:mysql://139.199.16.32:3306/shopping?useUnicode=true&characterEncoding=UTF-8";
    private static final String username = "root";
    private static final String password = "password";
    private static Connection mConnection;

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static DBUtil get() {
        if (instance == null) {
            instance = new DBUtil();
        }
        return instance;
    }

    public Connection getConn() throws SQLException {
        if (mConnection == null) {
            mConnection = DriverManager.getConnection(url, username, password);
        }
        return mConnection;
    }
}
