<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
</head>
<script src=" http://at.alicdn.com/t/font_2232371_uexjvk1z6t.js"></script>
<%@ include file="/WEB-INF/include/base.jsp"%>
<%@ include file="/WEB-INF/include/welcome.jsp" %>
<script type="text/javascript">
	$(function(){
		/*	分页查询
		 *
		 *
		 *
		 */
		$("#sub_page").click(function(){
			//取pageNo值
			var pageNo = $("#pn_input").val();
			var min_price = $("input[name=min_price]").val();//[name]属性选择器
			var max_price = $("input[name=max_price]").val();
			
			location = "BookClientServlet?"
				+"method=getBooksByPrice"
				+"&pageNo=" + pageNo
				+"&min_price=" + min_price
				+"&max_price=" + max_price;
		});


		
		/*
		 *	实现带价格区间的分页查询
		 *
		 *
		 *
		 *
		class标签book_cond唯一
		:button 过滤选择器 表示所有的button
		button 标签选择器
		空格 表示后代
		> 表示子代
		*/
		$(".book_cond :button").click(function(){
			//取pageNo,min,max值
			var pageNo = $("#pn_input").val();
			var min_price = $("input[name=min_price]").val();//[name]属性选择器
			var max_price = $("input[name=max_price]").val();
			//alert("pageNo:" + pageNo);
// 			alert(min_price);
// 			alert(max_price);

			//请求BookListClientServlet
			location = "BookClientServlet?"
				+"method=getBooksByPrice"
				+"&pageNo=" + pageNo
				+"&min_price=" + min_price
				+"&max_price=" + max_price;
		});


		/*
		 * 	添加book到cart中
		 *
		 *
		 *
		 */
		$(".book_add button").click(function(){
			//取值，取book的p_id
			var bookId = $(this).attr("id");
			var pageNo = $("#pn_input").val();
			var min_price = $("input[name=min_price]").val();//[name]属性选择器
			var max_price = $("input[name=max_price]").val();
			//调用Servlet
			location = "CartServlet?method=addBookToCart&bookId=" + bookId;
			
		});
			
		
	});

	// 控制选择样式
	$(()=>{
	    $("#choice>li").click(function(){
	        $("#choice>li").css({
	            "border":"2px solid transparent",
	            "border-bottom":"2px solid rgba(12,232,254,.8)",
	            "background-image": "none"
	            });
	        $(this).css({
	            "border":"2px solid rgba(12,232,254,.8)",
	            "border-bottom":"2px solid white",
	            "background-image": "linear-gradient(to right, #4facfe 0%, #00f2fe 100%)"
	        })
	        $("#type_search").css("border","2px solid rgba(12,232,254,.8)");
	        $("#choice").css("height","32px");
	    });
	
	    $("#type_search").focus(function(){
	        $("#choice").css("height","32px");
	    });
	    $("#type_search").blur(function(){
	        $("#choice").css("height","0px");
	    });
	    $("#close").unbind();
	    $("#close").click(function(){
	        $("#choice").css("height","0px");
	    });
	
	})
