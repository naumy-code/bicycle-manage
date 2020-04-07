<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Group buying application/css/style.css" type="text/css" />
<title>确认支付</title>
</head>
<body>
	<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="http://www.mi.com/" target="_blank">自行车商城</a></li>

					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="${pageContext.request.contextPath}/findOrderByUser">我的订单</a>
				</div>
				<div class="fr">
					<ul>
						<li><a href="${pageContext.request.contextPath}/findOrderByUser" target="_blank">返回</a></li>

						<li>|</li>
						<li><a href="${pageContext.request.contextPath}/findOrderByUser">个人中心</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</header>

	<!-- 确认支付form -->
	<form action="${pageContext.request.contextPath }/orderstate" method="post" style="margin-left:500px;font-size:15px;">
		<h3>订单号：${orderid},付款金额 ：${money}</h3>
			<input type="hidden" name="orderid" value="${orderid}"/> 
			<input type="hidden" name="to" value="3420748513@qq.com"/> 
			<input type="hidden" name="from" value="3111544162@qq.com"/> 
			<input type="hidden" name="password" value="yumbwzjsooxydfah"/> 
			<input type="hidden" name="subject" value="自行车商城"/> 
			<input type="hidden" name="content" value="你购买的商品已支付成功"/> 
			<input type="submit" value="确认支付" />
	</form>
	
	<footer class="mt20 center">
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
	</footer>
</body>
</html>