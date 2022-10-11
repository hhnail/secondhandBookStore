<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>

	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" width= "75px" >
			<span class="wel_word">后台管理系统</span>
			<%@ include file="/WEB-INF/include/header.jsp" %>
	</div>
	
	<div id="main">
		<c:if test="${sessionScope.client.c_id == 'admin' }">
			<h1>欢迎管理员 ${sessionScope.client.c_id } 进入后台管理系统</h1>
		</c:if>
		<c:if test="${sessionScope.client.c_id != 'admin' }">
			<h1>欢迎 ${sessionScope.client.c_name} 进入个人后台管理</h1>
		</c:if>
		
	</div>
	
	<div id="bottom">
		<span>
			Jmu二手书交易系统.Copyright &copy;2020
		</span>
	</div>
</body>
</html>