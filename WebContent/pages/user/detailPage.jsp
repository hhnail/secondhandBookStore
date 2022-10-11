<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品详情页</title>
</head>
<%@ include file="/WEB-INF/include/welcome.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="static/script/jquery.js"></script>
<base
	href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">

<!-- CSS -->
<style>
* {
	margin: 0;
	padding: 0;
}

#detail {
	/*         margin-top: -500px; */
	width: 970px;
	height: 375px;
	margin: 0 auto;
	padding: 10px;
	border-radius: 5px;
	background-color: white;
	box-shadow: 0px 0px 10px 10px white;
}

#detail::after {
	content: "";
	display: block;
	clear: both;
}

#d_head {
	width: 100%;
	height: 90px;
	/* background-color: rgb(230, 230, 230);
         */
	background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
	/* background-image: linear-gradient(to top, lightgrey 0%, lightgrey 1%, #e0e0e0 26%, #efefef 48%, #d9d9d9 75%, #bcbcbc 100%); */
}

#d_head>div>div {
	padding-left: 360px;
}

#d_head>div:nth-of-type(1) {
	width: 80%;
	margin-left: 20px;
	display: inline-block;
}

#d_head>div:nth-of-type(2) {
	float: right;
	width: 120px;
	height: 100%;
	text-align: center;
	border-left: 2px solid white;
	cursor: pointer;
	background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
}

#d_head>div:nth-of-type(2)>div {
	padding: 0px;
	height: 33.3%;
	width: 120px;
	text-align: center;
	font: 700 20px/140% '宋体';

	/* background-color: aquamarine; */
}

#d_head>div:nth-of-type(2)>div:nth-of-type(2) {
	border-bottom: 2px solid white;
	border-top: 2px solid white;
}

.name {
	font: normal 900 40px/1.5 '楷体';
}

.image {
	width: 370px;
	height: 370px;
	/* padding-left: 70px; */
}

#des_choice {
	list-style: none;
	display: grid;
	grid-template-columns: 1fr 1.8fr;
	height: 200px;
	padding-left: 20px;
}

#des_choice li:nth-of-type(2) {
	display: grid;
	/* display: flex; */
	overflow: auto;
	grid-template-rows: auto;
	/* flex-direction: column; */
	/* grid-template-rows: 1fr 1fr; */
}

#des_choice li:nth-of-type(1) {
	text-indent: 2em;
	font: 500 20px/24px '楷体';
	text-decoration: underline;
}

#des_choice li:nth-of-type(1)>p {
	display: none;
}

#d_bottom {
	display: grid;
	grid-template-columns: 3fr 1.5fr 1.5fr;
	height: 80px;
	padding-left: 15px;
	background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
	/* background-color: rgb(230, 230, 230); */
	/* background-image: linear-gradient(to top, lightgrey 0%, lightgrey 1%, #e0e0e0 26%, #efefef 48%, #d9d9d9 75%, #bcbcbc 100%); */
}

#d_bottom>div {
	padding-top: 15px;
	font-size: 24px;
}

#des_choice li:nth-of-type(2)>div {
	display: grid;
	grid-template-columns: .5fr 1.5fr .5fr 1fr .5fr;
	font-size: 20px;
	text-align: center;
	overflow: hidden;
	height: 25px;
	margin: 5px 0;
	padding-bottom: 5px;
}

#des_choice li:nth-of-type(2)>div:hover {
	/* background-color: aqua; */
	background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	/* background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%); */
}

#des_choice li:nth-of-type(2)>div>span>input {
	width: 24px;
	height: 26px;
	margin-top: 1px;
	/* border-radius: 50%; */
}

#submit {
	width: 600px;
	height: 400px;
	float: right;
	overflow: hidden;
	/* height: ; */
}

#goodsImg {
	float: left;
	margin-top: -90px;
}

#car, #buy {
	margin-top: -15px;
	margin-left: 10px;
	/* height: 121%; */
	display: block;
	/* background-color: antiquewhite; */
	line-height: 80px;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	font-size: 20px;
}

