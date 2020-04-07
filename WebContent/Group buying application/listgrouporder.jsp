<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/MessageBoard/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/MessageBoard/css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/findgroupOrderByManyCondition" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入订单编号" name="id" class="input" style="width:250px; line-height:17px;display:inline-block" />
          </li>
         <li>收件人：</li>
          <li><input type="text" placeholder="请输入收件人" name="receiverName" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button border-main icon-search">
										&#26597;&#35810;
									</button> 
									
          </li>
         
         
      </ul>
      
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">订单编号</th>
        <th width="10%">收件人</th>
        <th>地址</th>
        <th>联系电话</th>
        <th>总价</th>
        <th>所属用户</th>
        <th>订单状态</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <!--  循环输出所有商品 -->
	<c:forEach items="${orders}" var="order">
        <tr>
          <td>${order.id}</td>
          <td>${order.receiverName}</td>
          <td width="20%"  align="center">${order.receiverAddress }</td>
          <td>${order.receiverPhone }</td>
          <td ><font color="#00CC99">${order.money}</font></td>
          <td>${order.user.username}</td>
          <td>${order.paystate==0?"未受理":"已受理"}</td>
          <td>
          	<div class="button-group">
          	
           		<a class="button border-main" href="${pageContext.request.contextPath}/grouporderstate?orderid=${order.id}"><span class="icon-edit"></span>受理</a>
           		<!--  已支付，弹出提示框由操作人确认 --> 
           		<c:if test="${order.paystate!=0 }">
          			<a class="button border-red" href="${pageContext.request.contextPath}/delgroupOrderById?id=${order.id}&type=admin" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> 
          		</c:if> 
          		<!--  未支付 ，不能删除-->
				<c:if test="${order.paystate==0 }">
          			<a class="button border-red" href="javascript:alert('不能删除未支付订单')"  ><span class="icon-trash-o"></span> 删除</a> 
          		</c:if> 
          		
          	</div>
          
          </td>
        </tr>
   	</c:forEach>
       
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}
</script>
</body>
</html>