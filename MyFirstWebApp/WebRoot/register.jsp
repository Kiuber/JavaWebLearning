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

<title>My JSP 'register.jsp' starting page</title>

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
	<h1>用户注册</h1>
	<hr>
	<!-- <form name="regForm" action="request.jsp" method="post">  -->
	<form name="regForm" action="response.jsp" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" value="Kiuber" name="username" />
				</td>
			</tr>
			<tr>
				<td>爱好：</td>
				<td><input type="checkbox" name="hobby" value="read" /> 读书<input
					type="checkbox" name="hobby" value="music" checked="checked" />音乐
					<input type="checkbox" name="hobby" value="internet"
					checked="checked" /> 上网<input type="checkbox" name="hobby"
					value="movie" />电影</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交" /></td>
			</tr>
		</table>
	</form>
	<a href="request.jsp?username=lisi">测试URL传值</a>
	<a href="request.jsp?username=李四">测试URL传中文值</a>
</body>
</html>
