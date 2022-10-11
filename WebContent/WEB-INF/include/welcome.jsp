<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="static/css/header.css">
<script src=" http://at.alicdn.com/t/font_2232371_uexjvk1z6t.js"></script>

<!-- header -->
<header id="header">
	<ul id="nav_item">
		<li></li>
		<li><a href="index.jsp">首页</a></li>
		<li><a href="ClientServlet?method=check&type=put_away">书籍上架</a></li>
		<li><a href="ClientServlet?method=check&type=need_upload">需求发布</a></li>

		<li><a href="ClientServlet?method=check&type=personalMsg">个人信息</a></li>
		<li><a href="#">帮助</a>
			<ul>
				<c:if test="${sessionScope.client.c_id == 'admin' }">
					<li><a
						href="BookClientServlet?method=xiajia&c_id=${sessionScope.client.c_id}">商品管理</a>
					</li>
					<li><a href="BookClientServlet?method=getAllUnsetBooks">管理员审核书</a></li>
					<li><a href="NeedServlet?method=getAllUnsetNeeds">管理员审核</a></li>
				</c:if>
				<c:if test="${sessionScope.client.c_id != 'admin' }">
					<li><a href="ClientServlet?method=check&type=manager">商品管理</a></li>
					<li><a href="ClientServlet?method=check&type=getClientOrders">订单管理</a></li>
					<li><a href="ClientServlet?method=check&type=need_manager">需求管理</a></li>
				</c:if>
			</ul></li>
		<li>
			<section id="item">
				<form action="BookClientServlet?method=detailSearch&stype=b_name"
					method="post" id="search">
					<input id="searchContent" name="main_search" type="search"
						placeholder="按书名查询" required autocomplete="off">
					<button>
						<svg style="width: 34px; height: 30px;" class="icon"
							aria-hidden="true">
							<use xlink:href="#icon-Z"></use></svg>
					</button>
				</form>
			</section>
		</li>
		<c:if test="${!empty sessionScope.client.c_name }">
			<li><a href="ClientServlet?method=logout">注销 <i
					style="color: gold">${sessionScope.client.c_name}</i>~
			</a></li>
		</c:if>
		<c:if test="${empty sessionScope.client }">
			<li><a href="./pages/user/login.jsp">登入/注册</a></li>
		</c:if>
		<li><a href="pages/cart/cart.jsp"><svg
					style="width: 34px; height: 34px;" class="icon" aria-hidden="true">
					<use xlink:href="#icon-gouwuche2"></use></svg></a></li>
	</ul>
</header>
<script>
		let search=document.getElementById("searchContent");
		search.addEventListener("focus",()=>{
		    let father_style=document.getElementById("search");
		    father_style.style.minWidth="85%";
		    father_style.style.transition="min-width 1.2s";
		},true);
		search.addEventListener("blur",()=>{
		    let father_style=document.getElementById("search");
		    father_style.style.minWidth="35%";
		    father_style.style.transition="min-width 1.2s";
		},true);
</script>