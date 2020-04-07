<%@ page contentType="text/html; charset=utf-8"%>
<%
  String message=(String)session.getAttribute("mes");
  session.invalidate();
%>
<html>
	<%@include file="/commen/head.jsp"%>
    <head>
        <title>友情提示</title>     
    </head>
    <body bgcolor="#F0F0F0">
      <table style="margin-left:600px;">
        <tr>
            <td>
                <%=message %>
            </td>
        </tr>
        <tr height="114">
           <td align="center" valign="top">
               <a href="index.jsp"><input type = "button" value = "返回首页"></a>
               <a href="vote.jsp"><input type = "button" value = "继续投票"></a>
               <a href="showVote.jsp"><input type = "button" value = "查看结果"></a>
           </td>
        </tr>
      </table>
      <%@include file="/commen/foot.jsp"%>
    </body>
    
</html>
