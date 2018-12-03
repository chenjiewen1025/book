<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书借阅管理系统读者端</title>
</head>


<style type="text/css">
    #bottomFrame{
          height: 30px;
        width: 100%;

    }
    #iframeTop{
           width: 100%;
        height: 80px;
       
    }

        #iframeLeft{
            width: 12%;
            height: 800px;
            float: left;

            
        }
        #iframeContent{
            width: 80%;
            height: 800px;

        }
</style>
<body>
<div>

    <iframe id="iframeTop" name="topFrame" scrolling="no" frameborder="0" src="/user/main.do?url=user/top"></iframe>
    <iframe id="iframeLeft" name="leftFrame" scrolling="no" frameborder="0" src="/user/main.do?url=user/left_menu"></iframe>
    <iframe id="iframeContent" name="rightFrame" scrolling="auto" frameborder="0" src="/user/main.do?url=user/home"></iframe>
    <iframe src="/user/main.do?url=user/footer" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" id="bottomFrame" />


</div>
</body>

</html>
