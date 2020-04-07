<%--用户登陆界面代码 --%>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>Insert title here</title>
</head>
<link href="css/login.css" type="text/css" rel="stylesheet" />
<style type="text/css">
#wrap {
	height: 700px;
	width: 100%;
	background-image: url(img/f6fcefba493755882517d7b329743365.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	position: relative;
}
</style>
</head>
<body>
	<div class="header" id="head">
		<div class="title">永久自行车</div>
		<div class="tubiao">
			<img src="img/商标.png">
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<div class="wrap" id="wrap">
			<div class="logGet">
				<!-- 头部提示信息 -->
				<div class="logD logDtip">
					<p class="p1">登录</p>
				</div>
				<!-- 输入框 -->
				<div class="lgD">
					<img src="img/timg.jpg" width="20" height="20" alt="" /> <input
						type="text" name="username" placeholder="输入用户名" />
				</div>
				<div class="lgD">
					<img src="img/密码图标.jpg" width="20" height="20" alt="" /> <input
						type="password" name="password" placeholder="输入用户密码" />
				</div>
				<div class="logC">
					<input type="submit" class="btn01" value="登陆" /> 
					<a	href="Register.jsp" class="one"> 
						<input type="button" class="btn02" value="注册" />
					</a>
				</div>


			</div>
		</div>
	</form>
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
