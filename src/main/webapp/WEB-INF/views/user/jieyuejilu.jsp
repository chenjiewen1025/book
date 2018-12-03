<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
<link href="/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/js/jquery.js"></script>
    <link href="/static/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/static/js/jquery.js"></script>
    <script type="text/javascript" src="/static/js/jsCalender/WdatePicker.js"></script>
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
    <li><a href="#">图书借阅</a></li>
    <li><a href="#">借阅记录</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    <form action="/myOrder/showRecord.do" method="post">
    <ul class="prosearch">
	   <li>
	   	
	   	<i>书名</i><a><input name="selectBookName" value="${selectBookName}" type="text" class="scinput" /></a>
	   	
   	   <a><input name="button" type="submit" class="sure" value="查询" style="background:#417EB5;margin-left: 25px;"/></a>
	   </li>
	   </ul>
    </form>
    <table class="tablelist">
    	<thead>
    	<tr>
        
        <th>序号<i class="sort"><img src="/static/images/px.gif" /></i></th>
        <th>姓名</th>
        <th>学号</th>
        <th>书名</th>
        <th>书号</th>
        <th>借出时间</th>
        <th>归还时间</th>
        <th>状态</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${records}" var="record" varStatus="i" >
        <tr>
        <td>${i.index+1}</td>
        <td>${record.name}</td>
        <td>${record.user_id}</td>
        <td>${record.book_name}</td>
        <td>${record.book_id}</td>
        <td>${record.time_out}</td>
        <td>${record.time_in}</td>
            <td><c:if test="${record.order_state==0}">可续借，未还</c:if>
                <c:if test="${record.order_state==1}">以续借，未还</c:if>
                <c:if test="${record.order_state==2}">以还，订单结束</c:if>
            </td>
        </tr>

        </c:forEach>
        </tbody>
    </table>


        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li <c:if test="${current==1}">class="disabled" </c:if>>
                    <a <c:if test="${current!=1}">
                        href="/myOrder/showRecord.do?page=${current-1}&selectBookName=${selectBookName}"</c:if>
                            aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach var="i" step="1" begin="1" end="${pages}">
                    <li  <c:if test="${i==current}"> class="active" </c:if> ><a <c:if test="${i!=current}">
                        href="/myOrder/showRecord.do?page=${i}&selectBookName=${selectBookName}" </c:if>
                    >${i} </a></li>
                </c:forEach>

                <li <c:if test="${current==pages}">class="disabled" </c:if>>
                    <a <c:if test="${current!=pages}">
                        href="/myOrder/showRecord.do?page=${current+1}&selectBookName=${selectBookName}" </c:if>
                            aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
 
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
