<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body,html{
        display: grid;
        height: 100%;
        place-items: center;
        background-color: black;
    }
    #color_trans{
        height: 100px;
        width: 360px;
        background-image: linear-gradient(135deg,#14ffe9,#ffeb3b,#ff00e0);
        border-radius: 10px;
        position: relative;
        cursor: default;
        animation: animate 3s linear infinite;
    }
    #color_trans .display,
    #color_trans>span{
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        position: absolute;
    }
    #color_trans>span{
        height: 100%;
        width: 100%;
        background: inherit;
        border-radius: 10px;
    }
    #color_trans>span:first-child{
        filter: blur(100px);
    }
    #color_trans>span:last-child{
        filter: blur(20px);
    }
    #color_trans .display{
        background-color: #1b1b1b;
        height: 85%;
        width: 94%;
        border-radius: 6px;
        z-index: 999;
    }
    #color_trans #time{
        text-align: center;
        line-height: 85px;
        font-size: 50px;
        font-weight: 600;
        letter-spacing: 1px;
        background-image: linear-gradient(0deg,#14ffe9,#ffeb3b,#ff00e0);
        color:transparent;
        -webkit-background-clip: text;
        /* -webkit-text-fill-color: transparent; */
        animation: animate 3s linear infinite;
    }
    @keyframes animate{
        100%{
            filter: hue-rotate(360deg);
        }
    }
</style>
<body>
    <section id="color_trans">
        <div class="display">
            <div id="time"> </div>
        </div>
        <span></span> 
        <span></span>
    </section>
</body>
<script>
    let time=document.getElementById("time");
    let date=new Date();    
    let interval=setInterval(()=>{
        let date=new Date();
        let h=date.getHours();
        let m=date.getMinutes();
        let s=date.getSeconds();
        if(m<10){
            m="0"+m;
        }
        if(s<10){
            s="0"+s;
        }
        if(h>=12){
            h="0"+h-12;
            time.innerHTML=`${h}:${m}:${s} PM`;
        }else{
            time.innerHTML=`${h}:${m}:${s} AM`;
        }
        if(m==30){
            clearInterval(interval);
            time.innerHTML="到点了";
        }
    },1000);
</script>
</html>