<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<script type="text/javascript">
// 	alert("ee");//测试js有没有错
// 	alert($);//测试jQuery库是否成功导入
	$(function(){
		//click事件1:确认删除吗
		$(".deleteConfirm").click(function(){
/**
 * 方法一 先获取该节点的父节点，然后拿第一个子节点的html信息
 	var deleteISBN =  $(this).parents("tr").children().html();
	if(confirm("确认删除【"+  deleteISBN +"】吗？") == false)
		
 * 方法二 直接通过该节点的id拿需要的信息
 * 而且想直接拿什么就拿什么
 * 注意：id不能重复，但是${bookList.b_name } 可不是定值
 */
 			var deleteB_name =  $(this).attr("id");//这里的id是这个class对应的节点的id
			if(confirm("确认删除【"+  deleteB_name +"】吗？") == false){
				return false;
			}
		});

		//click事件2:选择页面跳转
		$("#sub_page").click(function(){
			//取pageNo值
			var pageNo = $("#pn_input").val();

			/**
			*	跳转
			*	location相当于地址栏
			*	.href可以省略
			*/
			location = "BookListServlet?method=getBookListsInPage&pageNo=" + pageNo;
		});
			
	});
</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" width= "75px">
			<span class="wel_word">图书管理系统</span>
			<%@ include file="/WEB-INF/include/header.jsp" %>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>ISBN</td>
				<td>书名</td>
				<td>作者</td>
				<td>出版社</td>
				<td>出版时间</td>				
				<td>图片路径</td>
				<td colspan="2">操作</td>
			</tr>		
			
			<c:forEach items="${requestScope.bookListsInPage.list }" var="bookListsInPage">
				<tr>
					<td>${bookListsInPage.ISBN }</td>
					<td>${bookListsInPage.b_name }</td>
					<td>${bookListsInPage.author }</td>
					<td>${bookListsInPage.publisher }</td>
					<td>${bookListsInPage.b_date }</td>
					<td>${bookListsInPage.img_path }</td>
					<td>
						<a href="BookListServlet?method=getBookListByISBN&ISBN=${bookListsInPage.ISBN }">
						修改</a>
					</td>
					<td><a class="deleteConfirm" id = "${bookListsInPage.b_name }" href="BookListServlet?method=deleteBookListByISBN&ISBN=${bookListsInPage.ISBN }">
						删除</a>
					</td>
				</tr>	
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_update.jsp">添加书目</a></td>
			</tr>	
		</table>
		<div id="page_nav">
			<a href="BookListServlet?method=getBookListsInPage&pageNo=1">首页</a>
			<c:if test="${requestScope.bookListsInPage.pageNo>1 }">
					<a href="BookListServlet?method=getBookListsInPage&pageNo=${requestScope.bookListsInPage.pageNo-1 }">上一页</a>
			</c:if>
			<c:if test="${requestScope.bookListsInPage.pageNo < requestScope.bookListsInPage.totalPageNo }">
				<a href="BookListServlet?method=getBookListsInPage&pageNo=${requestScope.bookListsInPage.pageNo+1 }">下一页</a>
			</c:if>
			<a href="BookListServlet?method=getBookListsInPage&pageNo=${requestScope.bookListsInPage.totalPageNo }">末页</a>
			共${requestScope.bookListsInPage.pageNo }/${requestScope.bookListsInPage.totalPageNo }页，${requestScope.bookListsInPage.totalRecord }条记录
			&nbsp;&nbsp;&nbsp;
			到第<input value="${requestScope.bookListsInPage.pageNo }" name="pn" id="pn_input"/>页
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