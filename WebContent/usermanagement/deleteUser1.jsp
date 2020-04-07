<%--用户删除验证代码 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "">
<title>Insert title here</title>
</head>
<body>
	<%
		//删除数据库中的一条记录，delete from users where id=?,所以打开处理页面时，需要传入对应的ID
		//(1)取出ID
		String id = request.getParameter("id");
		//(2)连接数据库，执行SQL语句
		//数据库连接
		Class.forName("com.mysql.cj.jdbc.Driver");
				 	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
				 			"root", "6253108310");

		String sqlstr = "delete from userss where userID=?";
		PreparedStatement ps = connect.prepareStatement(sqlstr);
		ps.setInt(1, Integer.parseInt(id));
		ps.executeUpdate();

		connect.close();
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection connect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
	 			"root", "6253108310");

		String sqlstr1 = "delete from users where userID=?";
		PreparedStatement ps1 = connect1.prepareStatement(sqlstr1);
		ps1.setInt(1, Integer.parseInt(id));
		ps1.executeUpdate();

		connect.close();
		//转入到用户管理页面
		response.sendRedirect("usermal1.jsp");
	%>
</body>
</html>