<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Group buying application/css/style.css" type="text/css" />

	</head>
	<body>
	<!-- start header -->
		<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="${pageContext.request.contextPath}/Commoditymanagement/homepage.jsp" target="_blank">自行车商城</a></li>

					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="${pageContext.request.contextPath}/findOrderByUser">我的订单</a>
				</div>
				<div class="fr">
					<ul>
						<li><a href="${pageContext.request.contextPath}/Commoditymanagement/homepage.jsp" target="_blank">返回</a></li>

						<li>|</li>
						<li><a href="${pageContext.request.contextPath}/findOrderByUser">个人中心</a></li>
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

	
	<!-- xiangqing -->
	<form action="post" method="">
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">${p.name}</div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				
				<li>|</li>
				<li><a href="${pageContext.request.contextPath }/vote/index.jsp">我要投票</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/findMessageById?id=${p.id}">用户评价</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath }/MessageBoard/addmessage.jsp?id=${p.id}">我要留言</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img src="${pageContext.request.contextPath}${p.imgurl}" width="560" height="560" border="0" /></div>
		<div class="right fr">
			<div class="h3 ml20 mt20">${p.name}</div>
			<div class="jianjie mr40 ml20 mt10">${p.description}</div>
			<div class="jiage ml20 mt10">${p.price}元</div>
			<div class="ft20 ml20 mt20">类别：${p.category }</div>
			
			
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl">${p.name}</div>
					<div class="right1 fr">${p.price}元</div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc">总计：${p.price}元</div>
			</div>
			
			<div class="xiadan ml20 mt20">
					<a href="${pageContext.request.contextPath}/addCart?id=${p.id}"> <input class="jrgwc" type="button" name="jrgwc" value="加入购物车" /></a>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
	<!-- footer -->
	<footer class="mt20 center">
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
	</footer>

	</body>
</html>

