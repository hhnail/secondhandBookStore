<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>登录页面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <link rel="stylesheet" href="../../static/css/supersized.css">
		<link rel="stylesheet" href="../../static/css/login.css">
		<link rel="stylesheet" href="../../static/css/font_img/iconfont.css">
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
<base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <body oncontextmenu="return false">
		<section id="regiest_login">
			<div id="trans"></div>
		   <form id="login" action="ClientServlet?method=login" method="post" >
				<ul>
					<li>LOGIN</li>
					<li><i class="iconfont">&#xe765;</i> :<input type="text" placeholder="account" name="c_id" autocomplete="off" required></li>
					<li><i class="iconfont">&#xe622;</i> :<input type="password" placeholder="password" name="password" required ></li>
					<li><i class="iconfont">&#xe60d;</i> :<input type="text" placeholder="check code"  required> <canvas id="check" width="80px" height="26px"></canvas></li>
					<li><button id="submit">LOGIN</button></li>
				</ul>
			</form>
		   <!-- <form id="regiest" action="#"> --> 
			   <form id="regiest" action="ClientServlet?method=regist" method="post" >
				<ul>
					<li>REGIEST</li>
					<li><i class="iconfont font">&#xe728;</i> :<input type="text" name="r_id" placeholder="phone" autocomplete="off" required></li>
					<li><i class="iconfont">&#xe6b2;</i> :<input type="password" name="r_password" placeholder="password"  required ></li>
					<li><i class="iconfont font_address">&#xe631;</i> :<input name="c_password" type="password" placeholder="check password" required></li>
					<li><i class="iconfont font">&#xe765;</i> :<input name="c_name" type="text" placeholder="username" required ></li>
					<li><i class="iconfont" style="margin-right: 20px;">&#xe604;</i>
						<label for="sex1"> <i class="iconfont">&#xe646;  </i></label><input id="sex1" name="sex" type="radio" value="Male" style="margin-right: 40px;"> 
						<label for="sex2"> <i class="iconfont">&#xe627;  </i></label><input id="sex2" name="sex" type="radio" value="Female" >
					</li>
					<li><i class="iconfont font">&#xe669;</i> :<input name="address" type="text" placeholder="address" ></li>
					<li><i class="iconfont">&#xe60d;</i> :<input type="text" placeholder="check code"> <canvas id="check2" width="80px" height="26px"></canvas></li>
					<li><button id="submit_regiest">REGIEST</button></li>
				</ul>
			</form>
		</section>
	   
        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script src="static/js/supersized.3.2.7.min.js"></script>
        <script src="static/js/supersized-init.js"></script>
        <script src="static/js/jquery.js"></script>
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
	<script>
		let check={
			canvas:document.getElementById("check"),
			canva:document.getElementById("check").getContext("2d"),
			code1:"",
			code2:"",
			draw:function(){
				this.canva.clearRect(0,0,80,26);
				let code=new Array(1,2,3,4);
				let x=-10;
				let y,size;
				code.forEach((value,index,arr)=>{
					arr[index]=Math.floor(Math.random()*10);
					size=Math.floor(Math.random()*(20-10)+14);
					y=Math.floor(Math.random()*(20-10)+15);
					x+=size;
					this.canva.font= "italic 700 "+size+"px '宋体'";
					this.canva.fillStyle="rgb("+Math.floor(Math.random()*255)+","+Math.floor(Math.random()*255)+","+Math.floor(Math.random()*255)+")";
					this.canva.fillText(arr[index],x,y,size);
				});
				this.canva.beginPath();
				this.canva.moveTo((Math.floor(Math.random()*(20-10))+10),Math.floor(Math.random()*26));
				this.canva.lineTo((Math.floor(Math.random()*(20-10))+60),Math.floor(Math.random()*26));
				this.canva.stroke();
				this.canva.moveTo((Math.floor(Math.random()*(20-10))+10),Math.floor(Math.random()*26));
				this.canva.lineTo((Math.floor(Math.random()*(20-10))+60),Math.floor(Math.random()*26));
				this.canva.stroke();
				this.canva.closePath();
				if(this==check){
					this.code1=code.reduce((pValue,cValue)=>{
						return pValue+""+cValue;
					});
				}
				else{
					check.code2=code.reduce((pValue,cValue)=>{
						return pValue+""+cValue;
					});
				}
			},
			redraw:function(){
				let code;
				this.canvas.addEventListener('click',()=>{
					code=this.draw();
				},true);
			}
		}
		check.draw();
		check.redraw();
		let check2={
			canvas:document.getElementById("check2"),
			canva:document.getElementById("check2").getContext("2d"),
			draw:check.draw,
			redraw:check.redraw,
		}
		check2.draw();
		check2.redraw();
		document.getElementsByTagName("button")[0].addEventListener("click",()=>{
			let input=document.getElementsByTagName("input")[2];
			if(input.value!==check.code1){
				input.value="";
				input.placeholder="填写错误";
				check.draw();
				return false;
			}else{
				return true;
			}
		},true);
		document.getElementsByTagName("button")[1].addEventListener("click",()=>{
			let input=document.getElementsByTagName("input")[10];
			if(input.value!==check.code2){
				input.value="";
				input.placeholder="填写错误";
				check2.draw();
				return false;
			}else{
				return true;
			}
		},true);
		// 控制转换
		let loginToRegiest={
			button:document.getElementById("trans"),
			login:document.getElementById("login"),
			regiest:document.getElementById("regiest"),
			deg:180,
			count:2,
			top:["-300px","0px"],
			left:["-400px","0px"],
			transform:function(){
				this.button.addEventListener('click',()=>{
					// this.login.style.setProperty("transform","rotate("+(this.deg*this.count++)+"deg)");
					// this.regiest.style.setProperty("transform","rotate("+this.deg*this.count+"deg)");
					console.log(this.count);
					let trans1=(this.count%2)>0?1:0;
					let trans2=(this.count%2)>0?0:1;
					this.login.style.setProperty("top",this.top[trans1]);
					this.login.style.setProperty("left",this.left[trans1]);
					this.regiest.style.setProperty("top",this.top[trans2]);
					this.regiest.style.setProperty("left",this.left[trans2]); 
					this.count++;
				});
				this.button.addEventListener('mousemove',()=>{
					let content=document.styleSheets[1].cssRules[10];
					content.style.color="gold";
				});
				this.button.addEventListener('mouseout',()=>{
					let content=document.styleSheets[1].cssRules[10];
					content.style.color="black";
				});
			}
		}
		loginToRegiest.transform();
		
		 $("#submit").on("click",()=>{
			$.ajax({
			url:"ClientServlet",
			type:"post",
			dataType:"JSON",
			async:false,
			data:{
				method:"login",
				c_id:$("input[name='c_id']").val(),
				password:$("input[name='password']").val()
			},
			success:function(value){
				event.returnValue=false;
				if(value==false){
					$("input[name=c_id]").val("");
					$("input[name=c_id]").attr("placeholder","账号或密码错误");
					$("input[name=password]").val("");
					event.returnValue=false;
				}
			},
			error:function(){      	
			}
		});
		});
		 $("input[name='c_password']").on("blur",()=>{
			 let regiest=$("input[name='r_password']");
			 let check=$("input[name='c_password']");
			 if(regiest.val()!==check.val()){
				 // console.log(document.getElementsByName("c_password")[0].setCustomValidity("两次密码输入不一样"));;
				 alert("两次输入的密码需要一样");
				 check.val("");
			 }else{
				 document.getElementsByName("c_password")[0].setCustomValidity("");
			 }
		 });
		 $("button").eq(1).on("click",()=>{
			 $.ajax({
				 url:"ClientServlet",
				 type:"post",
				 dataType:"JSON",
				 async:false,
				 data:{
					 insert:"insert",
					 method:"regist",
					 c_id:$("input[name='r_id']").val(),
					 password:$("input[name='r_password']").val(),
					 address:$("input[name='address']").val(),
					 c_name:$("input[name='c_name']").val(),
					 gender:$("input[name='sex']").eq(0).val()?$("input[name='sex']").eq(0).val():$("input[name='sex']").eq(1).val()
				 },
				 success:function(value){
					 
					 if(value==false){
						 $("input[name='r_id']").val("");
						 $("input[name='r_id']").attr("placeholder","该手机号已经被注册");
						 event.returnValue=false;
					 }
				 },
				 error:function(){
					 event.returnValue=true;
				 }
			 });
		 });
		
	</script>
</html>

