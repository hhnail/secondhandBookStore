<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
</head>
<body>
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" width= "75px" >
			<span class="wel_word">二手书交易系统</span>
			<%@ include file="/WEB-INF/include/welcome.jsp" %>
	</div>
	
	<div id="main">
		<div id="book">
			<div class="book_cond">
				价格：<input type="text" name="min"> 元 - 
				<input type="text" name="max"> 元 
				<button>查询</button>
			</div>
			<div style="text-align: center">
			<c:if test="${not empty sessionScope.cart.totalCount && sessionScope.cart.totalCount != 0}">
				<span>您的购物车中有${sessionScope.cart.totalCount }件商品</span>
			</c:if>
				<div>
			<c:forEach items="${requestScope.allNeeds }" var="need">
				<div class="b_list">
					<div class="img_div">
						<img class="book_img" alt="" src="static/img/default.jpg" />
					</div>
					<div class="book_info">
						<div class="need.max_price">
							<span class="sp1">最高价格:</span>
							<span class="sp2">${need.max_price }</span>
						</div>
						<div class="need.max_price">
							<span class="sp1">截止日期:</span>
							<span class="sp2">${need.deadline }</span>
						</div>
						<div class="need.max_price">
							<span class="sp1">最低信用:</span>
							<span class="sp2">${need.min_credit }</span>
						</div>
						<div class="need.max_price">
							<span class="sp1">需求描述:</span>
							<span class="sp2">${need.description }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	</div>

	<div id="bottom">
		<span>
			Jmu二手书交易系统.Copyright &copy;2020
		</span>
	</div>
</body>
</html>