<%@page import="com.valuebean.UserSingle"%>
<%@page import="com.valuebean.voteSingle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
    .a{
        border: 1px solid;
    }
</style>
<title>在线投票</title>
</head>
<body>
	<%@include file="/commen/head.jsp"%>
    <form action="doVote.jsp" method = "post">
    <table style="margin-left:600px;">
    <%
        ArrayList<voteSingle> votes = db.getVotes();
        if(votes == null || votes.size() == 0){
    %>
            <tr>
                <td>无内容可以显示</td>
            </tr>
    <%
        }else{
            for(int i = 0, length = votes.size(); i < length; i++){
    %>
    <tr class = "a">
        <td class = "a">
            <%= votes.get(i).getTitle() %>
        </td>
        <td class = "a">
            <input type = "radio" name = "like" value="<%=votes.get(i).getId()%>"></input>
        </td>
    </tr>
        <br/>
    <%
        }
    }
    %>
    <tr>
        <td>
            <input type = "submit" value = "提交"/>
        </td>
        <td>
            <input type = "reset" value = "重置"/>
        </td>
        <td>
            <a href = "index.jsp">
                <input type = "button" value = "返回主界面">
            </a>
        </td>
        <td>
            <a href = "showVote.jsp">
                <input type = "button" value = "显示投票结果">
            </a>
        </td>
    </tr>
    </table>
    </form>
    <%@include file="/commen/foot.jsp"%>
</body>
</html>
