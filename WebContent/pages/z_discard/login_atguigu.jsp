<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>二手书交易登录页面</title>
<!-- 动态引用 
不知道为啥 JSTL要用下面的引用才行
不是动态引用吗？？ 搞什么
-->
<%-- <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include> --%>
<!-- 静态引用 -->
<%@ include file="/WEB-INF/include/base.jsp" %>
</head>
<body>
	<div id="login_header">
		<img class="logo_img" alt="" src="static/img/logo.gif" width="75px">
	</div>

	<div class="login_banner">

		<div id="l_content">
			<span class="login_word">欢迎登录</span>
		</div>

		<div id="content">
			<div class="login_form">
				<div class="login_box">
					<div class="tit">
						<h1>登录页面</h1>

						<a href="pages/user/regist.jsp">立即注册</a>
					</div>
					<div class="msg_cont">
						<b></b> 
<%-- 						<%=request.getAttribute("msg") == null?"请输入用户名和密码":request.getAttribute("msg") %> --%>
						<c:if test="${empty requestScope.msg }">
							<span class="errorMsg">请输入用户名和密码</span>
						</c:if>
						<c:if test="${!empty requestScope.msg }">
							<span class="errorMsg">${requestScope.msg }</span>
						</c:if>
					</div>
					<div class="form">
						<form action="ClientServlet?method=login" method="post">
							<label>账号：</label> 
							<input class="itxt" type="text"
								placeholder="请输入用户名" autocomplete="off" tabindex="1"
								name="c_id" /> <br /> <br /> 
							<label>密码：</label> 
							<input
								class="itxt" type="password" placeholder="请输入密码"
								autocomplete="off" tabindex="1" name="password" /> <br /> <br />
							<input type="submit" value="登录" id="sub_btn" />
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="bottom">
		<span> JMU二手书交易商城.Copyright &copy;2020 </span>
	</div>
</body>
</html>