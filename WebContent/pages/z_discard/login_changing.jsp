<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
<script type="text/javascript" src="static/script/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
        <title>二手书交易登录页面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- CSS -->
        <link rel="stylesheet" href="static/css/login_reset.css">
        <link rel="stylesheet" href="static/css/login_supersized.css">
        <link rel="stylesheet" href="static/css/login_style.css">
    </head>
    <body oncontextmenu="return false">
		<div class="page-container">
			<h1>请登录</h1>
			<a  style="color: white;position:relative;top: 30px; left: 110px" href="pages/user/regist.jsp">立即注册</a>
			<form action="ClientServlet?method=login" method="post">
			<div>
				<input type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="c_id" />
			</div>
               <div>
               <input type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" />
<!-- 				<input type="password" name="password" class="password" placeholder="Password" oncontextmenu="return false" onpaste="return false" /> -->
               </div>
               <button id="submit" type="submit">登录</button>
       		</form>
        	<div class="connect">
                <p>If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
                <br>
                <p> JMU二手书交易商城.Copyright &copy;2020 </p>
        	</div>
        </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>

        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="static/js/supersized.3.2.7.min.js"></script>
        <script src="static/js/supersized-init.js"></script>
		<script>
		$(".btn").click(function(){
			is_hide();
		})
		var u = $("input[name=c_id]");
		var p = $("input[name=password]");
		$("#submit").live('click',function(){
			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u.val())){
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}
			}
		});
		window.onload = function(){
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		}
		function is_hide(){ 
			$(".alert").animate({"top":"-40%"}, 300) 
		}
		function is_show(){ 
			$(".alert").show().animate({"top":"45%"}, 300) 
		}
		</script>
    </body>

</html>