<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<c:if test="${sessionScope.client.c_id == 'admin' }">
		<a href="BookListServlet?method=getBookListsInPage">书目管理</a> 
	</c:if>
	<a href="BookClientServlet?method=getBooksForClientInPage">图书管理</a>
	<a href="index.jsp">返回商城</a>
</div>