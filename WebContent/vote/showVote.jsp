<%@page import="com.toolbean.MyTool"%>
<%@page import="com.valuebean.voteSingle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>投票结果</title>
</head>
<body>
	<%@include file="/commen/head.jsp"%>
    <table style="margin-left:600px;">
    <%
        ArrayList<voteSingle> votes = db.getVotes();
        int numAll = 0;
        float picLen = 0;
        if(votes == null || votes.size() == 0){
    %>
            <tr>
                <td>无内容可以显示</td>
            </tr>
    <%
        }else{
            for(int i = 0, length = votes.size(); i < length; i++){
                numAll += MyTool.strToInt(votes.get(i).getNum());
            }
            for(int i = 0, length = votes.size(); i < length; i++){
                picLen = MyTool.strToInt(votes.get(i).getNum()) * 145 / numAll;
    %>
    <tr class = "a">
        <td class = "a">
            <%= votes.get(i).getTitle() %>
        </td>
        <td class = "a">
            <img src="img/j.jpg" width="<%=picLen%>" height = "15"/>
        </td>
        <td class = "a">
            <%=votes.get(i).getNum()%>
        </td>
    </tr>
        <br/>
    <%
        }
    }
    %>
    <tr>
        <td>
            <a href = "index.jsp">
                <input type = "button" value = "返回主界面">
            </a>
        </td>
        <td>
            <a href = "vote.jsp">
                <input type = "button" value = "在线投票">
            </a>
        </td>
    </tr>
    </table>
    <%@include file="/commen/foot.jsp"%>
</body>
</html>
