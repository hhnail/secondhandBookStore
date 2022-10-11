<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
这里可以不用引入JSTL，
因为下面的div所在的页面中的都引入了base.jsp（里面都有引入JSTL） 

这里先加上，这样alt+/才有提示
-->

<c:if test="${not empty sessionScope.client }">
	<div>
		<span>欢迎<span class="um_span">${sessionScope.client.c_id }</span>光临Jmu二手书系统</span> 
		<a href="pages/order/order.jsp">我的订单</a>
		<a href="NeedServlet?method=getAllNeeds">查看需求</a>
		<a href="pages/cart/cart.jsp">购物车</a>
		<a href="ClientServlet?method=logout">注销</a>&nbsp;&nbsp;
		<a href="index.jsp">返回</a>
	</div>
</c:if>

<c:if test="${empty sessionScope.client }">
	<div>
		<a href="pages/user/login.jsp">登录</a> | &nbsp;&nbsp;
		<a href="pages/user/regist.jsp">注册</a>
		<a href="pages/cart/cart.jsp">购物车</a>
		<a href="pages/manager/manager.jsp">后台管理</a>
	</div>
</c:if>