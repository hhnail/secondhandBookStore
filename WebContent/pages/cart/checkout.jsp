<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算页面</title>
<%@ include file="/WEB-INF/include/base.jsp" %>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
<script type="text/javascript">
// 	$("#header")
// 	alert("");
</script>
</head>
<body>
	<div id="header">
			<%@ include file="/WEB-INF/include/welcome.jsp" %>
	</div>
	<div id="main">
		<a id="test"></a>
		<h1>你的订单已结算，订单号为<span style="color:red;">${sessionScope.o_id }</span></h1>
	</div>
	<div id="bottom">
		<span>
			Jmu二手书系统.Copyright &copy;2020
		</span>
	</div>
</body>
</html>