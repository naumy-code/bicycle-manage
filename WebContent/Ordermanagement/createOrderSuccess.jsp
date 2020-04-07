<%@ page language="java"  import="java.util.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<!-- 完成页面定时的跳转 -->
<meta http-equiv="refresh" content="5;url=/newproject/Commoditymanagement/homepage.jsp">
 
<title>Insert title here</title>
<style type="text/css">
#divcontent{
	margin-left:500px;
}
</style>
</head>
<body onload="run()">
	<%@include file="/commen/head.jsp"%>
   <div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
				    <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="img/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">亲，订单生成成功，请到“我的账户”-“订单查询”中支付！</font><br /> <br />
								<a href="${pageContext.request.contextPath }/Commoditymanagement/homepage.jsp">
									<span id="spanId">5</span>秒后自动为您转跳回首页</a>
							</td>
						</tr>
					</table>
				  <h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>
<%@include file="/commen/foot.jsp"%>
</body>
<br><script type="text/javascript">
    // 页面一加载完成，该方法就会执行
    // 读秒，一秒钟数字改变一次
    var x = 5;
    function run(){
        // 获取到的是span标签的对象
        var span = document.getElementById("spanId");
        // 获取span标签中间的文本
        span.innerHTML = x;
        x--;
        // 再让run方法执行呢，一秒钟执行一次
        window.setTimeout("run()", 1000);
    }
     
</script><br>
</html>