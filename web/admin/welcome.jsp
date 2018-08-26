<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>
<script>
    $(function () {
        $('li:eq(0)').addClass("active");
    })
</script>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li class="active">系统菜单</li>
    </ol>
</div>
<div id="content">
    <div class="jumbotron">
        <h1>Welcome!</h1>
    </div>
</div>
</body>
</html>
