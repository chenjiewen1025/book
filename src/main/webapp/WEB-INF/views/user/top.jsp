
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/static/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


</head>

<body style="background:url(/static/images/topbg.png) repeat-x;">

    <div class="topleft" style="width:60%;">
    
    <div style="float: left;width: 60px;height: 60px;margin-top:15px;margin-left: 20px;">
    	<img src="/static/images/login/jinghui.png" style="width:60px;height:60px;"/>
    </div>
   	<div style="height:88px;line-height:88px;float:left;color:#251E5F;font-size:30px;font-weight: 600;margin-left: 20px;">
   		 图书借阅管理系统
   	</div>
   	
    
    </div>
            
    <div class="topright">    
    <ul>
    <li><a href="#">关于</a></li>
    <li><a href="login.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${sessionScope.user.name}</span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>

</body>
</html>
