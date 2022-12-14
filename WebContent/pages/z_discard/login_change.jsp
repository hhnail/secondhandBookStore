<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
<link type="text/css" rel="stylesheet" href="static/css/login_style.css" >
<script type="text/javascript" src="static/script/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
        <title>登录页面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- CSS -->
        <link rel="stylesheet" href="static/css1/login_reset.css">
        <link rel="stylesheet" href="static/css1/login_supersized.css">
        <link rel="stylesheet" href="static/css1/login_style.css">
    </head>
    
    <body oncontextmenu="return false">
        <div class="page-container">
            <h1>请登录</h1>
            <form action="ClientServlet?method=login" method="post">
				<div>
					<input type="text" name="c_id" class="username" placeholder="请输入用户名" autocomplete="off"/>
				</div>
                <div>
					<input type="password" name="password" class="password" placeholder="请输入密码" oncontextmenu="return false" onpaste="return false" />
                </div>
                <button id="submit" type="submit">登录</button>
            </form>
            <div class="connect">
                <p>If we can only encounter each other rather than stay with each other,then I wish we had never encountered.</p>
				<p style="margin-top:20px;">Jmu二手书交易系统.Copyright &copy;2020</p>
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
        <script src="static/js1/supersized.3.2.7.min.js"></script>
        <script src="static/js1/supersized-init.js"></script>
		<script>
		$(".btn").click(function(){
			is_hide();
		})
		var u = $("input[name=username]");
		var p = $("input[name=password]");
		$("#submit").live('click',function(){
			if(u.val() == '' || p.val() =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}
			else{
				var reg = /^[0-9A-Za-z]+$/;
				if(!reg.exec(u.val()))
				{
					$("#ts").html("用户名错误");
					is_show();
					return false;
				}
			}
		});
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		}
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
		</script>
    </body>

</html>

