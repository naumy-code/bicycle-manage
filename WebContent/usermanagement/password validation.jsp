<%--用户管理界面代码 --%>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/body.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<style type="text/css">
body{
      margin:0px;
      background-size:100% 100%;
      background-attachment:fixed;
}
#content {
	height: 440px;
	width: 500px;
	margin-top: 30px;
	margin-left:370px;
	text-align: center;
}

table {
	margin-right:50px;
}

td {
font-size:20px;
	text-align: center;
}

h1 {
	text-align: center;
	font-size:20px;
}
</style>
</head>

<body>
	<%
	
		//数据库连接
		
		ResultSet set;
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String tel = request.getParameter("tel");
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
	 			"root", "6253108310");
		Statement stmt = connect.createStatement();
		String sqlstr = "select * from users where userID ="+ id + " and telephone =" + tel;
		PreparedStatement ps=connect.prepareStatement(sqlstr);
		set = ps.executeQuery();
		
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
		<a href="/newproject/Commoditymanagement/homepage.jsp">首页</a> <a href="login.jsp">用户登录</a> <a href="Register.jsp">用户注册</a> <a href="Modifyinfomation.jsp">用户修改信息</a>
		<a href="Retrieve password.jsp">找回密码</a> <a href="#" style="color: #FFFF00">全部目录</a>
	</div>
	
	<div id="content">
		<h1 font-size="20px">用户密码已找回</h1>
		<table width="1000"   border="1" cellpadding="0" cellspacing="0">
			<tr height="30">
				<td height="40">账号</td>
				<td height="40">用户名</td>
				<td height="40">密码</td>
			</tr>
			<%
				int i = 0;
				while (set.next()) {
				String id1=set.getString("userID");
				String na=set.getString("username");
				String pass=set.getString("userpassword");
				i++;
				//ID获取
				//String id=rs.getString("id");
			%>
			<tr>
				<td><%=id1%></td>
				<td><%=na%></td>
				<td><%=pass%></td>
				
				
			</tr>
			
			<%
				}
				if (i==0) {
					%><script>alert("您输入的数据不正确，找回密码失败！")
					window.location.href="Retrieve password.jsp"
					</script>;<%
				}
			%>
			<%
				connect.close();
			%>
		</table>
		
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