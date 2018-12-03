<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统</title>
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
    <li><a href="#">借阅</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
  <form action="/book/list.do" method="post">
    <ul class="prosearch" >
	   <li>
	   	<i>书名：</i><a><input name="selectBookName" id="selectBookName" type="text" value="${selectBookName}" class="scinput" /></a>

	   </li>
        <li>
            <i>作者：</i><a><input name="selectActorName" id="selectActorName" type="text" value="${selectActorName}" class="scinput" /></a>
            <a><input name="button" type="submit" class="sure"  value="查询" style="background:#417EB5;margin-left: 25px;"/></a>

        </li>
	   </ul>
        </form>
	   
    <table class="tablelist">
    	<thead>
    		
    	<tr>
        
        <th>序号<i class="sort"><img src="/static/images/px.gif" /></i></th>
        <th>图书号</th>
        <th>书名</th>
        <th>数量/可借</th>
        <th>作者</th>
        <th>内容</th>
        <th>位置</th>
        <th>操作</th>
        
        </tr>
        </thead>
        <tbody>

     <c:forEach items="${books}" var="book" varStatus="count">
        <tr>
        <td>${count.index+1}</td>
        <td>${book.book_id}</td>
        <td>${book.book_name}</td>
        <td >${book.total_num}/${book.usable_num}</td>
        <td>${book.book_actor}</td>
        <td>${book.content}</td>
        <td>${book.address}</td>
            <td><a <c:if test="${book.usable_num!=0}">href="javascript:;"
                   onclick="borrow(${book.book_id})"</c:if>class="tablelink"><c:if test="${book.usable_num==0}">不能</c:if>借阅</a>
                　<a href="#" class="tablelink">收藏</a></td>
        </tr>

        </c:forEach>

        </tbody>

    </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li <c:if test="${current==1}">class="disabled" </c:if>>
                    <a <c:if test="${current!=1}">
                        href="/book/list.do?page=${current-1}&selectBookName=${selectBookName}&selectActorName=${selectActorName}"</c:if>
                            aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach var="i" step="1" begin="1" end="${pages}">
                    <li  <c:if test="${i==current}"> class="active" </c:if> ><a <c:if test="${i!=current}">
                        href="/book/list.do?page=${i}&selectBookName=${selectBookName}&selectActorName=${selectActorName}" </c:if>
                            >${i} </a></li>
                </c:forEach>

                <li <c:if test="${current==pages}">class="disabled" </c:if>>
                    <a <c:if test="${current!=pages}">
                        href="/book/list.do?page=${current+1}&selectBookName=${selectBookName}&selectActorName=${selectActorName}" </c:if>
                            aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');

	function borrow(bookid) {
        $.ajax({
            type : "POST", //提交方式
            url : "/book/borrow.do",//路径
            data : {
                "bookid" : bookid
            },//数据，这里使用的是Json格式进行传输
            success : function(result) {//返回数据根据结果进行相应的处理
                    if (result=="1")
                    alert("借阅成功");
                    else
                        alert(result);
        }
        });

    }


	</script>


</body>

</html>