#car:hover, #buy:hover {
	/* background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%); */
	/*         background-image: linear-gradient(to right, #f9d423 0%, #ff4e50 100%); */
	/*            background-image: linear-gradient(to right, #f9d423 0%, #ff4e50 100%); */
	background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
	border: 2px solid gray;
}

#d_head>div:nth-of-type(2)>div:hover {
	/*         background-image: linear-gradient(to right, #0acffe 0%, #495aff 100%); */
	background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
}

#car {
	/*         border-right:2px solid white ; */
	
}

.name {
	text-shadow: 0 1px 1px black, 0 -1px 0 black;
	text-shadow: -1px 0px 0 #fff, -1px 1px 0 #fff, 0px 1px 0 #fff, 1px 1px 0
		#fff, 1px 0px 0 #fff, 1px -1px 0 #fff, 0px -1px 0 #fff, -1px -1px 0
		#fff, -1px 1px 3px gray, -2px 2px 3px black, -3px 3px 3px gray, -4px
		4px 3px black;
}
</style>


<!-- body -->
<body>
	<div
		style="height: 50px; text-align: center; color: red; font-size: 24px">
		${requestScope.msg }</div>
	<section id="detail">
		<div id="d_head">
			<div>
				<div class="name">${detailBookList.b_name }</div>
				<div class="isbe">${detailBookList.ISBN }</div>
			</div>
			<div>
				<div id="c_up">信用↑</div>
				<div id="p_down" class="down">价格↑</div>
				<div id="new">新旧↑</div>
			</div>
		</div>
		<div id="goodsImg">
			<img class="image" src="${detailBookList.img_path }" alt="">
		</div>
		<!--     <form id="submit" action="CartServlet?method=addBookFromListToCart" method="post"> -->
		<form id="submit" action="CartServlet?method=addBookFromListToCart"
			method="post">
			<input type="hidden" value="${detailBookList.ISBN }" name="ISBN1">
			<ul id="des_choice">
				<li><c:forEach items="${requestScope.detailBookList.books }"
						var="des_list">
						<p class="${des_list.p_id}">${des_list.des}</p>
					</c:forEach></li>
				<li>
					<div class="shadow">
						<span></span><span>商家</span><span>信誉</span><span>价格</span><span>新旧程度</span>
					</div> <c:forEach items="${requestScope.detailBookList.books }"
						var="client_list">
						<div class="${client_list.p_id}">
							<span><input type="checkbox" value="${client_list.p_id}"
								name="choiceBook"></span><span>${client_list.client.c_name}</span><span
								class="cr">${client_list.client.credit}</span><i class="pr">${client_list.price}</i><span
								class="new">${client_list.degree}</span>
						</div>
					</c:forEach>
				</li>
			</ul>
			<div id="d_bottom">
				<div>
					<span>合计:￥</span><span id="showprice"></span>
				</div>
				<div>
					<c:if test="${not empty sessionScope.client }">
						<a id="car" onclick="sub_car()">加入购物车</a>
					</c:if>
					<c:if test="${empty sessionScope.client }">
						<a id="buy" href="pages/user/login.jsp">加入购物车</a>
					</c:if>
				</div>
				<div>
					<c:if test="${not empty sessionScope.client }">
						<a id="buy" onclick="sub_buy()">购买</a>
					</c:if>
					<c:if test="${empty sessionScope.client }">
						<a id="buy" href="pages/user/login.jsp">购买</a>
					</c:if>
				</div>
			</div>
		</form>
	</section>
	<script>
