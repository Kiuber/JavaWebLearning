<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	response.setContentType("text/html;charset=utf-8");
	out.println("<h1>response内置对象</h1>");
	out.println("<hr>");
	// 可以使jsp内置out输出内容先与PrintWriter输出
	//out.flush();

	// outer对象提前与jsp内置out对象
	PrintWriter outer = response.getWriter();
	outer.println("我是response对象生成的outer对象");
	// 客户端行为 相当于让客户端发了一个请求 相当于两次请求，前一次的请求对象不会保存，地址栏的地址会改变
	//response.sendRedirect("request.jsp");
	// 服务器行为 是一次请求 转发后请求好保存 地址栏不会改变 
	request.getRequestDispatcher("request.jsp").forward(request,
			response);
%>
