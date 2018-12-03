<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="home.html">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="/static/images/zs_ico.jpg" alt="天气" /></span>
    <b>${sessionScope.user.name}您好，欢迎登录图书借阅管理系统</b>
    <a href="#">修改密码</a>
    </div>
    
    
    
    <div class="xline"></div>
    
    <div class="box"></div>

   
    
  

   <div class="box"></div>
   <div class="welinfo">
    <span><img src="/static/images/time.png" alt="时间" /></span>
    <b>我的权限</b>
    </div>
   
   
    <table class="tablelist" style="width: 50%;">
		<tr style="background: #DBEDFC;"><td>可借阅图书</td><td>单次可借阅时长</td></tr>
   
    	<tr>
    		<td>总数：<b style="font-size:20px;color: red;">5本</b></td>
    		<td>剩余：<b style="font-size:20px;color: red;">3本</b></td>
    	</tr>
    	<tr>
    		
    		<td>时长：<b style="font-size:20px;color: red;">30天</b></td>
    		<td>每次续借时长：<b style="font-size:20px;color: red;">30天</b></td>
    	</tr>
    </table>
  
    
    </div>
    
    

</body>

</html>
