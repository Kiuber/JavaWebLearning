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

<title>My JSP 'out.jsp' starting page</title>

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
	<h1>out内置对象</h1>
	<%
		out.print("<h2>静夜思</h2>");
		out.print("床前明月光<br>");
		out.print("疑是地上霜<br>");
		out.flush();
		//out.clear();// 这里会抛出异常 因为clear不能在flush之后条用
		out.clearBuffer();
		out.print("举头望明月<br>");
		out.print("低头思故乡<br>");
	%>
	<br> 缓冲区大小<%=out.getBufferSize()%>byte
	<br> 缓冲区大小<%
		out.getBufferSize();
	%>byte
	<br> 缓冲区大小<%
		int size = out.getBufferSize();
		out.print(size);
	%>byte
	<br> 剩余缓冲区<%=out.getRemaining()%>byte
	<br>是否自动清空缓冲区大小<%=out.isAutoFlush()%>
</body>
</html>
