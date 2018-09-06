<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
           var map=$("#resultmap").val();
           console.log(map);
        });

        console.log()

    </script>
</head>
<body>
<%--<button>导出</button>--%>
<table>

    <div class="panel panel-default">
        <input type="text" value="${result}" id="resultmap">
        <div class="panel-body">
            <div class="panel-heading" align="center"><h1 class="sub-header h3">文件上传</h1></div>
            <hr>
            <form class="form-horizontal" id="upload" method="post" action="upload" enctype="multipart/form-data">
                <div class="form-group" align="center">
                    <div class="col-md-4 col-sm-4  col-xs-4 col-lg-4">文件上传
                        <input type="file" class="form-control" multiple="multiple" name="file" id="file"><br>
                        <input type="submit" value="上传">
                    </div>
                </div>
            </form>
        </div>
    </div>

</table>


</body>
</html>