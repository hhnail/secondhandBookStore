<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布需求</title>
    <%@ include file="/WEB-INF/include/base.jsp" %>
</head>
<style>
    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        overflow-y: scroll;
        background-color:rgba(9,7,35,1);
    }

    #putaway {
        margin: 0 auto;
        align-items: center;
        width: 85%;
        background-color: antiquewhite;
        box-shadow: 0 0 10px 1.5px gray;
        padding: 10px;
        border-radius: 10px;
        padding-top: 15px;
    }

    label {
        display: block;
        font-size: 24px;
    }

    fieldset {
        border: 0;
        padding: 0.01px 0 0 0;
        margin: 0;
        min-width: 0;
        display: table-cell;
    }

    legend {
        padding: 0 0 .5em 0;
        font-weight: bold;
        color: #777;
        font-size: 28px;
    }

    label+input {
        font-size: 18px;
        height: 30px;
        width: 60%;
    }

     #required,
    #alternative {
        background-color: aliceblue;
        padding: 10px;
        border-radius: 10px;
        position: relative;
    }
    #required{
        margin-bottom: 15px;
    }
    #alternative {
        height: 0px;
        transition: all 2s ease;
        overflow: hidden;
        padding: 0 10px;
    }
    #button {
        margin-top: 15px;
        text-align: center;
    }

    #button button,
    #button input[type="reset"] {
        cursor: pointer;
        border: 0;
        font: inherit;
        padding: .5em 1em;
        color: #fff;
        border-radius: .25em;
        background-image: linear-gradient(to bottom, #1a4a8e, #173b6d);
        box-shadow: 1px .25em 0 rgba(23, 59, 109, 0.3), inset 0 1px 0 rgba(0, 0, 0, 0.3);
        width: 150px;
        height: 50px;
    }
    #showbook,
    #uploadingImg{
        position: absolute;
        top: 20%;
        right: 8%;
        width: 25%;
        height: 70%;
    }
    #showbook{
        visibility: hidden;
    }
</style>

<body>
	<%@ include file="/WEB-INF/include/welcome.jsp"%>
	<div></div>
    <form id="putaway" action="NeedServlet?method=upNeed" enctype="multipart/form-data" method="post">
        <section id="required">
            <fieldset>
                <legend>
                    请填写您对书本的详细需求
                </legend>
            </fieldset>
            <p>
                <label> ISBN： </label> <input type="text" id="isbn" name="ISBN" placeholder="ISBN" required>
            </p>
            <p>
                <label> 可接受的书本最高价格：</label> <input type="text" name="max_price" placeholder="可接受的最高价格" required>
            </p>
            <p>
                <label> 可接受的商家最低信用： </label><input type="text" name="min_credit" placeholder="可接受的商家最低信用" required>
            </p>
            <p>
                <label> 需求详细描述： </label> <input type="text" name="des" placeholder="不超过100个字的描述" required>
            </p> 
            <p>
                <label> 所需数量： </label> <input type="text" name="count" placeholder="需要的书本数量" required>
            </p>
             <p>
                <label> 截止日期： </label> <input type="text" name="deadline" placeholder="截止日期" required>
            </p>
            <img  id="showbook" src="" alt="圖片暫時沒找到">
        </section>
        <section id="alternative">
            <fieldset>
                <legend>
                    对应ISBN的书籍信息未在系统中找到，请填写完整的书籍信息
                </legend>
            </fieldset>
            <p>
                <label> 书名：</label> <input type="text" name="b_name" placeholder="书名" >
            </p>
            <p>
                <label> 作者：</label> <input type="text" name="author" placeholder="作者" >
            </p>
            <p>
                <label> 出版社：</label> <input type="text" name="publisher" placeholder="出版社" >
            </p>
            <p>
                <label> 出版时间：</label> <input type="text" name="b_date" placeholder="年-月-日" >
            </p>
             <p>
                <label> 上传图片:</label> <input type="file" id="uploading" name="img" >
            </p>
            <img id="uploadingImg" src="" alt="">
        </section>
    
        <div id="button"><button>提交</button> &nbsp; &nbsp; <input type="reset" value="重置"></div>
    </form>
   
</body>
<script>
    $(() => {
        $("#isbn").on("blur", () => {
            $.ajax({
                url: "BookListServlet",
                type: "post",
                dataType: "text",
                async: true,
                data:"method=ajaxPutawayISBN&isbn="+$("input").val(),
                success: function (value) {
                    if(value!="false"){
                    	 let img=$("#showbook");
                         img.attr("src",value);
                       	 img.css("visibility","visible"); 
                       	 $("#alternative").css("height","0px");
                       	 console.log(value);
                    }else{
                         $("#alternative").css("height","450px");
                         $("#showbook").css("visibility","hidden"); 
//                          $("input[type=text]").attr("required","required") 
                    }
                },
                error: function () {
                	console.log("ajax失敗");
                }});
        });
    });
    let changeImg=function(){
        let file=document.getElementById("uploading");
        let url=window.URL.createObjectURL(file.files[0]);
        let img=document.getElementById("uploadingImg");
        img.src=url;
    }
    document.getElementById("uploading").addEventListener("change",changeImg);
</script>

</html>