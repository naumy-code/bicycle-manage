<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
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
	<%	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id"); 
		String content = request.getParameter("content"); // 商品id
	%>
	<%@include file="/commen/head.jsp"%>
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>修改留言</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/editMessage" enctype="multipart/form-data">
				<input type="hidden" id="telephone" name="id" value="<%=id %>" />

				<div class="form-group">
					<div class="label">
						<label>留言内容：</label>
					</div>
					<div class="field">
						
						<textarea type="text" class="input" name="content" 
							style="height: 80px;"><%=content %></textarea>
					</div>
				</div>
				
				<div class="form-group">
        			<div class="label">
          				<label>图片：</label>
       			    </div>
        			<div class="field">
          				<input type="file"  name="upload" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
          			<div class="tipss">图片尺寸：500*500</div>
        			</div>
      			</div>
      			
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<%@include file="/commen/foot.jsp"%>
</html>