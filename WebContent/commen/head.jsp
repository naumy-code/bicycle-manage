<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="order by dede58.com" />
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Group buying application/css/style.css"
	type="text/css" />
</head>
<body>
	<!-- start header -->
	<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/Commoditymanagement/homepage.jsp"
						target="_blank">自行车商城</a></li>
					
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="${pageContext.request.contextPath}/findOrderByUser">我的订单</a>
				</div>
				<div class="fr">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/Commoditymanagement/homepage.jsp"
							target="_blank">返回</a></li>

						<li>|</li>
						<li><a
							href="${pageContext.request.contextPath}/findOrderByUser">个人中心</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</header>
	<!--end header -->
	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		<a href="liebiao.html"><div class="ad_top fl"></div></a>
		<div class="nav fl">
			<ul>
				<li><a href="">山地车</a></li>
				<li><a href="">儿童自行车</a></li>
				<li><a href="">折叠车</a></li>
				<li><a href="">平衡车</a></li>
				<li><a href="">青少年自行车</a></li>
				<li><a href="">户外工具</a></li>
				<li><a href="">服务</a></li>
				<li><a href="">社区</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="" method="post">
				<div class="text fl">
					<input type="text" class="shuru" placeholder="">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索" />
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end banner_x -->
</body>
</html>