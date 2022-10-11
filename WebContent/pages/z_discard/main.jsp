<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/include/base.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<script src=" http://at.alicdn.com/t/font_2232371_uexjvk1z6t.js"></script>
<style>
    *{
        margin: 0px;
        padding: 0px;
    }
    body{
        background-color: rgba(9,7,35,1);
    }
    .icon {
     width: 1em; height: 1em;
     vertical-align: -0.15em;
     fill: currentColor;
     overflow: hidden;
   }
   ul{
       list-style: none;
   }
    #item{
        display: flex;
        width: 100%;
        justify-content: flex-end;
        
    }
    #search{
        display: block;
        min-width: 40%;
        height: 1.8em;
        border-radius: 2000px;
        overflow: hidden;
        border: 0.5px solid skyblue;
        box-shadow: 1px 1px 8px 1px skyblue;
        box-sizing: content-box;
        margin-right: 20px;
        background-color: white;
    }
    #search>input{
        width:84.5%;
        min-height: 100%;
        outline-style: none;
        border:0px;
        font: normal 500 16px "楷体";
        text-align: center;
    }
    #search>button{
        width: 15%;
        height: 100%;
        outline: none;
        border: none;
        outline-style: none;
        float: right;
        cursor: pointer;
        background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
    }
    #search>button:hover{
        background-image: linear-gradient(to right, #f83600 0%, #f9d423 100%);
    }
    #header{
        width: 100%;
        background-color: rgba(9,7,35,1);
    }
    #nav_item{
        list-style: none;
        width: 100%;
        display: grid;
        grid-template-columns:1.8fr repeat(5,1fr) 3fr 1fr 1fr ;
    }
    #nav_item a{
        text-align: center;
        display: block;
        text-decoration: none;
        font: normal 600 18px/3.8em '宋体';
        color: rgb(134, 131, 145);
    }
    #nav_item>li a:hover{
        background-color: rgba(242, 242, 242,.2);
    }
    #nav_item a:hover{
        color: rgb(242, 242, 242);
    }

    #nav_item li:nth-of-type(7){
        display: flex;
        justify-content: flex-end;     
    }
    #nav_item li:nth-of-type(7) #item{
        align-self: center;
    }
    #nav_item li:last-of-type svg{
        margin-bottom: -5px;
    }
    #main_search{
        display: flex;
        justify-content: center;
        width: 100%;
        height: 180px;
    }
    #main_search form{
        align-self: center;
        width: 60%;
    }
    #main_search input{
        box-shadow: 1px 3px 15px 1px skyblue;
    }
    #type_search{
        width: 100%;
        height: 60px;
        border-radius: 2000px;
        outline-style: none;
        font-size: 36px;
        text-align: center;
        border: 2px solid transparent;
    }
    #type_search:focus{
        border: 2px solid rgba(12,232,254,.8);
    }
    /*  */
    #nav_item li:nth-of-type(6) {
        position: relative;
    }
    #nav_item li:nth-of-type(6)>ul{
        list-style: none;
        position: absolute;
        left: -24%;
        width: 150%;
        /* background-color: rgba(9,7,35,1) ; */
        /* background-color: #f9d423; */
        /* background-color: rgba(12,232,254,.5); */
        background-image: linear-gradient(to right, #93ccfd 0%, #00f2fe 100%);
        height: 0px;
        transition: height 0.5s linear;
        overflow: hidden;
        /* display: none; */
    }
    #nav_item li:nth-of-type(6)>ul a{
        font: 500 16px/3em '宋体';
    }
    #nav_item li:nth-of-type(6):hover ul{
        /* display: block; */
        z-index: 10;
        height: 200px;
    }

    #choice{
        margin-left: 35px;
        position: relative;
        height: 0px;
        overflow: hidden;
        box-sizing: border-box;
        transition: all .8s cubic-bezier(.88,-0.04,.76,1.09);
    }
    #choice>li{    
        border: 2px solid transparent;
        border-radius: 4px 4px 0 0;
        position: absolute;
        z-index: 1;
        background-color: white;
        /* animation: animate 3s linear infinite; */
    }
    @keyframes animate{
    100%{
        filter: hue-rotate(360deg);
    }
}
    #choice>li:nth-of-type(1){
        border: 2px solid rgba(12,232,254,.8);
        border-bottom: 2px solid transparent;
        background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
        /* background-color: rgba(12,232,254,.8); */
    }
    #choice>li>label{
        float: left;
        display: block;
        cursor: pointer;
        /* background-color: aliceblue; */
        border-radius: 2px 2px 0 0;
        padding: 5px 10px;
        margin-right: .1px;
    }
    #choice>li:nth-of-type(2){
        left: 67px;
    }
    #choice>li:nth-of-type(3){
        left: 139px;
    }
    #choice>li:nth-of-type(4){
        left: 44%;
        background-color: transparent;
        cursor: pointer;
        top: -5px;
        /* z-index: -100; */
    }
    #choice>li>input{
        display: none;
    }
    #choice::after{
        content: "";
        display: block;
        clear: both;
    }
  
