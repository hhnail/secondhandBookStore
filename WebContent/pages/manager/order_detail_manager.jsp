<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
</head>
<body>
	<div id="header">
		<span class="wel_word">订单细则</span>
		<%@ include file="/WEB-INF/include/header.jsp"%>
	</div>
	<div id="main">
		<table>
			<c:if test="${empty requestScope.orderDetail }">
				<h1 align="center">没有相关的订单详细信息！</h1>
			</c:if>

			<c:if test="${!empty requestScope.orderDetail }">
				<tr>
					<td>编号</td>
					<td>商家名称</td>
					<td>《书名》-ISBN</td>
					<td>价格</td>
					<td>订单状态</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${requestScope.orderDetail }" var="orderDetail" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${orderDetail.storePensonal.client.c_name}</td>
						<td>《${orderDetail.storePensonal.bookList.b_name }》-${orderDetail.storePensonal.bookList.ISBN }</td>
						<td>${orderDetail.price }</td>
						<td>${orderDetail.state}</td>
						<td><a href="ReturnMessageServlet?method=createReturnMessage&ol_id=${orderDetail.ol_id }">申请退货</a></td>
					</tr>
				</c:forEach>
				<tr>
			</c:if>
		</table>
	</div>
	<div id="bottom">
		<span>Jmu二手书交易系统.Copyright &copy;2020 </span>
	</div>
</body>
</html>