</script>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    body{
        background-color: rgba(9,7,35,1);
    }
    a{
        text-decoration: none;
    }
    .booklist{
        float: left;
        margin-top: 10px;
        margin-right: 10px;
        width: 200px;
        border-radius: 5px;
        border: 1.5px solid wheat;
        background-color: rgba(12,232,254,.2);
    }
    .booklist:hover{
        box-shadow: 3px 1px 10px 2px wheat;
    }
    .img{
    width: 100%;
    height: 160px;
    cursor: pointer;
    }
    .des{
        position: relative;
        color: antiquewhite;
    }
    .des:hover{
       
        /* background-color: rgba(12,232,254,.3); 
         text-shadow: 1px 1px 6px  white;*/
    }
    .des>li{
    list-style: none;
    font: 700 14px/1.5em '宋体';
    overflow: hidden;
    border-top:1px dashed wheat ;
    } 
    .des>li:nth-of-type(-n+4){
        display: grid;
        grid-template-columns: 1fr 2fr;
    }
    .des>li>span:nth-of-type(1){
        text-align: right;
        margin-right: 5px;
    }
    .des>li:nth-of-type(5){
        position: absolute;
        bottom: -12px;
        right: -7px;
        border: none;
    }
    .des>li:nth-of-type(5)>a{
        float: right;
        padding: 10px;
        cursor: pointer;
    }
    .des>li:nth-of-type(5):after{
        content: "";
        display: block;
        clear: both;
    }
 #svg_car{
     width: 35px;
     height: 35px;
     border: 2px solid transparent;
     border-radius: 50%;
 }
 #svg_car:hover{
    border: 2px solid rgba(12,232,254,.8);
    box-shadow: 0px 0px 14px 5px rgba(12,232,254,.8);
    border:2px solid rgba(249, 188, 30, 1);
    box-shadow:  0px 0px 14px 2px rgba(249, 188, 30, 1);
 }
 </style>
<body>
    <section id="main_search">
        <form action="BookClientServlet?method=detailSearch" method="post">
            <ul id="choice">
                <li><label for="b_name">书名</label><input id="b_name" type="radio" name="stype" value="b_name" checked></li>
                <li><label for="isbn">ISBN</label><input id="isbn" type="radio" name="stype" value="ISBN" ></li>
                <li><label for="author">作者</label><input id="author" type="radio" name="stype" value="author"></li>
                <li id="close"><svg style="width: 34px;height: 34px;" class="icon" aria-hidden="true"><use xlink:href="#icon-zhedie1"></use></svg></li>
            </ul>
            <input id="type_search" placeholder="按书籍类型查询" type="search" name="main_search" style="font-family: '宋体';">
        </form>
    </section>
    
    
<!-- 商品展示 -->
	<div id="header">
<!-- 			<img class="logo_img" alt="" src="static/img/logo.gif" width= "75px" > -->
<!-- 			<span class="wel_word">二手书交易系统</span> -->
	</div>
	
	<div id="main">
		<div id="book">
			<div class="book_cond">
				价格：<input type="text" name="min_price" value = "${param.min_price }"> 元 - 
				<input type="text" name="max_price" value = "${param.max_price }"> 元 
				<button>查询</button>
			</div>
			<div style="text-align: center">
				<c:if test="${not empty sessionScope.cart.totalCount && sessionScope.cart.totalCount != 0}">
					<span>您的购物车中有${sessionScope.cart.totalCount }件商品</span>
				</c:if>
				<div>
				<c:if test="${not empty sessionScope.b_name }">
					您刚刚将<span style="color: red">${sessionScope.b_name }</span>加入到了购物车中
				</c:if>
				<c:remove var="b_name"/>
				<c:if test="${not empty sessionScope.msg }">
					<span style="color: red">${sessionScope.msg }</span>
				</c:if>
				<c:remove var="msg"/>
				</div>
			</div>
			
			<c:forEach items="${requestScope.books.list }" var="book">
				<div class="b_list">
					<div class="img_div">
						<img class="book_img" alt="" src="static/img/default.jpg" />
					</div>
					<div class="book_info">
						<div class="bookList_ISBN">
							<span class="sp1">ISBN:</span>
							<span class="sp2">${book.bookList.ISBN }</span>
						</div>
						<div class="bookList_b_name">
							<span class="sp1">书 名:</span>
							<span class="sp2">《${book.bookList.b_name }》</span>
						</div>
						<div class="bookList_b_name">
							<span class="sp1">作者:</span>
							<span class="sp2">${book.bookList.author }</span>
						</div>
						<div class="bookList_publisher">
							<span class="sp1">出版社:</span>
							<span class="sp2">${book.bookList.publisher }</span>
						</div>
						<div class="bookList_price">
							<span class="sp1">价 格:</span>
							<span class="sp2">${book.price }</span>
						</div>
						<div class="book_add">
							<button id="${book.p_id }">加入购物车</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
