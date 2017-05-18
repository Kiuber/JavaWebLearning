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

<title>My JSP 'MyJsp.jsp' starting page</title>

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
	<h1>九九乘法表</h1>
	<%!// 定义一个九九乘法表方法，然后通过表达式调用，然后在页面上显示
	String printMultiTable() {
		String s = "";
		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= i; j++) {
				s += i + "*" + j + "=" + (i * j) + "&nbsp&nbsp&nbsp&nbsp";
			}
			s += "<br>";
		}
		return s;
	}

	void printMultiTable2(JspWriter out) throws Exception {
		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= i; j++) {
				out.print(i + "*" + j + "=" + (i * j) + "&nbsp&nbsp&nbsp&nbsp");
			}
			out.print("<br>");
		}
	}%>
	<hr>
	<%=printMultiTable()%>
	<hr>
	<%
		printMultiTable2(out);
	%>
</body>
</html>