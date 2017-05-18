<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String username = "";
	String password = "";
	request.setCharacterEncoding("utf-8");
	username = request.getParameter("username");
	password = request.getParameter("password");
	if (username.equals("admin") && password.equals("admin")) {
		session.setAttribute("username", username);
		request.getRequestDispatcher("loginSuccess.jsp");
		out.print("success");
	} else {
		out.print("fail");
		response.sendRedirect("loginFail.jsp");
	}
%>

