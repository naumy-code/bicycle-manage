<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/MessageBoard/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/MessageBoard/css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<%@include file="/commen/head.jsp"%>
	<form method="post"
		action="${pageContext.request.contextPath}/findMessageByManyCondition"
		id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 留言管理</strong>
			</div>



			<table class="table table-hover text-center">
				<tr>
					<th width="120">编号</th>
					<th width="120">商品编号</th>
					<th>性名</th>
					<th>主题</th>
					<th>邮箱</th>
					<th>留言时间</th>
					<th width="25%">内容</th>
				</tr>
				<c:forEach items="${message}" var="message">
					<tr>
						<td>${message.id}</td>
						<td>${message.productid}</td>
						<td>${message.name}</td>
						<td>${message.title}</td>
						<td>${message.mail }</td>
						<td>${message.time }</td>
						<td>${message.content}</td>
						
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="">上一页</a> <span class="current">1</span><a href="">2</a><a
								href="">3</a><a href="">下一页</a><a href="">尾页</a>
						</div></td>
				</tr>
			</table>
		</div>
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
<%@include file="/commen/foot.jsp"%>
</html>