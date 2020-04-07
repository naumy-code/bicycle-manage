<%@ page contentType="text/html; charset=gb2312" language="java"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.wgh.UserForm"%>
<%
	Vector temp=(Vector)application.getAttribute("myuser");
	for(int i=0;i<temp.size();i++){
		UserForm mylist=(UserForm)temp.elementAt(i);
		if(mylist.username.equals(session.getAttribute("username"))){
			temp.removeElementAt(i);
			session.setAttribute("username","null");
		}
		if(temp.size()==0){
				application.removeAttribute("message");
		}
	}
	response.sendRedirect("index.jsp");
%>