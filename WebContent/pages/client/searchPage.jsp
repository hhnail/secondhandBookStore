<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索结果页面</title>
</head>
<script src=" http://at.alicdn.com/t/font_2232371_uexjvk1z6t.js"></script>
<%@ include file="/WEB-INF/include/base.jsp"%>
<%@ include file="/WEB-INF/include/welcome.jsp" %>
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
<section>
<c:forEach items="${requestScope.searchBookList }" var="b_list">
            <section class="booklist">
                <a href="BookListServlet?method=showDetail&ISBN=${b_list.ISBN }">
                    <img class="img" src="${b_list.img_path}" alt="加载失误">
                </a>
                <ul class="des">
                    <li><span>ISBN :</span><span>${b_list.ISBN }</span></li>
                    <li><span>书名 :</span><span>${b_list.b_name}</span></li>
                    <li><span>出版社 :</span><span>${b_list.publisher}</span></li>
                    <li><span>作者 :</span><span>${b_list.author}</span></li>
                    <li></li>
                </ul>
            </section>
	</c:forEach>
</section>
</body>
</html>