function sub_car(){
	$("#submit").submit();

// 	$(".buy").click(function(){
// 		location="OrderServlet?method=checkOut";
// 	});
	
}
function sub_buy(){
	$("#submit").attr("action","BookClientServlet?method=getBuyBooks");
	$("#submit").submit();
}
    $(()=>{
        $("#des_choice div").on('mouseover',()=>{
            let change=$(event.target).parents().attr("class");
            $("p[class="+change+"]").css("display","block");
            console.log($("p[class="+change+"]"));
        });
        $("#des_choice div").on('mouseout',()=>{
            let change=$(event.target).parents().attr("class");
            $("p[class="+change+"]").css("display","none");
        });
        $("input[name=choiceBook]").on("click",()=>{
            let list=$("input:checkbox[name='choiceBook']:checked");
            let totalPrice=0;
            for(let i=0;i<list.length;i++){
                totalPrice+=list.eq(i).parent().parent().find("i").html()-0;
            }
            $("#showprice").html(totalPrice);
        });
        
        $("#p_down").on("click",()=>{
            let showList=$("i[class=pr]").parent();
            let fianllist=[];
            $.map($("i[class=pr]"),function(value,index,array){
                fianllist.push(value.innerHTML-0);   
            });
            console.log($("#p_down").attr("class"));
            console.log(fianllist);
            if($("#p_down").attr("class")=="down"){
                $("#p_down").attr("class","up");
                $("#p_down").html("价格↓");
                fianllist.sort((a,b)=>{return a-b});
            }else{
                $("#p_down").attr("class","down");
                $("#p_down").html("价格↑");
                fianllist.sort((a,b)=>{return b-a});
            }
            console.log(fianllist);
            let array=[];
            for(let i=0;i<fianllist.length;i++){
                for(let x=0;x<fianllist.length;x++){
                    if(($("i[class=pr]").eq(i).html()-0)==fianllist[x]){
                    	fianllist[x]="x";
                        array.push(x+1-0);
                        break;
                    }
                }                
            }
            console.log(array);
            for(let i=0;i<array.length;i++){
                showList.eq(i).css("order",array[i]+"");
                console.log( showList.eq(i).css("order"));
            }
        });
        $("#c_up").on("click",()=>{
            let showList=$("span[class=cr]").parent();
            console.log(showList);
            let fianllist=[];
            $.map($("span[class=cr]"),function(value,index,array){
                fianllist.push(value.innerHTML-0);   
            });
            console.log(fianllist);
            if($("#c_up").attr("class")=="up"){
                $("#c_up").attr("class","down");
                $("#c_up").html("信用↑");
                fianllist.sort((a,b)=>{return a-b});
            }else{
                $("#c_up").attr("class","up");
                $("#c_up").html("信用↓");
                fianllist.sort((a,b)=>{return b-a});
            }
            let array=[];
            console.log(fianllist);
            for(let i=0;i<fianllist.length;i++){
                for(let x=0;x<fianllist.length;x++){
                    if(($("span[class=cr]").eq(i).html()-0)==fianllist[x]){
                    	fianllist[x]="x";
                        array.push(x+1-0);
                        break;
                    }
                }                
            }
            console.log(array);
            for(let i=0;i<array.length;i++){
                showList.eq(i).css("order",array[i]+"");
            }
        });
        $("#new").on("click",()=>{
            let showList=$("span[class=new]").parent();
            console.log(showList);
            let fianllist=[];
            $.map($("span[class=new]"),function(value,index,array){
                fianllist.push(value.innerHTML-0);   
            });
            console.log(fianllist);
            if($("#new").attr("class")=="up"){
                $("#new").attr("class","down");
                $("#new").html("新旧↑");
                fianllist.sort((a,b)=>{return a-b});
            }else{
                $("#new").attr("class","up");
                $("#new").html("新旧↓");
                fianllist.sort((a,b)=>{return b-a});
            }
            let array=[];
            console.log(fianllist);
            for(let i=0;i<fianllist.length;i++){
                for(let x=0;x<fianllist.length;x++){
                    if(($("span[class=new]").eq(i).html()-0)==fianllist[x]){
                    	fianllist[x]="x";
                        array.push(x+1-0);
                        break;
                    }
                }                
            }
            console.log(array);
            for(let i=0;i<array.length;i++){
                showList.eq(i).css("order",array[i]+"");
            }
        });



        /*
		 * 	添加book到cart中
		 *
		 *
		 *
		 */
		$(".book_add button").click(function(){
			//取值，取book的p_id
			alert("cart");
			var bookId = $(this).attr("id");
			var pageNo = $("#pn_input").val();
			var min_price = $("input[name=min_price]").val();//[name]属性选择器
			var max_price = $("input[name=max_price]").val();
			//调用Servlet
			location = "CartServlet?method=addBookToCart&bookId=" + bookId;
			
		});
    })
</script>
</body>
</html>