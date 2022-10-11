<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<script src=" http://at.alicdn.com/t/font_2232371_uexjvk1z6t.js"></script>
<%@ include file="/WEB-INF/include/base.jsp"%>
<script type="text/javascript">
	$(function() {
		/*	分页查询
		 *
		 *
		 *
		 */
		$("#sub_page").click(
				function() {
					//取pageNo值
					var pageNo = $("#pn_input").val();
					var min_price = $("input[name=min_price]").val();//[name]属性选择器
					var max_price = $("input[name=max_price]").val();

					location = "BookClientServlet?"
							+ "method=getBooksForClientInPage" + "&pageNo="
							+ pageNo;
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
		$(".book_cond :button").click(
				function() {
					//取pageNo,min,max值
					var pageNo = $("#pn_input").val();
					var min_price = $("input[name=min_price]").val();//[name]属性选择器
					var max_price = $("input[name=max_price]").val();
					//alert("pageNo:" + pageNo);
					// 			alert(min_price);
					// 			alert(max_price);

					//请求BookListClientServlet
					location = "BookClientServlet?" + "method=getBooksByPrice"
							+ "&pageNo=" + pageNo;
				});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/welcome.jsp"%>
	<div id="header">
		<img class="logo_img" alt="" src="static/img/logo.gif" width="75px">
		<span>图书管理</span>
	</div>

	<div id="main">
		<c:if test="${empty requestScope.books.list }">
			<h1 align="center">
				您暂时没有上架书本。<a href="pages/user/putaway.jsp" style="color: red">点击上架</a>
			</h1>
		</c:if>
		<c:if test="${not empty requestScope.books.list }">
			<table>
				<tr>
					<td>《书名》-ISBN</td>
					<td>新旧程度</td>
					<td>商品描述</td>
					<td>价格</td>
					<td>状态</td>
					<td colspan="2">操作</td>
				</tr>
				<c:forEach items="${requestScope.books.list }" var="books">
					<tr>
						<td>《${books.bookList.b_name }》-${books.bookList.ISBN }</td>
						<td>${books.degree }</td>
						<td>${books.des }</td>
						<td>￥${books.price }</td>
						<td>${books.state }</td>
						<c:if
							test="${books.state=='待售' and sessionScope.client.c_id != 'admin' }">
							<td><a
								href="BookListServlet?method=getBookListByISBN&ISBN=${bookListsInPage.ISBN }">修改</a>
								<a class="deleteConfirm" id="${books.bookList.b_name }"
								href="BookClientServlet?method=deleteBook&p_id=${books.p_id }">删除</a>
							</td>
							<td><a
								href="BookListServlet?method=getBookListByISBN&ISBN=${books.bookList.ISBN }">上架</a>
							</td>

						</c:if>

						<c:if test="${sessionScope.client.c_id == 'admin' }">
							<c:if test="${books.state=='待售' }">
								<td colspan="2"><a
									href="BookListServlet?method=getBookListByISBN&ISBN=${books.bookList.ISBN }">违规下架</a>
								</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>

				<!-- 上架图书部分 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="pages/user/putaway.jsp">上架图书</a></td>
				</tr>
			</table>
			<div id="page_nav">

				<!-- 		编辑页码结构 -->
				<!-- choose中间不能放注释 -->
				<c:choose>
					<c:when test="${requestScope.books.totalPageNo<5 }">
						<c:set var="begin" value="1" scope="page"></c:set>
						<c:set var="end" value="${requestScope.books.totalPageNo }"
							scope="page"></c:set>
					</c:when>
					<c:when test="${requestScope.books.pageNo<=3 }">
						<c:set var="begin" value="1" scope="page"></c:set>
						<c:set var="end" value="5" scope="page"></c:set>
					</c:when>
					<c:when
						test="${requestScope.books.pageNo>3 && requestScope.books.pageNo <= (requestScope.books.totalPageNo-2) }">
						<c:set var="begin" value="${requestScope.books.pageNo-2 }"
							scope="page"></c:set>
						<c:set var="end" value="${requestScope.books.pageNo+2 }"
							scope="page"></c:set>
					</c:when>
					<c:when test="${requestScope.books.totalPageNo == null }">
						<c:set var="begin" value="0" scope="page"></c:set>
						<c:set var="end" value="0" scope="page"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${requestScope.books.totalPageNo-4 }"
							scope="page"></c:set>
						<c:set var="end" value="${requestScope.books.totalPageNo }"
							scope="page"></c:set>
					</c:otherwise>
				</c:choose>

				<!-- 		展示页码 -->
				<c:forEach var="i" begin="${pageScope.begin }"
					end="${pageScope.end }" step="1">
					<!-- 		如果是当前页，【】 -->
					<c:if test="${requestScope.books.pageNo == i }">
				【${i }】
			</c:if>
					<!-- 		如果不是当前页，给一个供跳转的超链接 -->
					<c:if test="${requestScope.books.pageNo != i && i != 0}">
						<a
							href="BookClientServlet?method=getBooksForClientInPage&pageNo=${i }">${i }</a>
					</c:if>
				</c:forEach>
				<a href="BookClientServlet?method=getBooksForClientInPage&pageNo=1">首页</a>
				共${requestScope.books.pageNo }/${requestScope.books.totalPageNo }页，${requestScope.books.totalRecord }条记录&nbsp;&nbsp;&nbsp;
				到第<input value="${requestScope.books.pageNo }" name="pn"
					id="pn_input" />页 <input id="sub_page" type="button" value="确定">
			</div>
		</c:if>
	</div>
	<div id="bottom">
		<span> Jmu二手书交易系统.Copyright &copy;2020 </span>
	</div>
</body>
</html>