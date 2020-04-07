<%--用户修改界面验证代码 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		//1.接收修改后的数据
		
		
		String pass = "123456";
		

		//2.更新数据库中的数据，update users set name=?,age=?,img=? where id=?
		//数据库连接
		Class.forName("com.mysql.cj.jdbc.Driver");
				 	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
				 			"root", "6253108310");

		String sqlstr = "update users set userpassword=?";
		PreparedStatement ps = connect.prepareStatement(sqlstr);
		
		ps.setString(1, pass);
		
		
		
		

		ps.executeUpdate();

		connect.close();
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection connect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
	 			"root", "6253108310");

		String sqlstr1 = "update userss set userpassword=?";
		PreparedStatement ps1 = connect1.prepareStatement(sqlstr1);
		
		ps1.setString(1, pass);
		
		
		
		

		ps1.executeUpdate();

		connect.close();
		%><script>alert("重置密码成功！")
		window.location.href="usermal.jsp"
		</script>;<%
		//转入到用户管理页面
		
	%>
</body>
</html>