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
        grid-template-columns:repeat(8,1fr);
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
<body style="overflow: auto">
    <div style="margin-top:50px;"></div>
    <ul id="shouNeedState">
        <li>
            <span>图片</span>
            <span>书名</span>
            <span>ISBN</span>
            <span>截止日期</span>
            <span>数量</span>
            <span>描述</span>
            <span>状态</span>
        </li>
         <c:forEach items="${requestScope.allNeeds}" var="needlist">
         <li>
            <img src="${needlist.bookList.img_path} " alt="">
            <span>${needlist.bookList.b_name}</span>
            <span>${needlist.bookList.ISBN}</span>
            <span>${needlist.deadline}</span>
            <span>${needlist.amount}</span>
            <span>${needlist.description}</span>
            <span>${needlist.state}</span>
            <span>
                  <a href="NeedServlet?method=changeState&confirm=yes&n_id=${needlist.n_id }">通过</a>
                  <a href="NeedServlet?method=changeState&confirm=no&n_id=${needlist.n_id }">否决</a>
            </span>
           
        </li>
        </c:forEach>
    </ul>
</body>
</html>