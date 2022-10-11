<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑图书</title>
<%@ include file="/WEB-INF/include/base.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
	
	input {
		text-align: center;
	}
</style>
</head>
<body>
		<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" width= "75px">
			<span class="wel_word">编辑图书</span>
			<%@ include file="/WEB-INF/include/header.jsp" %>
		</div>
		
		<div id="main">
			<form action="BookListServlet?method=updateBookList" method="post">
			<input type="hidden" name="oldISBN" value="${bookList.ISBN }"> 
<%-- 			
①	
<input type="hidden" name="bookList" value="${bookList.ISBN }"> 
为什么写这一步？？？
感觉没有任何影响，而且运行起来也确实没有错误？
【hw】因为他本来没有ISBN，所以需要加上。而我们课设项目已经拿过了，就不用再加上这一步了

【hw】后来发现还是要加，因为需要根据更新前的ISBN编号更新书目
而下面的书目是更新后的书目ISBN


②
为什么要学el？
因为el有一个特性，如果值是null，他就什么都不显示
（而不是直接打印null，那如果要好看，还得逻辑判断打印）
--%>
				<table>
					<tr>
						<td>ISBN</td>
						<td>书名</td>
						<td>作者</td>
						<td>出版社</td>
						<td>出版时间</td>				
<!-- 						<td>图片路径</td> -->
						<td colspan="2">操作</td>
					</tr>		
					<tr>
						<td><input name="ISBN" type="text" value="${bookList.ISBN }"/></td>
						<td><input name="b_name" type="text" value="${bookList.b_name }"/></td>
						<td><input name="author" type="text" value="${bookList.author }"/></td>
						<td><input name="publisher" type="text" value="${bookList.publisher }"/></td>
						<td><input name="b_date" type="text" value="${bookList.b_date }"/></td>
						<td><input type="submit" value="提交"/></td>
					</tr>		
				</table>
			</form>
			
		</div>
		<div id="bottom">
			<span>
				Jmu二手书交易系统.Copyright &copy;2020
			</span>
		</div>
</body>
</html>