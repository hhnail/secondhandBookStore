<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<script type="text/javascript">
	$(function(){
		/*click事件1:确认删除吗    
		不会写，从book_manager抄的  
		*/
		$(".deleteConfirm").click(function(){
 			var deleteB_name =  $(this).attr("id");//这里的id是这个class对应的节点的id
			if(confirm("确认删除【"+  deleteB_name +"】吗？") == false){
				return false;
			}
		});

		/*click事件2:确认清空购物车吗    */
		$(".emptyConfirm").click(function(){
			if(confirm("确认删除清空购物车吗？") == false){
				return false;
			}
		});


		//change事件：更改购物车的数量
		$(".cartItemCount").change(function(){
			//1.取值
			var bookId = $(this).attr("id");//用id属性，获取b_id
			var stock = $(this).attr("name");//用name属性，获取系统库存
			var count = $(this).val();//用户输入的数量，即value的内容

			//1.2获取默认值
			var dValue = this.defaultValue;

			//2.jQuery校验
			//2.1 数量为非0正整数
			var countReg = /^\+?[1-9][0-9]*$/;//定义正则规则
			if(!countReg.test(count)){
				alert("数量输入有误，请重新输入！（数量一般为非0正整数）");//提示信息
				$(this).val(dValue);//并修改为默认值
				return false;
			}

			//2.2验证库存
			if(parseInt(count)>parseInt(stock)){
				/*
				count和stock都是string类型
				建议转化为数组进行比较
				js没有int类型，但是有parseInt方法，转化后类型为number类型
				*/
				alert("系统库存不足，该商品只剩["+ stock +"件]啦！您可以选择发布需求");//提示信息
				$(this).val(dValue);//并修改为默认值
				return false;
			}
			

			//3.调用CartServlet
			location = "CartServlet?method=updateCartItemCount"
				+"&bookId="+bookId
				+"&count="+count;
// 			var target =  "CartServlet?method=updateCartItemCount"+
// 			"&bookId="+bookId+
// 			"&count="+count;
			
// 			alert(target);
		});
		
		
	});
	function sub_goods(){
			$("#sup_goods").submit();
// 			location = "OrderServlet?method=createOrderOnDetail";
			alert("");
     }
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/welcome.jsp" %>
	<div id="header" style=" background-color: rgba(241,241,189,1);">
	</div>
	<div id="main">
<%-- 	<c:if test="${sessionScope.cart.totalCount!=0 }"> --%>
		<c:if test="${empty sessionScope.cart.totalCount || sessionScope.cart.totalCount == 0}"><br><br><br><br><br><br>
			<h1 align="center">购物车内暂时没有商品哦，快去<a href="index.jsp" style="color:red">购物</a>吧~</h1>
		</c:if>
		<c:if test="${sessionScope.cart.totalCount != 0 && sessionScope.cart.totalCount!=null}">
		<form id="sup_goods" action="BookClientServlet?method=getBuyBooks" method="post">
		   <ul id="shouNeedState">
        <li>
            <span>图片</span>
            <span>书名</span>
            <span>ISBN</span>
            <span>商家</span>
            <span>数量</span>
            <span>金额</span>
            <span>操作</span>
        </li>
         <c:forEach items="${sessionScope.cart.cartItems }" var="cartItem">
         <li>
            <img src="${cartItem.img_path }" alt="">
            <span>${cartItem.b_name}</span>
            <span>${cartItem.ISBN}</span>
            <span class="showshangjia">
            <c:forEach var="book" items="${cartItem.book }">
             <div >${book.client.c_name } | ${book.client.credit} 
             <input type="hidden" name="choiceBook" value="${book.p_id}">
                  | <a class="deleteConfirm" id = "${cartItem.b_name }" href="CartServlet?method=deleteBookInCartItem&p_id=${book.p_id }">删除</a>
            </div>
             </c:forEach>
            </span>
            <span>${cartItem.count }</span>
            <span>${cartItem.price }</span>
            <span><a class="deleteConfirm" id = "${cartItem.b_name }" href="CartServlet?method=deleteBookInCart&ISBN=${cartItem.ISBN }">删除</a></span>
           
        </li>
        </c:forEach>
    </ul>
    </form>
<!-- 			<table > -->
<!-- 				<tr> -->
<!-- 					<td>图片</td> -->
<!-- 					<td>ISBN</td> -->
<!-- 					<td>名称</td> -->
<!-- 					<td>单价|商家|商家信用</td> -->
<!-- 					<td>数量</td>					 -->
<!-- 					<td>金额</td> -->
<!-- 					<td>操作</td> -->
<!-- 				</tr>		 -->
<%-- 				<c:forEach var="cartItem" items="${sessionScope.cart.cartItems }"> --%>
<!-- 					<tr> -->
<!-- 						<td><img src="static/img/default.jpg"  alt="图片找不到了~" style="width: 80px;height: 80px"/></td> -->
<%-- 						<td>${cartItem.ISBN }</td> --%>
<%-- 						<td>${cartItem.b_name }</td> --%>
<!-- 						<td><select style="width:120px;height:28px;" multiple="multiple;"> -->
<%-- 							<c:forEach var="book" items="${cartItem.book }"> --%>
<%-- 								<option value="1">${book.price }|${book.client.c_name }|${book.client.credit }</option> --%>
<%-- 								<a class="deleteConfirm" id = "${cartItem.b_name }" href="CartServlet?method=deleteBookInCart&ISBN=${cartItem.ISBN }">删除</a> --%>
<%-- 							</c:forEach> --%>
<!-- 　　						</select></td> -->
<%-- 						<td>${cartItem.count }</td> --%>
<%-- 						<td>${cartItem.price }</td> --%>
<%-- 						<td><a class="deleteConfirm" id = "${cartItem.b_name }" href="CartServlet?method=deleteBookInCart&ISBN=${cartItem.ISBN }">删除</a></td> --%>
<!-- 					</tr>		 -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
			<div class="cart_info">
				<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount }</span>项商品</span>
				<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice }</span>元</span>
				<span class="cart_span"><a class="emptyConfirm" href="CartServlet?method=empytCart">清空购物车</a></span>
				<span class="cart_span"><a href="#" onclick="sub_goods()">去结账</a></span>
				<span class="cart_span"><a href="index.jsp">继续购物</a></span>
			</div>
		</c:if>
	</div>
	<div id="bottom">
		<span>
			Jmu二手书系统.Copyright &copy;2020
		</span>
	</div>
</body>
<style>
    #shouNeedState{
        list-style: none;
        display: grid;
        grid-template-rows: auto;
        width: 85%;
        margin: 0 auto;
    }
    #shouNeedState>li{
        background-color: aliceblue;
        display: grid;
        margin-bottom: 5px;
        grid-template-columns:repeat(7,1fr);
        align-items: center;
        justify-items: center;
        border-radius:5px;
    }
    #shouNeedState>li:nth-of-type(1){
        height: 40px;
       
    }
    #shouNeedState>li:nth-of-type(n+2){
        height: 130px;
       
    
    }
    #shouNeedState>li>img{
        width: 100px;
        height: 120px;
    }
    #shouNeedState>li>span>a{
        display:block;
        height:40px;
        line-height:40px;
        padding:0 20px;
        text-decoration:none;
        background-color:rgba(241,241,189,1);
        border-radius:5px;
    }
    #shouNeedState>li>span>a:hover{
         background-color:rgba(30,210,254,1); 
      }
     #shouNeedState>li>span>a:nth-of-type(1){
        margin-bottom:10px;
     }
     .showshangjia{
     height:90px;
     width:160px;
/*      background-color:red; */
     overflow:auto;
     }
</html>