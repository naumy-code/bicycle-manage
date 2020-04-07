<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<%@ page import="com.store.domain.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>我的购物车</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ShoppingCart/css/style.css"
	type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/Ordermanagement/js/order.js"></script>
<script>
	//当商品数量发生变化时触发该方法
	function changeProductNum(count, totalCount, id) {
		count = parseInt(count);
		totalCount = parseInt(totalCount);
		//如果数量为0，判断是否要删除商品
		if (count == 0) {
			var flag = window.confirm("确认删除商品吗?");

			if (!flag) {
				count = 1;
			}
		}
		if (count > totalCount) {
			alert("已达到商品最大购买量");
			count = totalCount;
		}
		location.href = "${pageContext.request.contextPath}/changeCart?id="
				+ id + "&count=" + count;
	}
	//删除购物车中的商品
	function cart_del() {
		var msg = "您确定要删除该商品吗？";
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
	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">


		<div class="wdgwc fl ml40">我的购物车</div>
		<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div class="dlzc fr">
			<%
				User user = (User) request.getSession().getAttribute("user");
				if (null == user) {
			%>
			| <a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a>
			| <a href="/newproject/usermanagement/login.jsp">用户登陆</a>
			<%
				} else {
			%>
			| <a href="${pageContext.request.contextPath}/logout"
				onclick="javascript:return confirm_logout()">用户退出</a> | <a
				href="${pageContext.request.contextPath}/findOrderByUser">个人中心</a> |
			欢迎您： ${user.username}
			<%
				}
			%>

		</div>
		<div class="clear"></div>
	</div>
	<div class="xiantiao"></div>
	<form id="orderForm" action="${pageContext.request.contextPath}/createOrder" method="post">
	<div class="gwcxqbj">
		<div class="gwcxd center">
			<div class="top2 center">
				<div class="sub_top fl">
					<input type="checkbox" value="quanxuan" class="quanxuan" />全选
				</div>
				<div class="sub_top fl">商品名称</div>
				<div class="sub_top fl">单价</div>
				<div class="sub_top fl">数量</div>
				<div class="sub_top fl">小计</div>
				<div class="sub_top fr">操作</div>
				<div class="clear"></div>
			</div>
			<!-- 循环输出商品信息 -->
			<c:set var="total" value="0" />
			<c:forEach items="${cart}" var="entry" varStatus="vs">
				<div class="content2 center">
					<div class="sub_content fl ">
						<input type="checkbox" value="quanxuan" class="quanxuan" />
					</div>
					<div class="sub_content fl">
						<img src="./image/小米8白色.jpg">
					</div>
					<div class="sub_content fl ft20">${entry.key.name }</div>
					<div class="sub_content fl ">${entry.key.price }</div>
					<div class="sub_content fl">
						<input class="shuliang" type="number" value="${entry.value}"
							step="1" min="1">
					</div>


					<div class="sub_content fl">${entry.key.price*entry.value}</div>
					<div class="sub_content fl">
						<a
							href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0">×</a>
					</div>
					<div class="clear"></div>
				</div>
				<c:set value="${total+entry.key.price*entry.value}" var="total" />
			</c:forEach>
		</div>
		<div class="jiesuandan mt20 center">
			<div class="tishi fl ml20">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/showProductByPage">继续购物</a></li>

					<div class="clear"></div>
				</ul>
			</div>
			<div class="jiesuan fr">
				<div class="jiesuanjiage fl">
					合计（不含运费）：<span>${total}</span>
				</div>
				<a href="dingdanzhongxin.html"><div class="jsanniu fr">
						<input class="jsan" type="submit" name="jiesuan" value="去结算" />
					</div></a>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<p>
		收货地址：<input id="receiverAddress" name="receiverAddress" type="text"
			value="" style="width: 350px" onkeyup="checkReceiverAddress();" />
		&nbsp;&nbsp;&nbsp;&nbsp; <span id="receiverAddressMsg"></span> <br />
		收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName"
			name="receiverName" type="text" value="${user.username}"
			style="width: 150px" onkeyup="checkReceiverName();" /> <span
			id="receiverNameMsg"></span> &nbsp;&nbsp;&nbsp;&nbsp; <br /> 联系方式：<input
			type="text" id="receiverPhone" name="receiverPhone"
			value="${user.telephone}" style="width: 150px"
			onkeyup="checkReceiverPhone();" /> <span id="receiverPhoneMsg"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	</form>
	<hr />

	<!-- footer -->
	<footer class="mt20 center">
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
	</footer>

</body>
</html>
