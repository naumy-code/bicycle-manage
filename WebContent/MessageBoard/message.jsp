<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>查看留言</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>

	<div class="panel-head">
		<strong class="icon-reorder"> 留言管理</strong>
	</div>
	<div class="padding border-bottom">
		<ul class="search">
			<li>
				<button type="button" class="button border-green" id="checkall">
					<span class="icon-check"></span> 全选
				</button>
				<button type="submit" class="button border-red">
					<span class="icon-trash-o"></span> 批量删除
				</button>
			</li>
		</ul>
	</div>
	<form action="${pageContext.request.contextPath }/DeleteServlet"
		method="post">
		<table class="table table-hover text-center">
			<tr>
				<th width="120">留言序号</th>
				<th>昵称</th>
				<th>主题</th>
				<th>mail</th>
				<th width="25%">留言内容</th>
				<th width="120">留言时间</th>
				<th>操作</th>
			</tr>
			
			<tbody>
			<c:forEach items="${messages}" var="message">
				<tr>
					<td><input type="checkbox" name="id[]" value="1" />${message.name}</td>
					<td align="center">${message.name}</td>
					<td align="center">${message.name}</td>
					<td align="center">${message.name}</td>
					<td align="center">${message.name}</td>
					<td align="center">${message.name}</td>
					<td><div class="button-group">

							<a class="button border-red" href="javascript:void(0)"
								onclick="return del(1)"><span class="icon-trash-o"></span>
								删除</a>
						</div></td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
	</form>



	<script type="text/javascript">
		function del(id) {
			if (confirm("您确定要删除吗?")) {

			}
		}

		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
	</script>
</body>
</html>