<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/homepage/body.css" />
<link rel="stylesheet" href="css/homepage/lunbo.css" />
<link rel="stylesheet" href="css/homepage/shangping.css" />
<link rel="stylesheet" href="css/homepage/shanpijn.css" />
<link rel="stylesheet" href="css/homepage/sosuo.css" />
<style type="text/css">

</style>
</head>
<body class="main">
	<!-- 1.自行车顶部 start -->
	<div class="header">
		<table cellspacing="0" class="headtable">
			<tr>
				<td><a href="#"> <img src="img/商标.png" />
				</a></td>
				<td style="text-align: right"><img src="img/cart.gif"
					width="26" height="23" style="margin-bottom: -4px" />&nbsp; <a
					href="/newproject/ShoppingCart/Compurchase.jsp">查看商品</a></br>
				<a href="/newproject/chartroom/main.jsp">如有疑问?可以联系客服!</a>
					</br>	 
					
						
					 </br> 
					  | <a href="/newproject/Ordermanagement/Backstagelanding/login.jsp">后台登录</a>
					  | <a href="/newproject/Commoditymanagement/login.jsp">商家登录</a>
					  
					  </td>
			</tr>
		</table>
	</div>
	<!--菜单-->
	<div id="divmenu">
		<a href="#">首页</a> <a href="#">山地车</a> <a href="#">折叠车</a> <a href="#">公路车</a>
		<a href="#">通勤车</a> <a href="#">骑行装备</a> <a href="#">青少年自行车</a> 
		<a href="#">儿童自行车</a> <a href="#">平衡车</a> <a href="#">电动车</a> 
		<a href="/newproject/ShoppingCart/Compurchase.jsp">查看本店全部商品</a> 
		<a href="#" style="color: #FFFF00">全部商品目录</a>

	</div>


	<div id="box">
		<form action="/newproject/Commoditymanagement/Commodity search.jsp" method="post"
			onsubmit="return checkForm();">
			<input type="text" name="category" id="category" placeholder="请输入关键字">
			<input id="search" type="submit" value="查询">
		</form>
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
	<%int id = 12001;int id1 = 12002;int id2 = 12003;%>
	<div id="bic">
		<ul>
		<a href="/newproject/ShoppingCart/shangpin.jsp?id=<%=id%>">
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
		<a href="/newproject/ShoppingCart/shangpin.jsp?id=<%=id2%>">
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
			<a href="/newproject/ShoppingCart/shangpin.jsp?id=<%=id1%>">
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
		<a href="/newproject/ShoppingCart/Compurchase.jsp">
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
				<a href="/newproject/ShoppingCart/Compurchase.jsp">
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
				<a href="/newproject/ShoppingCart/Compurchase.jsp">
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
	<!--尾部-->
	<div class="tail">
		<img src="img/底层.png" />
	</div>
	<div class="footer" id="foot" style="blackground:black;">
		<div class="copyright">
			<div class="img">
				<i class="icon"></i><span style="color: #fff;">联系邮箱：3111544162@qq.com.com</span>
			</div>

			<div class="img">
				<i class="icon2"></i><span style="color: #fff;">联系电话：18877165134</span>
			</div>

		</div>
	</div>
</body>
</html>