<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退货信息管理</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
</head>
<body>
	<div id="header">
		<span class="wel_word">我的所有退货信息</span>
		<%@ include file="/WEB-INF/include/header.jsp"%>
	</div>

	<div id="main">
		<table>
			<tr>
				<td>退货编号</td>
				<td>时间</td>
				<td>理由</td>
				<td>状态</td>
			</tr>
			<c:forEach items="${requestScope.returnmessage}" var="returnmessage">
				<tr>
					<td>${returnmessage.r_id }</td>
					<td>${returnmessage.r_time}</td>
					<td>${returnmessage.reason}</td>
					<td>${returnmessage.state}</td>

				</tr>
			</c:forEach>


		</table>
	</div>

	<div id="bottom">
		<span> Jmu二手书交易系统.Copyright &copy;2020 </span>
	</div>
</body>
</html>