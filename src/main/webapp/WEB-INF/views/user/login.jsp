<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="/static/css/login.css">
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <style>
       #code {
           width: 120px;
        }
        #acode{
            width:100px;
            height: 35px;
            margin-left: 140px;
        }
    </style>
</head>
<body>
<div class="login">
    <div class="login_title">
        <p><img src="/static/images/login/jinghui.png" style="width:80px;height:80px;margin-right:30px;"/>图书借阅管理系统</p>
    </div>
    <div class="login_main">
        <div class="main_left"></div>
        <div class="main_right">
            <div class="right_title">用户登录</div>
            <form action="/user/login.do" method="post" onsubmit="return check()">
                <div class="username">
                    <img src="/static/images/login/username.png" alt="">
                    <input type="text" placeholder="请输入学号" name="id" id="id" >
                </div>
                <div class="password">
                    <img src="/static/images/login/password.png" alt="">
                    <input type="password" placeholder="请输入密码" name="password" id="password" >
                </div>

                	<div class="username">
                        <img src="/static/images/login/username.png" alt="">
                		<input id="code" type="text" placeholder="验证码" width="100px" name="code">
                        <img src="/user/vcode.do" id="acode" onclick="change()">
                	</div>
                <input type="submit" style=" background-color: #0064c8;
                display:block;margin:0 auto; width: 250px;   height: 35px"; >
                ${mess}
            </form>
        </div>
    </div>
    <div class="login_footer">
        <p class="name">版权所有：XXX图书馆</p>
		<p>建议浏览器：IE8以上、360、谷歌、Firefox v22</p>
        <p>技术支持：XXXXX科技有限公司 &nbsp;&nbsp;联系电话：022-000000</p>
        
    </div>
</div>

</body>
<script>
    function change() {
        var acode=document.getElementById("acode");
        acode.src="/user/vcode.do?i="+Math.random();
    }
    function check() {
        var code=$(" #code ").val();
        var id = $(" #id ").val();
        var password = $(" #password ").val();
        var re =  /^[0-9]+$/;
        if (code==null||code=="")
        {
            alert("验证码不能为空");
            return false;
        }
        else if (id==null||id=="")
        {

            alert("学号不能为空");
            return false;
        }
        else if (password==null||password=="")
        {
            alert("密码不能为空");
            return false;
        }
        if (!re.test(id)) {
            alert("学号为数字！");
            return false;
        }
        else
            return true;
    }

</script>
</html>