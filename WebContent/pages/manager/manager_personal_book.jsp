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
    #shouNeedState>li:nth-of-type(1){
        background-color: aliceblue;
        display: grid;
        margin-bottom: 5px;
        grid-template-columns:repeat(8,1fr);
        align-items: center;
        justify-items: center;
        border-radius:5px;
        }
    #shouNeedState form{
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
    #shouNeedState>li img{
        width: 100px;
        height: 120px;
    }
    #shouNeedState>li span>a{
        display:block;
        height:40px;
        line-height:40px;
        padding:0 20px;
        text-decoration:none;
        background-color:rgba(241,241,189,1);
        border-radius:5px;
    }
    #shouNeedState>li span input{
       text-align:center;
    }
    #shouNeedState>li span>a:hover{
         background-color:rgba(30,210,254,1); 
      }
     #shouNeedState>li span>a:nth-of-type(1){
        margin-bottom:10px;
     }
     #m_delete{
     float:right;
     text-align:right;
     font-size: 24px;
     line-height:50px;
     background-color:rgb(32,214,254);
     text-decoration:none;
     border-radius:10px;
     }
     #clear::after{
        content:"";
        display:block;
        clear:both;
     }
</style>
<body style="overflow:auto">
    <div style="margin-top:50px;"></div>
    
    <c:if test="${sessionScope.client.c_id == 'admin' }">
    <div id="clear">
			 <a  id="m_delete" href="BookListServlet?method=getBookListsInPage"> 书目管理 </a>
   </div>
    </c:if>
<%--     <c:if test="${sessionScope.client.c_id == 'admin' } "> --%>
<!--         <a href="BookListServlet?method=getBookListsInPage"> 书目管理 </a> -->
<%--     </c:if> --%>
    <ul id="shouNeedState">
        <li>
            <span>图片</span>
            <span>书名</span>
            <span>ISBN</span>
            <span>价格</span>
            <span>新旧</span>
            <span>描述</span>
            <span>状态</span>
        </li>
         <c:forEach items="${requestScope.manager}" var="needlist">
              <li>
                  <form id="${needlist.p_id}" action="BookClientServlet?method=changeState" method="POST">
                       <input type="hidden" value="${needlist.p_id}" name="p_id" >
                       <img src="${needlist.bookList.img_path} " alt="">
                       <span>${needlist.bookList.b_name}</span>
                       <span>${needlist.bookList.ISBN}</span>
                       <span><input type="text" value="${needlist.price}" name="p_price"></span>
                       <span><input type="text" value="${needlist.degree}" name="p_degree"></span>
                       <span><input type="text" value="${needlist.des}" name="p_des"></span>
                       <span>${needlist.state}</span>
                       <span>
                             <a href="BookClientServlet?method=deleteStorePersonal&p_id=${needlist.p_id }">下架</a>
                             <a  class="${needlist.p_id}" onclick="sub()">更改</a>
                       </span> 
                   </form>
               </li>
                   </c:forEach>
       </ul>
    <script>
    function sub(){
    	$("#"+$(event.target).attr('class')).submit();
//     	$("form").submit()
    }
    </script>
    
</body>
</html>