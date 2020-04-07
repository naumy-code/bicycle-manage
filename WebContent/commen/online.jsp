<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>当前在线人数是：</h2>
<%=application.getAttribute("online") %>
<%session.setMaxInactiveInterval(10); %>
</body>
</html>