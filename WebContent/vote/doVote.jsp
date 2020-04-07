<%@page import="com.valuebean.voteSingle"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.valuebean.UserSingle"%>
<%@page import="com.toolbean.MyTool"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<%
    long cc = 0, dd = 0;
    int id = MyTool.strToInt(request.getParameter("like"));
    int flag = -1, i = -1;
    String sql = "";
    Date date = new Date();
    long today = date.getTime();
    voteSingle v =db.findvote(id);
    String mes = "";
    long lastTime = 0;
    String ip = "005";
    //String ip = request.getRemoteAddr();
    UserSingle u = db.findUser(ip);
    if(u == null){
        u = new UserSingle();
        u.setIp(ip);
        u.setLastTime(today);
        flag = 0;
    }else{
        lastTime = u.getLastTime();
        cc = today;
        dd = lastTime;
        if((today - lastTime) >= 60 * 60 * 1000){
            flag  = 1;
        }else{
            flag = 2;
        }
    }
    if(flag == 0){
        sql = "insert into users(ip, lastTime) values('"+ip+"','+"+today+"')";
        i = db.update(sql);
        if(i < 0){
            System.out.println("插入user失败！");
            i = -1;
        }
        sql = "update vote set num=num+1 where id="+id;
        i = db.update(sql);
        if(i < 0){
            System.out.println("更新vote表失败（num+1）");
            i = -1;
        }
    }
    if(flag == 1){
        sql = "update vote set num=num+1 where id="+id;
        i = db.update(sql);
        if(i < 0){
            System.out.println("更新vote表失败（num+1）");
            i = -1;
        }
        sql = "update users set lastTime ="+today+" where ip= '"+ip+ "'";
        i = db.update(sql);
        if(i < 0){
            System.out.println("更新user表失败lastTime=today");
            i = -1;
        }
    }
    if(flag == 2){
        mes = u.getIp()+" 为  "+v.getTitle()+" 投票失败，距离上一次投票不足一小时，上一次投票时间为"+MyTool.formatDate(lastTime);
    }
    if(flag == 1){
        mes = u.getIp()+" 为  "+v.getTitle()+" 投票成功，当前投票时间为：" + MyTool.formatDate(today);
    }
    if(flag == 0){
        mes = u.getIp()+" 为 "+v.getTitle()+" 首次投票成功，当前投票时间为：" + MyTool.formatDate(today);
    }
    session.setAttribute("mes", mes);
    response.sendRedirect("message.jsp");
%>
