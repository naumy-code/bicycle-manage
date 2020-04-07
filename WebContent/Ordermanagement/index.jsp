<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="/newproject/Commoditymanagement/homepage.jsp" target="_blank"><span class="icon-home"></span>前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="${pageContext.request.contextPath}/logout" onclick="javascript:return confirm_logout()"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="${pageContext.request.contextPath}/commen/online.jsp" target="right"><span class="icon-caret-right"></span>在线人数</a></li> 
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>用户管理</h2>
  <ul>
    <li><a href="list.html" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
    <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
  </ul>
  <h2><span class="icon-pencil-square-o"></span>商品管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/listProduct" target="right"><span class="icon-caret-right"></span>查看商品</a></li>
    <li><a href="/newproject/Commoditymanagement/addproduct.jsp" target="right"><span class="icon-caret-right"></span>添加商品</a></li>      
    <li><a href="/newproject/commen/productchart.jsp" target="right"><span class="icon-caret-right"></span>图表统计</a></li> 
  </ul>
  <h2><span class="icon-pencil-square-o"></span>订单管理</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/findOrders" target="right"><span class="icon-caret-right"></span>查看订单</a></li> 
    <li><a href="${pageContext.request.contextPath}/commen/orderchart.jsp" target="right"><span class="icon-caret-right"></span>订单图表统计</a></li>          
  </ul>
  <h2><span class="icon-pencil-square-o"></span>商品留言</h2>
  <ul>
    <li><a href="${pageContext.request.contextPath}/findMessage" target="right"><span class="icon-caret-right"></span>查看留言</a></li>
    <li><a href="${pageContext.request.contextPath}/commen/messagechart.jsp" target="right"><span class="icon-caret-right"></span>查看留言统计图表</a></li> 
  </ul>
  <h2><span class="icon-pencil-square-o"></span>在线团购</h2>
  <ul>
    <li><a href="/newproject/Group buying application/addgroupproduct.jsp" target="right"><span class="icon-caret-right"></span>添加团购商品</a></li>
    <li><a href="${pageContext.request.contextPath}/listgroupProduct" target="right"><span class="icon-caret-right"></span>查看团购商品</a></li>
    <li><a href="${pageContext.request.contextPath}/findgroupOrders" target="right"><span class="icon-caret-right"></span>查看团购订单</a></li>        
  </ul>
  <h2><span class="icon-pencil-square-o"></span>在线客服</h2>
  <ul>
    <li><a href="/newproject/chartroom/index.jsp" target="right"><span class="icon-caret-right"></span>客服聊天</a></li>      
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<p>来源:<a href="http://down.admin5.com/" target="_blank">A5源码</a></p>
</div>
</body>
</html>