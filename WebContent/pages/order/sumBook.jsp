<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单结算页面</title>
</head>
<%@ include file="/WEB-INF/include/base.jsp"%>
<%-- <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"> --%>
<%@ include file="/WEB-INF/include/welcome.jsp" %>

<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background-color: rgba(241, 241, 189, 1);
    }
    ul{
        list-style: none;
    }
    h1{
        margin-top: 10px;
        text-align: center;
    }
    #goodsItem{
        /* background-color: aqua; */
        width: 70%;
        margin: 0 auto;
        margin-top: 100px;
        padding: 10px;
        border-radius: 10px;
        background-color: white;
    }
    #goods{
        display: grid;
        grid-template-rows: auto;
        margin-top: 10px;
    }
    #goods>li{
        margin-top: 10px;
        display: grid;
        grid-template-columns:1fr repeat(2,1fr) 2fr 1fr;
        /* background-color: antiquewhite; */
        align-items: center;
        justify-items: center;
        border-radius: 10px;
    }
    #goods>li>img{
        width: 70px;
        height: 80px;
    }
    #poster{
        margin-top: 30px;
        font-size: 20px;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        /* justify-items: center; */
    }
    #poster li{
        display: grid;
        grid-template-rows: repeat(2fr);
        justify-items: center;
    }
    #poster div{
        text-align: center;
    }
    #poster input{
        width: 60%;
        height: 30px;
        font-size: 20px;
        padding-left: 40px;
    }
    #post_item{
        text-decoration: none;
        display: block;
        text-align: center;
        width: 30%;
        height: 60px;
        font: 700 24px/60px '黑体';
        border-radius: 10px;
        margin: 0 auto ;
        margin-top: 20px;
        margin-bottom: 30px;
        background-color: rgba(241, 241, 189, 1);
    }
</style>
<body style="overflow:auto">
    <section id="goodsItem">
    <h1>确认订单</h1>
    <form id="postOrder" action="OrderServlet?method=createOrderOnDetail" method="post">
        <ul id="goods">
         <c:forEach items="${requestScope.buy_goods}" var="needlist">
            <li>
                <input type="checkbox" checked="checked" style="display: none;" name="choiceBook" value="${needlist.p_id} ">
                <img src="${ needlist.bookList.img_path }" alt="">
                <span>${needlist.bookList.b_name}</span>
                <span>${needlist.bookList.ISBN}</span>
                <span>${needlist.des}</span>
                <span>${needlist.price}</span>
            </li>
            </c:forEach>
        </ul>
            <ul id="poster">
                <li>
                    <div>收货人：</div>
                    <input type="text" name="poster" value="${sessionScope.client.c_name}"> 
                </li>
                 <li>
                    <div>电话：</div>
                    <input type="text" name="phone" value="${sessionScope.client.c_id}"> 
                </li>
                <li>
                    <div>收货地址：</div>
                    <input type="text" name="post_address" value="${sessionScope.client.address}"> 
                </li>
            </ul>
            <a href="" id="post_item" onclick="subOrder()">确 认</a>
        </form>
    </section>
    <script type="text/javascript">
    function subOrder(){
        $("#postOrder").submit();
        	alert("");
        }
    </script>
</body>
</html>