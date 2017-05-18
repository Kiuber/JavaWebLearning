<%@page import="java.text.SimpleDateFormat"%>
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

<title>My JSP 'session.jsp' starting page</title>

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
	<h1>session内置对象</h1>
	<hr>
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
				Locale.getDefault());
		Date date = new Date(session.getCreationTime());
		session.setAttribute("username", "Kiuber");
		session.setAttribute("sex", "男");
		session.setAttribute("pwd", "123");

		//设置当前session最大生存期限 单位 秒
		//session.setMaxInactiveInterval(5);
	%>
	Session创建时间：<%=sdf.format(date)%><br> Session的ID编号：<%=session.getId()%>
	<br> 从Session中获取用户名：<%=session.getAttribute("username")%>
	<br>
	<a href="session2.jsp" target="_blank">跳转到session2</a>
	<br>
	<%
		//销毁当前会话
		//session.invalidate();
	%>

</body>
</html>
