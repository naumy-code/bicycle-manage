<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.wgh.UserForm"%>
<%
request.setCharacterEncoding("utf-8");
	String username=request.getParameter("username");
	boolean flag=true;
	Vector temp=(Vector)application.getAttribute("myuser");
	if(application.getAttribute("myuser")==null){
		temp=new Vector();
	}
	for(int i=0;i<temp.size();i++){
		UserForm tempuser=(UserForm)temp.elementAt(i);
		if(tempuser.username.equals(username)){
			out.println("<script language='javascript'>alert('���û��Ѿ���¼');window.location.href='index.jsp';</script>");
            flag=false;
        }

	}
	UserForm mylist=new UserForm();
	mylist.username=username;
	//���浱ǰ��¼���û���
	session.setAttribute("username",username);
	application.setAttribute("ul",username);

	Vector myuser=(Vector)application.getAttribute("myuser");
	if(myuser==null){
		myuser=new Vector();
	}

	if(flag){
		myuser.addElement(mylist);
	}
	application.setAttribute("myuser",myuser);
	response.sendRedirect("main.jsp");
%>