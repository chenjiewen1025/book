<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="home.html">首页</a></li>
    <li><a href="#">个人信息</a></li>
    <li><a href="#">信息修改</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        
        <th>名称<i class="sort"><img src="/static/images/px.gif" /></i></th>
        
        <th>内容</th>
        
        </tr>
        </thead>
        <tbody>

       
        <tr>
        <td>读者id</td>
        <td>${sessionScope.user.user_id}</td>
        
        
        </tr>
        
        <tr>
       <td>读者姓名</td>
        <td>${sessionScope.user.name}</td>
        </tr>

        <tr>
       <td>读者权限</td>
            <td>
                <c:if test="${sessionScope.user.type_id==1}">学生</c:if>
                <c:if test="${sessionScope.user.type_id==0}">教师</c:if>
            </td>
        </tr>
        <tr>
            <td>用户邮箱</td>
            <td>${sessionScope.user.email}</td>
        </tr>

        
        
        </tbody>
    </table>
    
   </div>
 

    
    

</body>

</html>
