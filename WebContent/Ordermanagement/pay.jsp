<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<%@ page import="com.store.domain.User"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线支付</title>
<link rel="stylesheet" href="css/homepage/body.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/Ordermanagement/css/main.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Ordermanagement/css/paystyle.css" type="text/css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.divBank{
	margin-left:450px;
}
</style>
</head>
<body>	
	<%@include file="/commen/head.jsp"%>
	<form action="${pageContext.request.contextPath}/pay" method="post">
		<span style="margin-left:450px;font-size:15px;">订单号：</span>
		<INPUT TYPE="text" NAME="orderid" value="${param.id}"  style="font-size:20px;">
		<span style="margin-left:450px;font-size:15px;">支付金额：</span>
		<INPUT TYPE="text" NAME="money" value="${param.money}"  style="font-size:20px;">元
		</br>
		<div class="divBank">
			<div class="divText">选择网上银行</div>
			<div style="margin-left: 20px;">
				<div style="margin-bottom: 20px;">
					<input id="ICBC-NET-B2C" type="radio" name="yh"
						value="ICBC-NET-B2C" checked="checked" /> 
						<img name="ICBC-NET-B2C" align="middle" src="<c:url value='/Ordermanagement/bank_img/icbc.bmp'/>" /> 
						<input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C" /> 
						<img name="CMBCHINA-NET-B2C" align="middle" src="<c:url value='/Ordermanagement/bank_img/cmb.bmp'/>" /> 
						<input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" /> 
						<img name="ABC-NET-B2C" align="middle" src="<c:url value='/Ordermanagement/bank_img/abc.bmp'/>" /> 
						<input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" /> 
						<img name="CCB-NET-B2C" align="middle" src="<c:url value='/Ordermanagement/bank_img/ccb.bmp'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="BCCB-NET-B2C" type="radio" name="yh"
						value="BCCB-NET-B2C" /> <img name="BCCB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/bj.bmp'/>" /> <input
						id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
					<img name="BOCO-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/bcc.bmp'/>" /> <input
						id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" /> <img
						name="CIB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/cib.bmp'/>" /> <input
						id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
					<img name="NJCB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/nanjing.bmp'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CMBC-NET-B2C" type="radio" name="yh"
						value="CMBC-NET-B2C" /> <img name="CMBC-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/cmbc.bmp'/>" /> <input
						id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" /> <img
						name="CEB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/guangda.bmp'/>" /> <input
						id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
						name="BOC-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/bc.bmp'/>" /> <input
						id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET" />
					<img name="PINGANBANK-NET" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/pingan.bmp'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CBHB-NET-B2C" type="radio" name="yh"
						value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/bh.bmp'/>" /> <input
						id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C" />
					<img name="HKBEA-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/dy.bmp'/>" /> <input
						id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
					<img name="NBCB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/ningbo.bmp'/>" /> <input
						id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C" />
					<img name="NBCB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/zx.bmp'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
					<img name="SDB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/sfz.bmp'/>" /> <input
						id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" /> <img
						name="GDB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/gf.bmp'/>" /> <input
						id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" /> <img
						name="SHB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/sh.bmp'/>" /> <input
						id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
					<img name="SPDB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/shpd.bmp'/>" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="POST-NET-B2C" type="radio" name="yh"
						value="POST-NET-B2C" /> <img name="POST-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/post.bmp'/>" /> <input
						id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C" />
					<img name="BJRCB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/beijingnongshang.bmp'/>" /> <input
						id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" /> <img
						name="HXB-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/hx.bmp'/>" /> <input id="CZ-NET-B2C"
						type="radio" name="yh" value="CZ-NET-B2C" /> <img
						name="CZ-NET-B2C" align="middle"
						src="<c:url value='/Ordermanagement/bank_img/zheshang.bmp'/>" />
				</div>
			</div>
			<div style="margin: 40px;width:100px;height:50px;border:1px;color:red;">
				<INPUT TYPE="submit" value="确定支付">
			</div>
		</div>
	</form>
	
</body>
<%@include file="/commen/foot.jsp"%>
</html>
