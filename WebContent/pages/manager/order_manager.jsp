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
			<span class="wel_word">订单管理界面</span>
			<%@ include file="/WEB-INF/include/header.jsp" %>
	</div>
	
	<div id="main">
		<table>
			
			<c:if test="${empty requestScope.orders }">
				<h1 align="center">您暂时没有订单哦，快去<a href="index.jsp" style="color:red">购物</a>吧~</h1>
			</c:if>
			<c:if test="${!empty requestScope.orders }">
				<tr>
					<td>订单号</td>
					<td>日期</td>
					<td>金额</td>
					<td>状态</td>
					<td>详情</td>
				</tr>
				<c:forEach items="${requestScope.orders }" var="order">
					<tr>
						<td>${order.o_id }</td>
						<td>${order.timeForJsp }</td>
						<td>${order.price_total}</td>
						<td>${order.o_state}</td>
						<td><a href="OrderServlet?method=getOrderDetail&o_id=${order.o_id }">查看详情</a></td>
					</tr>	
				</c:forEach>
			</c:if>
				
		</table>
	</div>
	
	<div id="bottom">
		<span>
			Jmu二手书交易系统.Copyright &copy;2020
		</span>
	</div>
</body>
</html>