<%@page import="beiyou.java.web.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>未登录</title>
	</head>
	<body>
		<%
			Object obj = session.getAttribute("USER");
			if(null == obj){
				response.sendRedirect("login.jsp");
				return;
			}
			User user = (User)obj;
		%>
	</body>
</html>




























