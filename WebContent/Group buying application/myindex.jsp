<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>自行车商城-个人中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Group buying application/css/style.css" type="text/css" />
<script type="text/javascript">
	//删除订单
	function o_del() {
		var msg = "您确定要删除该订单吗？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
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
	<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
			<div class="lfnav fl">
				<div class="ddzx">订单中心</div>
				<div class="subddzx">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/findOrderByUser"
							style="color: #ff6700; font-weight: bold;">我的订单</a></li>
						<li><a href="${pageContext.request.contextPath}/findMessageByUser">我的留言</a></li>
						<li><a href="${pageContext.request.contextPath}/findgroupOrderByUser">团购订单</a></li>
						<li><a href="">评价晒单</a></li>
					</ul>
				</div>
				<div class="ddzx">个人中心</div>
				<div class="subddzx">
					<ul>
						<li><a href="./self_info.html">我的个人中心</a></li>
						<li><a href="">消息通知</a></li>
						<li><a href="">收货地址</a></li>
					</ul>
				</div>
			</div>
			<div class="rtcont fr">
				<div class="ddzxbt">交易订单</div>
				<p>
					共有<font style="color: #FF0000">${orders.size()}</font>订单
				</p>
				<c:forEach items="${orders}" var="order">
					<div class="ddxq">
						<div class="ddbh fl">${order.id}</div>
						<div class="ztxx fr">
							<ul>
								<li>${order.ordertime}</li>
								<li>${order.receiverName}</li>
								<li>${order.paystate==0?"未支付":"已支付"}</li>
								<li><a
									href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">查看</a>&nbsp;&nbsp;
									<c:if test="${order.paystate==0 }">
										<a
											href="${pageContext.request.contextPath}/delOrderById?id=${order.id}"
											onclick="javascript:return o_del()">刪除</a>
									</c:if> <c:if test="${order.paystate!=0 }">
										<a
											href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client"
											onclick="javascript:return o_del()">刪除</a>
									</c:if></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- self_info -->

	<footer class="mt20 center">
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
	</footer>
</body>
</html>