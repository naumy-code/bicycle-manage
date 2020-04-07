<%--用户注册验证代码 --%>
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
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		//把注册信息取到变量
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");

		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
	 			"root", "6253108310");
		String sql = "insert into userss(userID,username,userpassword,gender,email,telephone) values(?,?,?,?,?,?)";
		PreparedStatement ps=connect.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, username);
		ps.setString(3, password);
		ps.setString(4, gender);
		ps.setString(5, email);
		ps.setString(6, telephone);

		ps.executeUpdate();
		out.println("输入成功！");
		connect.close();
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection connect1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bicycle_database?serverTimezone=GMT",
	 			"root", "6253108310");
		String sql1 = "insert into users(userID,username,userpassword,gender,email,telephone) values(?,?,?,?,?,?)";
		PreparedStatement ps1=connect1.prepareStatement(sql1);
		ps1.setString(1, id);
		ps1.setString(2, username);
		ps1.setString(3, password);
		ps1.setString(4, gender);
		ps1.setString(5, email);
		ps1.setString(6, telephone);

		ps1.executeUpdate();
		out.println("输入成功！");
		connect1.close();
		//转入到用户管理页面
		//out.println("<script type='text/javascript'>alert('注册成功!');</script>");
		response.sendRedirect("usermal1.jsp");
	%>
</body>
</html>