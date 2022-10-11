<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户注册页面</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
</style>
<script type="text/javascript">
// 	alert($);
	$(function(){
		//点击刷新验证码
		$("#codeImg").click(function(){//鼠标点击事件
			$(this).attr("src","code.jpg?random" + Math.random())
			/*
			 *为属性src重新赋值。一个参数是取值，两个参数是赋值
			 *但是属性如果没有变的话，他默认是不会赋值的
			 */
		});


		
	});
</script>
</head>
<body>
<div id="login_header">
	<img class="logo_img" alt="" src="static/img/logo.gif" width = "75px">
</div>
	<div class="login_banner">
		<div id="l_content">
			<span class="login_word">欢迎注册</span>
		</div>
		<div id="content">
			<div class="login_form">
				<div class="login_box">
					<div class="tit">
						<h1>注册</h1>
						<span class="errorMsg">${requestScope.msg }</span>		
					</div>
					<div class="form">
						<form action="ClientServlet?method=regist" method="post">
							<label>手机号码：</label>
<!-- 									两种取法之一 -->
							<input value="${param.c_id }" class="itxt" type="text" placeholder="请输入账号" autocomplete="off" tabindex="1" name="c_id" id="username" />
							<br />
							<br />
							<label>用户密码：</label>
							<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
							<br />
							<br />
							<label>确认密码：</label>
							<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
							<br />
							<br />
							<label>取货地址：</label>
<!-- 									两种取法之二 -->
							<input value="${param.address }" class="itxt" type="text" placeholder="请输入地址" autocomplete="off" tabindex="1" name="address" id="address" />
<%-- 									
<%=request.getParameter("address")==null?"":request.getAttribute("address")%> 
整合了LoginServlet和RegistServlet之后就不能“不set到request域中”直接用了
【hw】原因：...不清楚，可能受到继承、多态的影响？？

要${param.address }
【hw】param是啥？？ 
param：参数对象主要用于获取get/post请求中的参数
所以可以不set域，直接从get/post请求中拿
--%>
							<br />
							<br />
							<label>验证码：</label>
							<input class="itxt" type="text" style="width: 150px;" name="code" id="code"/>
<!-- 							sessionKey：KAPTCHA_SESSION_KEY -->
							<img id="codeImg" src="code.jpg" style="float: right; margin-right: 40px; width: 85px; height: 40px">									
							<br />
							<br />
							<input type="submit" value="注册" id="sub_btn" />
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
<div id="bottom">
	<span>
		Jmu二手书系统.Copyright &copy;2020
	</span>
</div>
</body>
</html>