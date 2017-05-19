package me.kiuber.demo.javamail.servlet;

import me.kiuber.demo.javamail.service.UserService;
import me.kiuber.demo.javamail.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/5/19 0019.
 */
public class ActiveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 接收激活码
        String code = req.getParameter("code");
        // 解决中文乱码
        resp.setContentType("text/html;charset=UTF-8");
        // 根据激活码查询用户
        UserService userService = new UserServiceImpl();
        boolean b = userService.activityUser(code);
        PrintWriter writer = resp.getWriter();
        if (b) {
            writer.println("注册success");
        } else {
            writer.println("注册fail");
        }
    }
}
