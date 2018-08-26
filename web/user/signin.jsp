<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>请假申请</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>


</head>

<body>
<%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <%@include file="left.jsp"%>
        </div>

        <div class="col-md-10">
            <button id="open" class="btn btn-default">打开摄像头</button>
            <div id="content" style="text-align: center">
                <div id="main_content">
                    <video id="video" width="240" height="180" controls>
                    </video>
                    <p>
                        <button id="capture" class="btn btn-default" style="margin-top:5px">拍照</button>
                    </p>
                    <canvas id="canvas" width="150" height="150"></canvas>
                    <p><button id="signin" class="btn btn-default" style="margin-top:5px">打卡</button></p>
                </div>
            </div>

        </div>

</div>

    </div>
</body>
<script>
    $('li:eq(5)').addClass("active");
    $("#open").click(function () {
        if (navigator.mediaDevices.getUserMedia || navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia) {
            //调用用户媒体设备, 访问摄像头
            getUserMedia({video : {width: 240, height: 180}}, success, error);
            layer.msg("请正对摄像头,点击拍照",{time:500});
        } else {
            alert('不支持访问用户媒体');
        }
    })
    //访问用户媒体设备的兼容方法
    function getUserMedia(constraints, success, error) {
        if (navigator.mediaDevices.getUserMedia) {
            //最新的标准API
            navigator.mediaDevices.getUserMedia(constraints).then(success).catch(error);
        } else if (navigator.webkitGetUserMedia) {
            //webkit核心浏览器
            navigator.webkitGetUserMedia(constraints,success, error)
        } else if (navigator.mozGetUserMedia) {
            //firfox浏览器
            navigator.mozGetUserMedia(constraints, success, error);
        } else if (navigator.getUserMedia) {
            //旧版API
            navigator.getUserMedia(constraints, success, error);
        }
    }
    var video = document.getElementById('video');
    //var canvas = document.getElementById('canvas');
    //var context = canvas.getContext('2d');

    function success(stream) {
        //兼容webkit核心浏览器
        var CompatibleURL = window.URL || window.webkitURL;
        //将视频流设置为video元素的源
        console.log(stream);

        //video.src = CompatibleURL.createObjectURL(stream);
        video.srcObject = stream;
        video.play();
    }

    function error(error) {
        layer.alert("访问用户媒体设备失败");
        console.log('访问用户媒体设备失败${error.name}, ${error.message}');
    }

    var context=$("#canvas")[0].getContext('2d');
    $("#capture").click(function () {
        context.drawImage(video, 0, 0, 150, 150);
    })
    $("#signin").click(function () {
        var data = $('#canvas')[0].toDataURL();
        var b64 = data.substring( 22 );
        $.ajax({
            url: "${pageContext.request.contextPath}/AjaxServlet?op=signin",
            type:'post',
            data: {head_image: b64,e_num:'${employee.e_num}',e_name:'${employee.e_name}'},
            dataType:'json',
            success:function (data)
            {
                console.log(data);
                if(data.error_msg=="SUCCESS"){
                    layer.alert("颜值合格，打卡成功",function () {
                        window.location.reload();
                    });
                    //alert("颜值合格，打卡成功!")

                    /* if(data.result.score>=80){
                         alert("颜值合格，打卡成功");
                     }else{
                         alert("颜值不够，打卡失败");
                     }*/
                }else{
                    console.log(data);
                    layer.alert("打卡失败，请调整拍照角度重试");
                }

            },
        });
    })
</script>
</html>
