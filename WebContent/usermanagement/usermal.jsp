<%--用户管理界面代码 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link href="css/body.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<style type="text/css">
body{
      background-image: url(img/c.jpg) ;
      margin:0px;
      background-size:100% 100%;
      background-attachment:fixed;
}
#content {
	height: 440px;
	width: 700px;
	margin-top: 30px;
	margin-left:370px;
	text-align: center;
}

table {
	margin-right:50px;
	background-color: #999;
}

td {
font-size:20px;
	text-align: center;
}

h1 {
	text-align: center;
	font-size:30px;
}
</style>
</head>

<body>
	<%
		//数据库连接
		Class.forName("com.mysql.cj.jdbc.Driver");
				 	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
				 			"root", "6253108310");
		Statement stmt = connect.createStatement();
		String sqlstr = "SELECT * FROM users";
		ResultSet rs = stmt.executeQuery(sqlstr);
	%>
<!-- 1.自行车顶部 start -->
	<div class="header">
		<table1 cellspacing="0" class="headtable">
			<tr>
				<td><a href="#"> <img src="img/商标.png" />
				</a></td>
				
			</tr>
		</table1>
	</div>
	<!--菜单-->
	<div id="divmenu">
		<a href="/newproject/Commoditymanagement/homepage.jsp">首页</a> <a href="login.jsp">用户登录</a> <a href="Register.jsp">用户注册</a> <a href="usermal1.jsp">用户修改信息</a>
		<a href="Retrieve password.jsp">找回密码</a> <a href="#" style="color: #FFFF00">全部目录</a>
	</div>
	<div id="divsearch">
		<form action="usermal2.jsp" id="searchform">
			<table width="100%" height="50px" border="0" cellspacing="0">
				<tr height="50px">
					<td style="text-align: right; padding-right: 220px">查询用户
						<input type="text" id="id" name="id" placeholder="请输入类型关键字">
						<input id="search" type="submit" value="查询">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="content">
		<h1 font-size="20px">用户管理</h1>
		<table width="1000"   border="1" cellpadding="0" cellspacing="0">
			<tr height="60">
				<td height="40">账号</td>
				<td height="40">用户名</td>
				<td height="40">密码</td>
				<td height="40">性别</td>
				<td height="40">邮箱</td>
				<td height="40">电话号码</td>
				<td height="40">操作</td>
			</tr>
			<%
			
				while (rs.next()) {
				String id=rs.getString("userID");
				String na=rs.getString("username");
				String pass=rs.getString("userpassword");
				String gen=rs.getString("gender");
				String email=rs.getString("email");
				String tel=rs.getString("telephone");
				
				//ID获取
				//String id=rs.getString("id");
			%>
			<tr>
				<td><%=id%></td>
				<td><%=na%></td>
				<td>******</td>
				<td><%=gen%></td>
				<td><%=email%></td>
				<td><%=tel%></td>
				<td>
				<a href="updatepassword.jsp?pass=<%=pass %>">重置密码</a>
                </td>
				
			</tr>
			<%
				}
			%>
			<%
				connect.close();
			%>
		</table>
		<a href="login.jsp">用户登陆</a>
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
</html>