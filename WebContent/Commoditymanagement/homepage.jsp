<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*,java.text.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Commoditymanagement/css/homepage/body.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Commoditymanagement/css/homepage/lunbo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Commoditymanagement/css/homepage/shangping.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Commoditymanagement/css/homepage/shanpijn.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Commoditymanagement/css/homepage/sosuo.css" />
<style type="text/css">

</style>
</head>
<body class="main">
	<%@include file="/Commoditymanagement/head.jsp"%>
	<!--菜单-->
	<div id="divmenu">
		<a href="#">首页</a> 
		<a href="#">自行车</a>
		<a href="#">山地车</a> <a href="#">折叠车</a> <a href="#">公路车</a>
		<a href="#">通勤车</a> <a href="#">骑行装备</a> <a href="#">青少年自行车</a> 
		<a href="#">儿童自行车</a> <a href="#">平衡车</a> <a href="#">电动车</a> 
		<a href="${pageContext.request.contextPath}/showgroupProductByPage">查看今日团购商品</a> 
		<a href="${pageContext.request.contextPath}/showProductByPage" style="color:#b4d76d">全部商品目录</a>		

	</div>




	<!--中部-->
	<div id="container">
		<div id="photo">
			<img src="img/4f3474fc02b1854e.jpg"> <img
				src="img/85f4889e1a675930.jpg"> <img
				src="img/4f3474fc02b1854e.jpg">
		</div>
	</div>
	<div id="leixing">
		<img src="img/6580ae829d91070a.jpg" style="width:1600px" />
	</div>
	<div id="jieshao">
		<img src="img/588f9c6cf2c51a1a.jpg" style="width:100%;"/> <img
			src="img/53386c96db8f62ff.jpg" style="width:95%;"/> <img
			src="img/e597046dc6f95ace.jpg" style="width:95%;"/> <img
			src="img/2b885c5d1b13f985.jpg" style="width:95%;"/>
	</div>
	<hr color="black" align="right" size="2" width:"100%"/>
	<!--商品-->
	<%String id = "26ddd0c6-d7f2-4a83-b01b-286bb8c38420";String id1 = "3a0196b2-71c1-4d4d-a4e8-d1f875096f00";String id2 = "4dbac6bb-ac2a-4ea0-a62f-ea5a2fc2b3c2";%>
	<div id="bic">
		<ul>
		<a href="${pageContext.request.contextPath}/findProductById?id=<%=id%>">
			<li>
				<!--商品列表-->
				<div class="commodity" >
					<div>
						<img src="img/6.jpg" />
					</div>
					<div class="p-price">
						<strong>
							<h1>￥1399.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>
							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>3.8万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div>
			</li>
		</a>
		<a href="${pageContext.request.contextPath}/findProductById?id=<%=id1%>">
			<li><div class="commodity">
					<div>
						<img src="img/7.jpg">
					</div>
					<div class="p-price">
						<strong>
							<h1>￥998.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>

							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>2.1万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div></li>
			</a>
			<a href="${pageContext.request.contextPath}/findProductById?id=<%=id1%>">
			<li><div class="commodity">
					<div>
						<img src="img/7.jpg">
					</div>
					<div class="p-price">
						<strong>
							<h1>￥899.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>

							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>3.8万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div></li>
				</a>
		</ul>
	</div>
	<hr color="black" align="right" size="2" width:"100%"/>
	<div id="bic">
		<ul>
		<a href="${pageContext.request.contextPath}/findProductById?id=<%=id1%>">
			<li><div class="commodity">
					<div>
						<img src="img/7.jpg">
					</div>
					<div class="p-price">
						<strong>
							<h1>￥899.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>

							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>3.8万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div></li>
				</a>
				<a href="${pageContext.request.contextPath}/findProductById?id=<%=id2%>">
			<li><div class="commodity">
					<div>
						<img src="img/9.jpg">
					</div>
					<div class="p-price">
						<strong>
							<h1>￥658.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>

							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>3.8万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div></li>
				</a>
				<a href="${pageContext.request.contextPath}/findProductById?id=<%=id2%>">
			<li><div class="commodity">
					<div>
						<img src="img/8.jpg">
					</div>
					<div class="p-price">
						<strong>
							<h1>￥898.00</h1>
						</strong>
					</div>
					<div class="miaoshu">
						<strong>

							<p>
								永久自行车"Forver27变苏自行车山地车27.5寸合金/公路车男女学生成人单车" <br />
							</p>
							<h3>3.8万+条评论</h3>
							<h2>永久自行车专卖店</h2>
						</strong>
					</div>
				</div></li>
				</a>
		</ul>
	</div>

<hr color="black" align="right" size="2" width:"100%"/>
	<%@ include file="foot.jsp" %>
</body>
</html>