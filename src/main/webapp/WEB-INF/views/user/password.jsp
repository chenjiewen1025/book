<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script type="text/javascript" src="/static/js/jsCalender/WdatePicker.js"></script>
<script type="text/javascript">

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="home.html">首页</a></li>
    <li><a href="#">个人信息</a></li>
    <li><a href="#">密码修改</a></li>
    
    </ul>
    </div>
    
    <div class="rightinfo">
    
    		 <ul class="prosearch">
       <li>
        
        <i>原密码</i><a><input id="password" type="password" class="scinput" /></a>
        
       </li>
       <li>
        
        <i>新密码</i><a><input id="newPassword" type="password" class="scinput" /></a>
        
      
       </li>
       <li>
        
        <i>确认密码</i><a><input id="surePassword" type="password" class="scinput" /></a>
        
       <a><input id="button" type="button" onclick="sure()" class="sure" value="确认" style="background:#417EB5;margin-left: 25px;"/></a>
       </li>
       </ul>
 
    
    </div>
    
  <script type="text/javascript">
	function sure() {
        var pwd = document.getElementById("password").value;
        var npwd = document.getElementById("newPassword").value;
        var snpwd = document.getElementById("surePassword").value;
        if (pwd == null || pwd == "" || npwd == null || npwd == "" || snpwd == null || snpwd == "") {
            alert("不能为空~~");

        }
        else {

            if (npwd==snpwd)
            {
                $.ajax(
                    {
                        type: "POST", //提交方式
                        url: "/user/password.do",//路径
                        data: {
                            "password": pwd,
                            "sPassword": snpwd
                        },
                        success: function (result) {//返回数据根据结果进行相应的处理
                            if (result == true) {
                                alert("成功！");
                            }
                            else {
                                alert("密码错误！");
                            }
                        }
                    }
                );}
            else {
                alert("密码不对应！")

            }


        }


    }

	</script>


</body>

</html>
