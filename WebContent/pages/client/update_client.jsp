<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑个人信息</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<style type="text/css">
h1 {
	text-align: center;
	margin-top: 200px;
}

h1 a {
	color: red;
}

input {
	text-align: center;
}
</style>
</head>
<body>
	<div id="header">
		<img class="logo_img" alt="" src="static/img/logo.gif" width="75px">
		<span style="font-size: 36px">编辑个人信息</span>
		<%@ include file="/WEB-INF/include/header.jsp"%>
	</div>
	<div id="main">
		<form action="ClientServlet?method=updateMyClient" method="post">
			<input type="hidden" name="c_id" value="${sessionScope.client.c_id }">
			<table>
				<tr>
					<td>用户名</td>
					<td><input name="c_name" type="text"
						value="${sessionScope.client.c_name }" /></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input name="password" type="text"
						value="${sessionScope.client.password }" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input name="gender" type="text"
						value="${sessionScope.client.gender }" /></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input name="address" type="text"
						value="${sessionScope.client.address }" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" /></td>
				<tr>
				</tr>
			</table>
		</form>
	</div>
	<div id="bottom">
		<span> Jmu二手书交易系统.Copyright &copy;2020 </span>
	</div>
</body>
</html>