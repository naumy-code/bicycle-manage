
<%--�û�ע�������� --%>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="css/Register.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="css/body.css" />

</head>
<body>
<div class="header" id="head">
		<div class="title">�������г�</div>
		<div class="tubiao">
			<img src="img/�̱�.png">
		</div>
	</div>
	<div id="divmenu">
		<a href="/newproject/Commoditymanagement/homepage.jsp">��ҳ</a>
			<a href="#">ɽ�س�</a>
			<a href="#">�۵���</a>
			<a href="#">��·��</a>
			<a href="#">ͨ�ڳ�</a>
			<a href="#">����װ��</a>
			<a href="#">���������г�</a>
			<a href="#">��ͯ���г�</a>
			<a href="#">ƽ�⳵</a>
			<a href="#">�綯��</a>
			<a href="#">��Ʒ����</a>
			<a href="#" style="color:#FFFF00">ȫ����ƷĿ¼</a>		
</div>
	<!-- 3.��������û�ע��  start -->
	<div id="divcontent" align="center">
		<form action="Registration verification.jsp" method="post" onsubmit="return checkForm();">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 80px" ><h1>�»�Աע��</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">�˺ţ�</td>
								<td style="width: 40%">
								<input type="text" class="textinput"  id="id" name="id"/>
								</td>
								<td colspan="2"><span id="emailMsg"></span><font color="#999999">�������½ʱ�õ��˺�</font></td>
							</tr>
							<tr>
								<td style="text-align: right">��Ա����</td>
								<td><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
								</td>
							</tr>
							<tr>
								<td style="text-align: right">���룺</td>
								<td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
								<td><span id="passwordMsg"></span><font color="#999999">����������6-16λ�ַ�</font></td>
							</tr>
							
							<tr>
								
							<td style="text-align: right">�Ա�</td>
								<td colspan="2">&nbsp;&nbsp;
                                <input type="radio" id="gender" name="gender" value="��" checked="checked" /> ��
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="gender" name="gender" value="Ů" /> Ů
								</td>
								<td>&nbsp;</td> 
								
							</tr>
							
							<tr>
								<td style="text-align: right; width: 20%">��Ա���䣺</td>
								<td style="width: 40%">
								<input type="text" class="textinput"  id="email" name="email" onkeyup="checkEmail();"/>
								</td>
								<td colspan="2"><span id="emailMsg"></span><font color="#999999">��������Ч�������ַ</font></td>
							</tr>
							<tr>
								<td style="text-align: right">��ϵ�绰��</td>
								<td colspan="2">
								<input type="text" class="textinput"
									style="width: 350px" id="telephone" name="telephone" />
								</td>
								<td>&nbsp;</td>
							</tr>
							
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center">
									<input type="image" src="img/signup.gif" name="submit" border="0"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
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