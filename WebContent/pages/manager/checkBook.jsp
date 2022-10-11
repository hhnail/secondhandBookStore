<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%@ include file="/WEB-INF/include/base.jsp"%>
<%-- <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"> --%>
<%@ include file="/WEB-INF/include/welcome.jsp" %>
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
        grid-template-columns:repeat(9,1fr);
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
</style>
<body >
    <div style="margin-top:50px;"></div>
    <ul id="shouNeedState">
        <li>
            <span>图片</span>
            <span>书名</span>
            <span>ISBN</span>
            <span>价格</span>
            <span>客户</span>
            <span>信誉</span>
            <span>描述</span>
            <span>状态</span>
        </li>
         <c:forEach items="${requestScope.checkItem}" var="needlist">
         <li>
            <img src="${needlist.bookList.img_path} " alt="">
            <span>${needlist.bookList.b_name}</span>
            <span>${needlist.bookList.ISBN}</span>
            <span>${needlist.price}</span>
            <span>${needlist.client.c_name}</span>
            <span>${needlist.client.credit}</span>
            <span>${needlist.des}</span>
            <span>${needlist.state}</span>
            <span>
                  <a href="BookClientServlet?method=changeBookState&confirm=yes&p_id=${needlist.p_id }">通过</a>
                  <a href="BookClientServlet?method=changeBookState&confirm=no&p_id=${needlist.p_id }">否决</a>
            </span>
           
        </li>
        </c:forEach>
    </ul>
</body>
</html>