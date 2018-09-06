<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/static/css/webuploader.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/js/alert/sweetalert2.css">
   <%-- <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">--%>
    <script src="/static/js/jQuery-2.2.0.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/js/webuploader.js"></script>
    <script type="text/javascript" src="/static/js/alert/alertinfo.js"></script>
    <script type="text/javascript" src="/static/js/alert/promise.auto.min.js"></script>
    <script type="text/javascript" src="/static/js/alert/sweetalert2.min.js"></script>
   <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        jQuery(function() {
            var $ = jQuery,
                $list = $('#thelist'),
             /*   $btn = $('#ctlBtn'),*/
                $picker = $('#picker'),
                state = 'pending',
                allfileNum,
                queuedfile=0,
                completefile=0,
                uploadedfilenum,
                uploader;
      /*  $(document).ready(function(){*/
           /* debugger*/
           uploader = WebUploader.create({

                // swf文件路径
                /*swf: BASE_URL + '/static/Uploader.swf',*/
                swf: '/static/Uploader.swf',

                // 文件接收服务端。
                server: 'http://localhost:8083/upload',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id:'#picker',
                    //是否允许单次上传时同时选择多个文件
                    multiple:true
                },
               //[可选] [默认值：undefined] 验证文件总数量, 超出则不允许加入队列。
               fileNumLimit: 20,
               /*pick: '#ctlBtn',*/
               //fileSingleSizeLimit {int} [可选] [默认值：undefined] 验证单个文件大小是否超出限制, 超出则不允许加入队列
               //500M,暂时针对视频
               fileSingleSizeLimit:500*1024*1024,


                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: false
            });

            uploader.on('error',function (handler) {
               if(handler=="Q_EXCEED_NUM_LIMIT"){
                    alert("超出最大文件上传个数20");
                }
                if(handler=="F_EXCEED_SIZE"){
                    alert("单个视频大小超过500M");
                }
            })




            // 当有文件被添加进队列的时候
            uploader.on('fileQueued', function (file) {
                console.log("等待上传")
                console.log(file)
                $list.append('<div id="' + file.id + '" class="item">' +
                    '<h4 class="info">' + file.name + '</h4>' +
                    '<span>'+file.ext+'</span>'+
                    '<span>'+file.size+'</span>'+
                    '<p class="state">等待上传111...</p>' +
                    '</div>');

                queuedfile++;
                allfileNum=completefile+"/"+queuedfile;
                /!* allfileNum=uploader.getFiles("complete").length;*!/
                $("#allfilenum").val(allfileNum);
                uploader.upload();
               /* alert("提示成功添加20个上传，5个上传未添加");*/
            });


          /*  allfileNum=uploader.getFiles("complete").length;
            $("#allfilenum").val(allfileNum);
*/
            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
               /* console.log(uploader.getFiles("complete").length+"complete")*/
              /*  allfileNum=completefile+"/"+queuedfile;
                /!*     allfileNum=uploader.getFiles("complete").length;*!/
                $("#allfilenum").val(allfileNum);*/
                console.log("上传中123")
                console.log(percentage)
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress .progress-bar');

                // 避免重复创建
                if (!$percent.length) {
                    console.log()
                    $percent = $('<div class="progress progress-striped active">' +
                        '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                        '</div>' +
                        '</div>').appendTo($li).find('.progress-bar');
                }

                $li.find('p.state').text('上传中111');

                $percent.css('width', percentage * 50 + '%');
            });

            uploader.on('uploadSuccess', function (file,response) {
               /* debugger*/
                console.log(111)
                console.log(response)
                console.log(response._raw)
             /*   console.log(response.error())*/
                $('#' + file.id).find('p.state').text('已上传');
            });

            uploader.on('uploadError', function (file) {
                $('#' + file.id).find('p.state').text('上传出错');
            });

            uploader.on('uploadComplete', function (file) {
              /*  debugger*/
                completefile++;
                allfileNum=completefile+"/"+queuedfile;
                /!*  allfileNum=uploader.getFiles("complete").length;*!/
                $("#allfilenum").val(allfileNum);
                $('#' + file.id).find('.progress').fadeOut();
            });

            uploader.on( 'all', function( type ) {
                if ( type === 'startUpload' ) {
                    state = 'uploading';
                } else if ( type === 'stopUpload' ) {
                    state = 'paused';
                } else if ( type === 'uploadFinished' ) {
                    state = 'done';
                }

                /*if ( state === 'uploading' ) {
                    $btn.text('暂停上传');
                } else {
                    $btn.text('开始上传');
                }*/
            });

           /* $picker.on( 'click', function() {
                    uploader.upload();
            });*/

        });
    </script>
</head>
<body>

<%--<button>导出</button>--%>

   <%-- <div id="uploader" class="wu-example">--%>
        <div class="btns">
            <div id="picker">选择文件</div>
           <%-- <button id="ctlBtn" class="btn btn-default">开始上传</button>--%>
            <button onblur="alertfuncton()" style="padding:9px 15px">删除</button>
        </div>
        <div>
            <input type="text" id="allfilenum">
        </div>
        <!--用来存放文件信息-->
        <div id="thelist" class="uploader-list"></div>
   <%-- </div>--%>
   <div><span class="glyphicon glyphicon-search">1111</span></div>


<script type="text/javascript">
   function alertfuncton(){
       console.log(1233444);
       $.TimeAlert('info',"请选择一条您要操作的数据");
       return false;
    }
</script>
</body>

</html>