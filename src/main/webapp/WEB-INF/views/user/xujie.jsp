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
    <li><a href="#">图书借阅</a></li>
    <li><a href="#">归还与续借</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <ul class="prosearch">
       <li>
        
        <i>书名</i><a><input name="" type="text" class="scinput" /></a>
        
       <a><input name="button" type="button" class="sure" value="查询" style="background:#417EB5;margin-left: 25px;"/></a>
       </li>
       </ul>
    <table class="tablelist">
        <thead>
        <tr>
        
        <th>序号<i class="sort"><img src="/static/images/px.gif" /></i></th>
        <th>姓名</th>
        <th>学号</th>
       
        <th>书名</th>
        <th>书号</th>
        <th>借出时间</th>
        <th>最晚归还时间</th>
         <th>可否续借</th>
        <th>操作</th>
        
        
        </tr>
        </thead>
        <tbody>
        <!--
            作者：1628648978@qq.com
            时间：2018-08-15
            描述：无记录时提示暂无查询结果
        -->
        <!--
            <tr><td colspan="12">暂无查询结果</td></tr>
        -->
       
        <tr>
        <td>1</td>
        <td>20150606</td>
        <td>java编程思想</td>
        <td>10/8</td>
        <td>大宝</td>
        <td>讲java</td>
        <td>316</td>
        <td>是</td>
        <td><a href="#" class="tablelink">归还</a>　<a href="#" class="tablelink">续借</a></td>
        </tr>
        
     
        </tbody>
    </table>
    
   
    <div class="pagin">
        <div class="message">共<i class="blue">3</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem current"><a href="javascript:;">1</a></li>
        <li class="paginItem "><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
 
    
    </div>
    
    <script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
    </script>

</body>

</html>
