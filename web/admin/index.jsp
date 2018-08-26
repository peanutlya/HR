<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder"%>
<html>
<head>
    <title>人力资源管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>

<script>
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    if(index){
        parent.layer.close(index);
        window.parent.location.reload();
    }
</script>

<body>
<%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <%@include file="left.jsp"%>
        </div>
        <div class="col-md-9">
            <jsp:include page="${mainPage==null?'welcome.jsp':mainPage}"></jsp:include>
        </div>
    </div>
</div>



</body>

</html>




</div>