<!-- 

		【1】23（如果只有三页）
假设只有9页
		【1】2345
		1【2】345
		12【3】45
		34【5】67
		45【6】78
		567【8】9
		5678【9】
		
		totalPageNo<5
			begin=1
			end=totalPageNo
		totalPageNo>5
			pageNo<=3
				begin=1
				end=5
			pageNo>3 && pageNo<=totalPageNo-2
				begin=pageNo-2
				end=pageNo+2
			pageNo>totalPageNo-2
				begin=totalPage-4
				end=totalPage

-->
		<div id="page_nav">
		<!-- 
		如果第一个when的没进，说明totalPageNo≥5了，就没必要判断了 
		顺便吐槽，choose里面居然不能放“<!-- 注解”？
		-->
<%-- 		${requestScope.booksByPrice.totalPageNo ==null} --%>
		<c:choose>
			<c:when test="${requestScope.books.totalPageNo<5 }">
				<c:set var="begin" value="1" scope="page"></c:set>
				<c:set var="end" value="${requestScope.books.totalPageNo }" scope="page"></c:set>
			</c:when>
			<c:when test="${requestScope.books.pageNo<=3 }">
				<c:set var="begin" value="1" scope="page"></c:set>
				<c:set var="end" value="5" scope="page"></c:set>
			</c:when>
			<c:when test="${requestScope.books.pageNo>3 && requestScope.books.pageNo <= (requestScope.books.totalPageNo-2) }">
				<c:set var="begin" value="${requestScope.books.pageNo-2 }" scope="page"></c:set>
				<c:set var="end" value="${requestScope.books.pageNo+2 }" scope="page"></c:set>
			</c:when>
			<c:when test="${requestScope.books.totalPageNo == null }">
				<c:set var="begin" value="0" scope="page"></c:set>
				<c:set var="end" value="0" scope="page"></c:set>		
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${requestScope.books.totalPageNo-4 }" scope="page"></c:set>
				<c:set var="end" value="${requestScope.books.totalPageNo }" scope="page"></c:set>		
			</c:otherwise>
		</c:choose>
		
<!-- 分页及页面跳转 
 默认从最小域拿，那就是pageScope，符合上面page_nav   

【故障】严重: Servlet.service() for servlet jsp threw exception
javax.servlet.jsp.JspTagException: 'begin' < 0
【问题分析】
${begin }之前出过问题，准确来说是取到的totalPageNo出了问题，
<h1>-- ${requestScope.booksByPrice.totalPageNo }&nbsp;--</h1>   取到的值是-4
然后我到dao层为止调出来的totalPageNo都是没有问题的。（正常来说是6）
【解决方式】
然后到mysql里面把storepersonal的ISBN改成不重复的，就可以了。
为什么他是-4呢？
【hw】因为c:otherwise中totalPageNo是0，所以begin变成了-4
-->
		<c:forEach var="i" begin="${pageScope.begin }" end="${pageScope.end }" step="1">
<!-- 		如果是当前页，【】 -->
			<c:if test="${requestScope.books.pageNo == i }">
				【${i }】
			</c:if>
<!-- 		如果不是当前页，给一个供跳转的超链接 -->
			<c:if test="${requestScope.books.pageNo != i && i != 0}">
				<a href="BookClientServlet?method=getBooksByPrice&pageNo=${i }&min_price=${param.min_price }&max_price=${param.max_price }">${i }</a>
			</c:if>
		</c:forEach>
		<a href="#">首页</a>
		共${requestScope.books.pageNo }/${requestScope.books.totalPageNo }页，${requestScope.books.totalRecord }条记录&nbsp;&nbsp;&nbsp;
		到第<input value="${requestScope.books.pageNo }" name="pn" id="pn_input"/>页
		<input id="sub_page" type="button" value="确定">
		</div>
	
	</div>

	<div id="bottom">
		<span>
			Jmu二手书交易系统.Copyright &copy;2020
		</span>
	</div>
</body>
</html>