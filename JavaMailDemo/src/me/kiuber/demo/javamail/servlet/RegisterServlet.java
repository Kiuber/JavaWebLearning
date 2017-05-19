package me.kiuber.demo.javamail.servlet;

import me.kiuber.demo.javamail.bean.User;
import me.kiuber.demo.javamail.service.UserService;
import me.kiuber.demo.javamail.service.impl.UserServiceImpl;
import me.kiuber.demo.javamail.utils.UUIDUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        try {
            // 解决中文乱码问题
            req.setCharacterEncoding("utf-8");
            // 接收数据
            String username = req.getParameter("username");
            String nickname = req.getParameter("nickname");
            String password = req.getParameter("password");
            String email = req.getParameter("email");
            // 封装数据
            User user = new User();
            user.setUsername(username);
            user.setNickname(nickname);
            user.setPassword(password);
            user.setEmail(email);
            user.setState(0); //0：未激活 1：已激活
            user.setCode(UUIDUtil.get().getUUID() + UUIDUtil.get().getUUID());
            // 调用业务逻辑层
            UserService userService = new UserServiceImpl();
            userService.register(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 页面跳转
    }
}
