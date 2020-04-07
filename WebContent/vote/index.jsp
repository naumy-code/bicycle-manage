<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在线投票系统</title>
</head>
<body>
	<%@include file="/commen/head.jsp"%>
    <h1 style="margin-left:600px;">在线投票</h1>
    <div style="margin-left:600px;">
        <a href = "vote.jsp"><input type ="button" value = "在线投票"/></a>
        <br/>
        <a href = "showVote.jsp"><input type ="button" value = "投票结果"/></a>
    </div>
	<%@include file="/commen/foot.jsp"%>
</body>
</html>
