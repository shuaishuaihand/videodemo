<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
    <style type="text/css">
        *{padding: 0; margin: 0}
       /* .box{
            position: fixed;
            width: 500px;
            height: 500px;
            background: rgba(0,0,0,0.2);
            display: none;
        }*/
        .box{
            position: fixed;left: 50%; top: 25%;
            width: 500px;
            height: 500px;
            background: rgba(0,0,0,0.2);
            display: none;
        }
        .box1{
            width: 500px;
            height: 500px;
            position: fixed;left: 50%; top: 25%;
            margin-left: -250px;
            border: 1px solid #000000;
        }
        .box2{
            width: 100px;
            height: 200px;
            position: fixed;left: 70%; top: 75%;
            margin-left: -250px;
            border: 1px solid blue;
        }


    </style>
<script type="text/javascript">
    /*$(document).ready(function(){
       $(.box)
   })*/

    $(document).ready(function(){
        $(".box1").hide();
        $(".box2").hide();
        $("#close1").click(function () {
            $(".box1").hide();
        });

        $("#close2").click(function () {
            $(".box2").hide();
        });

        $("#min").click(function () {
            $(".box1").hide();
            $(".box2").show();
        });
        $("#max").click(function () {
            $(".box2").hide();
            $(".box1").show();
        })

    })

</script>
</head>
<body>
<div class="box">
</div>
<div class="box1">
  <%--  <a href="javascript:;" onclick="jQuery('.box').hide()" class="close">最小化</a>
    <a href="javascript:;" onclick="jQuery('.box').hide()" class="close">关闭</a>--%>
      <a href="javascript:;" id="close1" class="close">关闭</a>
      <a href="javascript:;" id="min" class="close">最小化</a>
</div>


<div class="box2">
    <a href="javascript:;" id="close2" class="close">关闭</a>
    <a href="javascript:;" id="max" class="close">最大化</a>
</div>
<a href="javascript:;" onclick="jQuery('.box1').show()" class="show">显示</a>

</body>
</html>