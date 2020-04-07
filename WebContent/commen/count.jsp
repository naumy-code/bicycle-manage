<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
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
   <h1 align="center">
       您是第<%=num %>位访客！
   </h1>
</body>
</html>