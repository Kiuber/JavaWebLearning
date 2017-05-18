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
	This is my JSP page.可以输入中文了
	<br>
	<!-- 我是HTML注释，客户端可见 -->
	<%-- 我是JSP注释，客户端不可见 --%>
	<%!// 声明了一字字符串变量
	String s = "张三";

	// 声明了一个方法
	int add(int a, int b) {
		return a + b;
	}%>
	<%
		// 单行注释
		/*
			多行注释
		 */
		out.print("我是由jsp脚本输出的");
	%>
	<br> 你好，<%=s%>
	<br>x+y=<%=add(10, 5)%>
</body>
</html>
