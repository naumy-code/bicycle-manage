<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/Ordermanagement/css/main.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Ordermanagement/css/style.css" type="text/css" />
</head>
<body class="main">
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
	
	<div class="banner_x center">
		
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
		
	</div>
	
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:${order.id}</p>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>
												</tr>
											</table> 
											<c:forEach items="${order.orderItems}" var="item" varStatus="vs">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${vs.count }</td>
														<td width="40%">${item.p.name}</td>
														<td width="10%">${item.p.price }</td>
														<td width="10%">${item.buynum }</td>
														<td width="10%">${item.buynum*item.p.price }</td>
													</tr>
												</table>
											</c:forEach>
											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF0000">合计：&nbsp;&nbsp;${order.money}</font>
													</td>
												</tr>
											</table>
											<p>
												收货地址：${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												收货人：&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
												联系方式：${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;
											</p>
											<hr>
											<c:if test="${order.paystate != 1 }">
											<p style="text-align:right">
												<a href="${pageContext.request.contextPath}/Ordermanagement/pay.jsp?id=${order.id}&money=${order.money}">
													<img src="${pageContext.request.contextPath }/Ordermanagement/img/gif53_030.gif" width="204" height="51" border="0" /> 
												</a>
											</p>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<footer class="mt20 center">
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
	</footer>
</body>
</html>
