<%--�û���½������� --%>
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
		<div class="title">�������г�</div>
		<div class="tubiao">
			<img src="img/�̱�.png">
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<div class="wrap" id="wrap">
			<div class="logGet">
				<!-- ͷ����ʾ��Ϣ -->
				<div class="logD logDtip">
					<p class="p1">��¼</p>
				</div>
				<!-- ����� -->
				<div class="lgD">
					<img src="img/timg.jpg" width="20" height="20" alt="" /> <input
						type="text" name="username" placeholder="�����û���" />
				</div>
				<div class="lgD">
					<img src="img/����ͼ��.jpg" width="20" height="20" alt="" /> <input
						type="password" name="password" placeholder="�����û�����" />
				</div>
				<div class="logC">
					<input type="submit" class="btn01" value="��½" /> 
					<a	href="Register.jsp" class="one"> 
						<input type="button" class="btn02" value="ע��" />
					</a>
				</div>


			</div>
		</div>
	</form>
	<div class="footer" id="foot">
		<div class="copyright">
			<div class="img">
				<i class="icon"></i><span>��ϵ���䣺3111544162@qq.com.com</span>
			</div>

			<div class="img">
				<i class="icon2"></i><span>��ϵ�绰��18877165134</span>
			</div>

		</div>
	</div>

</body>
</html>
