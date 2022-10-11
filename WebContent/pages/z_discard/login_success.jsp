<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录成功</title>
<jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">
				<img class="logo_img" alt="" src="static/img/logo.gif" width ="50px">
				<%@ include file="/WEB-INF/include/welcome.jsp" %>
		</div>
		
		<div id="main">
		
			<h1>欢迎回来 <a href="index.html">转到主页</a></h1>
	
		</div>
		
		<div id="bottom">
			<span>
				JMU二手书交易系统.Copyright &copy;2015
			</span>
		</div>
</body>
</html>