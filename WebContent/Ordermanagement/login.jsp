<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>自行车购物管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<!-- load css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Ordermanagement/layui/css/layui.css"
	media="all">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Ordermanagement/css/login1.css" media="all">
</head>
<body>
	<div class="layui-canvs"></div>
	<div class="layui-layout layui-layout-login">
		<h1>
			<strong>欢迎来到自行车购物商城</strong> <em>Management System</em>
		</h1>

		<form action="${pageContext.request.contextPath}/login" method="post">
			<div class="layui-user-icon larry-login">
				<input type="text" placeholder="账号" name="username"   class="login_txtbx" />
			</div>
			<div class="layui-pwd-icon larry-login">
				<input type="password" placeholder="密码" name="password" class="login_txtbx" />
			</div>
			
			<div class="layui-submit larry-login">
				<input type="submit" value="立即登陆" class="submit_btn" />
			</div>
			<div class="layui-login-text">
				<p>© 2019-2021 naumy 版权所有</p>
				<p>
					联系人邮箱 311544162@qq.com <a href="http://demo.larrycms.com" title=""></a>
				</p>
			</div>
		</form>

	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Ordermanagement/layui/lay/dest/layui.all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Ordermanagement/js/login.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Ordermanagement/js/jparticle.jquery.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".layui-canvs").jParticle({
				background : "#141414",
				color : "#E6E6E6"
			});
		});
	</script>
</body>
</html>