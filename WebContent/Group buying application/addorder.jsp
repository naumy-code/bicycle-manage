<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>传智学员信息登记表</title>
<link rel="stylesheet" href="css/addorder/style.css" />
<link rel="stylesheet" href="css/addorder/body.css" />
<link href="css/addorder/Register.css" type="text/css" rel="stylesheet" />
<link href="css/addorder/login.css" type="text/css" rel="stylesheet" />
<style type="text/css">
	.bg{
	margin-left: 200px;
	width:1300px;
	height:617px;
	background:url(css/QQ截图20190626051258.png) no-repeat;            /*添加背景图片*/
	position:relative;                                       /*设置相对定位*/
	}
	
</style>
</head>
<body>
<div class="header">
		<table cellspacing="0" class="headtable">
			<tr>
				<td><a href="#"> <img src="img/商标.png" />
				</a></td>
				<td style="text-align: right"><img src="img/cart.gif"
					width="26" height="23" style="margin-bottom: -4px" />&nbsp; <a
					href="/newproject/ShoppingCart/Compurchase.jsp">购物车</a> 
					 | <a
					href="/newproject/Commoditymanagement/Comanagement.jsp">商品管理</a></td>
			</tr>
		</table>
	</div>
	<div id="divmenu">
		<a href="/newproject/usermanagement/homepage.jsp">首页</a>
			<a href="#">山地车</a>
			<a href="#">折叠车</a>
			<a href="#">公路车</a>
			<a href="#">通勤车</a>
			<a href="#">骑行装备</a>
			<a href="#">青少年自行车</a>
			<a href="#">儿童自行车</a>
			<a href="#">平衡车</a>
			<a href="#">电动车</a>
			<a href="/newproject/ShoppingCart/Compurchase.jsp">查看本店全部商品</a> 
			<a href="#" style="color:#FFFF00">全部商品目录</a>		
</div>

<%String price = request.getParameter("price"); // 商品id %>

<div class="bg">
    <form  method="post" autocomplete="off"  action="${pageContext.request.contextPath}/creategroupOrder">
    <h2>用户添加团购收货信息</h2>
    <p><span>价格：</span><input type="text" id="price" name="price" value="<%=price%>"  />（必须填写）</p>
    <p><span>收货地址：</span><input type="text" id="address" name="address"/>（必须填写）</p>
    <p><span>收货人姓名：</span><input type="text" id="name" name="name" value="${user.username}" />（必须填写）</p>
    <p><span>收货电话：</span><input type="text" id="telephone" name="telephone"  value="${user.telephone}"/>（必须填写）</p>
    <input type="hidden" id="id" name="id"  value="${user.id}"/>
    <input type="hidden" name="to" value="3420748513@qq.com"/> 
	<input type="hidden" name="from" value="3111544162@qq.com"/> 
	<input type="hidden" name="password" value="yumbwzjsooxydfah"/> 
	<input type="hidden" name="subject" value="自行车商城"/> 
	<input type="hidden" name="content" value="恭喜你，你的团购订单已提交"/> 
   
    <p class="btn">
    <input type="submit" value="购买"/>
    <a href="shangpin.jsp">
    	<input type="button" value="取消" />
    </a>
    </p>
    </form>
</div>


<div class="footer" id="foot">
  <div class="copyright">
    <div class="img">
		<i class="icon"></i><span>联系邮箱：3111544162@qq.com.com</span>
	</div>
	
	<div class="img">
	  <i class="icon2"></i><span>联系电话：18877165134</span>
	</div>
 
  </div>
</div>
</body>
</html>