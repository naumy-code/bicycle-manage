<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="com.store.domain.User" import="java.util.*,java.text.*" %>
<link rel="stylesheet" href="css/homepage/body.css" />
<script type="text/javascript">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
//退出确认框
function confirm_logout() {   
    var msg = "您确定要退出登录吗？";   
    if (confirm(msg)==true){   
    return true;   
    }else{   
    return false;   
    }   
} 

</script>
<script type="text/javascript">
	window.onload=showClockInfo;
	function showClockInfo(){
		var xmlHttp;
		if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}catch (e){
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}catch (e){
					
				}
			}
		}
		
		if(!xmlHttp){
			alert("不能创建");
			return false;
		}
		 
		window.setInterval(
			function(){
				xmlHttp.open("GET","info.jsp",true);
				xmlHttp.onreadystatechange=function(){
					if(xmlHttp.readyState==4){
						if(xmlHttp.status==200){
							document.getElementById("clockinfor").innerHTML=xmlHttp.responseText;
						}
					}
				}
				xmlHttp.send();
			}
				,1);	
				
		
	}

</script>

   <%
     int num=0;
     if(application.getAttribute("num")==null){
    	 num=1;
     }else{
    	 String str=application.getAttribute("num").toString();
    	 num=Integer.parseInt(str);
    	 if(session.isNew()){
    		 num++;
    	 }
     }
     application.setAttribute("num",num);
 %>
<div class="header">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath }/index.jsp">
					<img src="img/商标.png" />
				</a>
			</td>
			
					<div class="clear"></div>
			<td style="text-align:right">
					
				<img src="${pageContext.request.contextPath}/Commoditymanagement/img/cart.gif" />
				   &nbsp;
				  <a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a> 
				| <a href="/newproject/chartroom/index.jsp">如有疑问?可以联系客服!</a>
				| <a href="/newproject/Ordermanagement/login.jsp">商家登陆</a>
				
				<% 
				User user = (User) request.getSession().getAttribute("user");
				
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a>		
				| <a href="/newproject/Ordermanagement/login.jsp">用户登陆</a>	
				<% 	
				}else{
				%>
				
				| <a href="${pageContext.request.contextPath}/logout" onclick="javascript:return confirm_logout()">用户退出</a>
				| <a href="${pageContext.request.contextPath}/findOrderByUser">个人中心</a></br>
				<a>您是第<%=num %>位访客！</a>
				<div id="clockinfor"></div>
				<br><br><br>欢迎您： ${user.username}
				<% 	
				}
				%>			
			</td>		
		</tr>
	</table>
</div>