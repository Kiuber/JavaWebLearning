<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<jsp:useBean id="myUser" class="me.kiuber.Users" />
<jsp:setProperty property="*" name="myUser" />
<jsp:useBean id="myUserDao" class="me.kiuber.dao.UserDao" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (myUserDao.login(myUser)) {
		session.setAttribute("username", myUser.getUsername());
		request.getRequestDispatcher("loginSuccess.jsp");
		out.print("success");
	} else {
		out.print("fail");
		response.sendRedirect("loginFail.jsp");
	}
%>

