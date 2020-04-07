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
<form method="post" action="${pageContext.request.contextPath}/findgroupProductByManyCondition" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="/newproject/Commoditymanagement/addproduct.jsp"> 添加内容</a> </li>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入商品编号" name="id" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入商品名称" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
          
          </li>
         <li>价格区间：</li>
          <li><input type="text" placeholder="请输入搜索最低价" name="minprice" class="input" style="width:250px; line-height:17px;display:inline-block" />
          -
          <input type="text" placeholder="请输入搜索最高价" name="maxprice" class="input" style="width:250px; line-height:17px;display:inline-block" />
          
          <button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button border-main icon-search">
										&#26597;&#35810;
									</button> 
									
          </li>
         
         
      </ul>
      
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">商品编号</th>
        <th width="10%">商品名称</th>
        <th>图片</th>
        <th>商品价格</th>
        <th>商品数量</th>
        <th>最大团购数</th>
        <th>商品类别</th>
        
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <!--  循环输出所有商品 -->
	<c:forEach items="${ps}" var="p">
        <tr>
          <td>${p.id }</td>
          <td>${p.name }</td>
          <td width="10%"><img src="${pageContext.request.contextPath}${p.imgurl}" alt="" width="70" height="50" /></td>
          <td>${p.price }</td>
          <td><font color="#00CC99">${p.pnum }</font></td>
          <td><font color="#00CC99">${p.groupmax }</font></td>
          <td>${p.category}</td>
          <td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath}/findgroupProductById?id=${p.id}&type=admin"><span class="icon-edit"></span> 修改</a> 
          <a class="button border-red" href="${pageContext.request.contextPath}/deletegroupProduct?id=${p.id}" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
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