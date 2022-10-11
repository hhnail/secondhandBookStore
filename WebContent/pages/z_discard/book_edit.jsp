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
			<form action="BookListServlet?method=addBookList" method="post">
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
						<td><input name="ISBN" type="text" value="978-1-1"/></td>
						<td><input name="b_name" type="text" value="testadd"/></td>
						<td><input name="author" type="text" value="testadd"/></td>
						<td><input name="publisher" type="text" value="testadd"/></td>
						<td><input name="b_date" type="text" value="2020-12-08"/></td>
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