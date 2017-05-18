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

<title>My JSP 'request.jsp' starting page</title>

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
	<h1>用户登录</h1>
	<hr>
	<form action="doLogin.jsp" name="loginForm" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登录" /></td>
			</tr>
		</table>
	</form>
	<h1>request内置对象</h1>
	<hr>
	<%
		// 解决中文乱码问题，但是无法解决URL传值中文乱码问题，要想url传值不会乱码需要修改tomcat服务器配置 在Connector节点新增URIEncoding="utf-8"
		request.setCharacterEncoding("utf-8");
		request.setAttribute("pwd", "123");
	%>
	用户名:<%=request.getParameter("username")%><br> 爱好:<%
		String[] hobby = request.getParameterValues("hobby");
		if (hobby != null) {
			for (int i = 0; i < hobby.length; i++) {
				out.print(hobby[i] + "&nbsp;&nbsp;");
			}
		}
	%>
	<br> 密码：<%=request.getAttribute("pwd")%>
	<br> 请求体的MIME类型：<%=request.getContentType()%>
	<br>协议类型及版本号：<%=request.getProtocol()%>
	<br>服务器主机名：<%=request.getServerName()%>
	<br>服务器端口号：<%=request.getServerPort()%>
	<br>请求文件长度<%=request.getContentLength()%>
	<br>请求客户端ip地址<%=request.getRemoteAddr()%>
	<br>请求真实物理路径：<%=request.getRealPath("request.jsp")%>
	<br>shangxialujing<%=request.getContextPath()%>
</body>
</html>
