<%@page import="me.kiuber.Users"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<%
		Users users = new Users();
		users.setUsername("Kiuber");
		users.setPassword("123");
	%>
	<h1>使用普通方式使用javabean实例</h1>
	<hr>
	用户名：<%=users.getUsername()%>
	<br> 密码：<%=users.getPassword()%>
	<br>
	<h1>使用userBeans动作方式使用javabean实例</h1>
	<hr>
	<jsp:useBean id="myUsers" class="me.kiuber.Users" />
	用户名：<%=myUsers.getUsername()%>
	<br> 密码：<%=myUsers.getPassword()%>

	<form name="loginForm" action="doLogin.jsp?mypass=8888" method="post">
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="username" value="" />
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" value="" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登录" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
