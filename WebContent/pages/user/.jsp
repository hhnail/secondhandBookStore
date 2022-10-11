<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="NewFile.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0055)http://127.0.0.1:5500/java%E8%AF%BE%E8%AE%BE/login.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./Document_files/iconfont.css">
<style>
    *{
        margin: 0px;
        padding: 0px;
    }
    body{
        display: flex;
        height: 750px;
        background-image: url(image/e_bgi.png);
        background-size: 99% 100%;
        background-repeat: no-repeat;
        justify-content: center;
    }
    body::before{
        content: "";
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100%;
        height: 100%;
        /* z-index: 999999; */
        background-color: rgba(0,0,0,.05);
    }
    #login{
        padding:-50px;
        align-self: center;
        padding: 30px 50px 20px 50px;
        border-radius: 20px;
        background-color: rgba(0,0,0,.7);
        transform: scale(1.3) translate(80%,1px);
    }
    #login>ul{
        list-style: none;
    }
    #login li{
        margin-bottom: 20px;
        text-align: right;
        width: 230px;
        border-bottom: 1px solid #f6e7bc ;

    }
    #login li:last-child{
        margin-top: 25px;
        border: none;
    }
    #login li:nth-of-type(4)>input{
        width: 76px;
    }
    #login li:first-child{
        font-size: 24px;
        text-align: center;
        border: none;
        font-weight: 650;
        letter-spacing: 2px;
        text-shadow: 0 2px 1px #fff,0 -1px 0 #fff;
    }
    #login li>input{
        border: 0px;
        height: 24px;
        outline:none;
        background-color: transparent;
        color: #f6e7bc;
        border: 1px solid transparent;
    
        padding-left: 20px;
    }
    #login li>input:focus{
        transform: border 1s linear;
        border-radius: 5px;
        color: black;
        /* background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%); */
        /* background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%); */
        /* background-image: linear-gradient(20deg,14ffe9,#ffeb3b,#ff00e0); */
        /* background-image: linear-gradient(to top, #fddb92 0%, #d1fdff 100%); */
        /* background-image: linear-gradient(to right, #eea2a2 0%, #bbc1bf 19%, #57c6e1 42%, #b49fda 79%, #7ac5d8 100%); */
        /* background-image: linear-gradient(to top, #accbee 0%, #e7f0fd 100%); */
        background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
        animation: animate2 3s linear infinite;
    }
    @keyframes animate2{
        100%{
            filter: hue-rotate(360deg);
        }
    }
    #login ul li:last-child{
        position: relative;
        height: 20px;
        background-color: transparent;
    }
    #login ul li>i{
        vertical-align: bottom;
        font-size: 25px;
        color: #f6e7bc;
        position: relative;
        -webkit-background-clip: text;
        -webkit-text-fill-color:transparent;
        animation: animate 6s linear infinite;
    }
    #login ul li:nth-of-type(2)>i{
        background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-weight: 700;
    }
    #login ul li:nth-of-type(3)>i{
        background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
        font-weight: 100;
    }
    #login ul li:nth-of-type(4)>i{
        background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
    }
    #submit{
        width: 50%;
        height: 100%;
        border: none;
        color: white;
        border-radius: 10px ;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        z-index: 999;
        outline: none;
        cursor: pointer;
        background-image: linear-gradient(20deg,#14ffe9,#ffeb3b,#ff00e0);
        animation: animate 3s linear infinite;
    }
    #submit::before{
        content: "";
        width: 100%;
        height: 100%;
        position: absolute;
        left: 50%;
        transform: translate(-50%,-11%);
        border-radius: 10000px;
        background-image: linear-gradient(20deg,#14ffe9,#ffeb3b,#ff00e0);
        z-index: -1;
        filter: blur(10px);
    }
    @keyframes animate{
        100%{
            filter: hue-rotate(720deg);
        }
    }
    #submit+span{
        position: absolute;
        width: 100%;
        height: 100%;
        left: 50%;
        border-radius: 20px;
        transform: translateX(-50%);
        /* background-color: #ff00e0; */
        background-image: linear-gradient(135deg,#14ffe9,#ffeb3b,#ff00e0);
        animation: animate 2s linear infinite;
        filter: blur(10px);
    }
    canvas{
        background-color:whitesmoke;
        vertical-align: bottom;
    }
</style></head>

<body>
    <form id="login" action="http://127.0.0.1:5500/java%E8%AF%BE%E8%AE%BE/login.html#">
        <ul>
            <li>LOGIN</li>
            <li><i class="iconfont"></i> :<input type="text" placeholder="account" pattern="[0-9]{11}" required=""></li>
            <li><i class="iconfont"></i> :<input type="password" placeholder="password" required=""></li>
            <li><i class="iconfont"></i> :<input type="text" placeholder="check code" required="" pattern="0946"> <canvas id="check" width="80px" height="26px"></canvas></li>
            <li><button id="submit">LOGIN</button></li>
        </ul>
    </form>
<!-- Code injected by live-server -->
<script type="text/javascript">
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>
<script>
    let canvas=document.getElementById("check");
    let check={
        canva:document.getElementById("check").getContext("2d"),
        draw:function(){
            this.canva.clearRect(0,0,80,26);
            let code=new Array(1,2,3,4);
            let x=-10;
            let y,size;
            code.forEach((value,index,arr)=>{
                arr[index]=Math.floor(Math.random()*10);
                size=Math.floor(Math.random()*(20-10)+14);
                y=Math.floor(Math.random()*(20-10)+15);
                x+=size;
                this.canva.font= "italic 700 "+size+"px '宋体'";
                this.canva.fillStyle="rgb("+Math.floor(Math.random()*255)+","+Math.floor(Math.random()*255)+","+Math.floor(Math.random()*255)+")";
                this.canva.fillText(arr[index],x,y,size);
            });
            this.canva.beginPath();
            this.canva.moveTo((Math.floor(Math.random()*(20-10))+10),Math.floor(Math.random()*26));
            this.canva.lineTo((Math.floor(Math.random()*(20-10))+60),Math.floor(Math.random()*26));
            this.canva.stroke();
            this.canva.moveTo((Math.floor(Math.random()*(20-10))+10),Math.floor(Math.random()*26));
            this.canva.lineTo((Math.floor(Math.random()*(20-10))+60),Math.floor(Math.random()*26));
            this.canva.stroke();
            this.canva.closePath();
            document.getElementsByTagName("input")[2].pattern=code.reduce((pValue,cValue)=>{
                 return pValue+""+cValue;
            });
            // return code.reduce((pValue,cValue)=>{
            //     return pValue+""+cValue;
            // });
        },
        redraw:function(){
            let code;
            canvas.addEventListener('click',()=>{
                code=check.draw.bind(check)();
            },true);
        }
    }
    check.draw();
    check.redraw();
</script>
</body></html>