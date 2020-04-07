<%--用户修改界面代码 --%>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/login.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="css/body.css" />

</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		//接收上一个页面传递 过来的信息
		String id = request.getParameter("id");
		String na = request.getParameter("na");
		String pass = request.getParameter("pass");
		String gen = request.getParameter("gen");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
	%>
	<!-- 3.网上书城用户注册  start -->
	<div class="header" id="head">
		<div class="title">永久自行车</div>
		<div class="tubiao">
			<img src="img/商标.png">
		</div>
	</div>
	<div id="divmenu">
		<a href="#">首页</a> <a href="#">山地车</a> <a href="#">折叠车</a> <a href="#">公路车</a>
		<a href="#">通勤车</a> <a href="#">骑行装备</a> <a href="#">青少年自行车</a> <a
			href="#">儿童自行车</a> <a href="#">平衡车</a> <a href="#">电动车</a> <a
			href="#">新品上市</a> <a href="#" style="color: #FFFF00">全部商品目录</a>
	</div>
	<div id="divcontent" align="center">
		<form action="Modify.jsp" method="post" onsubmit="return checkForm();">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 80px"><h1>会员修改信息</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">账号：</td>
								<td style="width: 40%"><input type="text" class="textinput"
									id="id" name="id" value="<%=id%>" /></td>
								<td colspan="2"><span id="emailMsg"></span><font
									color="#999999">请输入账号</font></td>
							</tr>
							<tr>
								<td style="text-align: right">会员名：</td>
								<td><input type="text" class="textinput" 
									name="username" value="<%=na%>"  /></td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput" 
									name="password" value="<%=pass%>" /></td>
								<td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
							</tr>

							<tr>

								<td style="text-align: right">性别：</td>
								<td colspan="2">&nbsp;&nbsp; <input type="radio"
									id="gender" name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									id="gender" name="gender" value="女" /> 女
								</td>
								<td>&nbsp;</td>

							</tr>

							<tr>
								<td style="text-align: right; width: 20%">会员邮箱：</td>
								<td style="width: 40%"><input type="text" class="textinput"
									id="email" name="email" value="<%=email%>"
									/></td>
								<td colspan="2"><span id="emailMsg"></span><font
									color="#999999">请输入有效的邮箱地址</font></td>
							</tr>
							<tr>
								<td style="text-align: right">联系电话：</td>
								<td colspan="2"><input type="text" class="textinput"
									style="width: 350px" id="telephone" name="telephone"
									value="<%=tel%>" /></td>
								<td>&nbsp;</td>
							</tr>

						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center"><input
									type="image" src="img/signup.gif" name="submit" border="0" /></td>
							</tr>
						</table></td>
				</tr>
			</table>
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


	</div>
</html>