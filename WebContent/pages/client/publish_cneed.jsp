<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书需求发布</title>
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
		<span class="wel_word">图书需求发布</span>
		<%@ include file="/WEB-INF/include/header.jsp"%>
	</div>

	<div id="main">
		<form action="ClientServlet?method=publishCNeed" method="post">
			<input type="hidden" name="c_id" value="${sessionScope.client.c_id }">
			<table>
				<tr>
					<td>书本最高价格</td>
					<td>截至时间</td>
					<td>用户最低信用</td>
					<td>图书描述</td>
					<td>所需数量</td>
					<td>书本ISBN</td>
					<td>用户账号</td>
					<!-- 						<td>图片路径</td> -->
					<td colspan="2">操作</td>
				</tr>
				<tr>
					<td><input name="max_price" type="text"
						value="${param.max_price }" /></td>
					<td><input name="deadline" type="text"
						value="${param.deadline }" /></td>
					<td><input name="min_credit" type="text"
						value="${param.credit. }" /></td>
					<td><input name="description" type="text"
						value="${param.description }" /></td>
					<td><input name="amount" type="text" value="${param.amount }" /></td>
					<td><input name="ISBN" type="text" value="${param.ISBN }" /></td>
					<td><input name="c_id" type="text" value="${param.c_id }" /></td>
					<td><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>

	</div>
	<div id="bottom">
		<span> Jmu二手书交易系统.Copyright &copy;2020 </span>
	</div>
</body>
</html>