</style>
<body>
    <header id="header">
        <ul id="nav_item">
            <li></li>
            <li><a href="#">首页</a></li>
            <li><a href="pages/user/putaway.jsp">书籍上架</a></li>
            <li><a href="#">需求发布</a></li>
            <li><a href="#">聊天室</a></li>
            <li><a href="#">帮助</a>
                <ul>
                    <li><a href="#">商品管理</a></li>
                    <li><a href="#">订单管理</a></li>
                    <li><a href="#">需求管理</a></li>
                    <li><a href="#">个人信息</a></li>
                </ul>
            </li>
            <li>
                <section id="item">
                <form action="" id="search">
                    <input id="searchContent"  type="search" placeholder="按书名查询" required autocomplete="off"><button><svg style="width: 34px;height: 30px;" class="icon" aria-hidden="true"><use xlink:href="#icon-Z"></use></svg></button>
                </form>
                </section>
            </li>
            <li><a href="./pages/user/loginx.jsp">登入/注册</a></li>
            <li><a href="#"><svg style="width: 34px;height: 34px;" class="icon" aria-hidden="true"><use xlink:href="#icon-gouwuche2"></use></svg></a></li>
        </ul>
    </header>
    <section id="main_search">
        <form action="BookListServlet?method=detailSearch" method="post">
            <ul id="choice">
                <li><label for="b_name">书名</label><input id="b_name" type="radio" name="stype" value="b_name" checked></li>
                <li><label for="isbn">ISBN</label><input id="isbn" type="radio" name="stype" value="ISBN" ></li>
                <li><label for="author">作者</label><input id="author" type="radio" name="stype" value="author"></li>
                <li id="close"><svg style="width: 34px;height: 34px;" class="icon" aria-hidden="true"><use xlink:href="#icon-zhedie1"></use></svg></li>
            </ul>
            <input id="type_search" placeholder="按书籍类型查询" type="search" name="main_search" style="font-family: '宋体';">
        </form>
    </section>
</body>

<script>
let search=document.getElementById("searchContent");
search.addEventListener("focus",()=>{
    let father_style=document.getElementById("search");
    father_style.style.minWidth="85%";
    father_style.style.transition="min-width 1.2s";
},true);
search.addEventListener("blur",()=>{
    let father_style=document.getElementById("search");
    father_style.style.minWidth="35%";
    father_style.style.transition="min-width 1.2s";
},true);
// 控制选择样式
$(()=>{
    $("#choice>li").click(function(){
        $("#choice>li").css({
            "border":"2px solid transparent",
            "border-bottom":"2px solid rgba(12,232,254,.8)",
            "background-image": "none"
            });
        $(this).css({
            "border":"2px solid rgba(12,232,254,.8)",
            "border-bottom":"2px solid white",
            "background-image": "linear-gradient(to right, #4facfe 0%, #00f2fe 100%)"
        })
        $("#type_search").css("border","2px solid rgba(12,232,254,.8)");
        $("#choice").css("height","32px");
    });

    $("#type_search").focus(function(){
        $("#choice").css("height","32px");
    });
    $("#type_search").blur(function(){
        $("#choice").css("height","0px");
    });
    $("#close").unbind();
    $("#close").click(function(){
        $("#choice").css("height","0px");
    });

})
</script>

</html>
