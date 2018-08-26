<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/13
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
<html>
<head>
    <title>部门管理</title>
</head>
<script>

    $(function () {
        $('li:eq(6)').addClass("active");
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
    })
    function findPage(currentPage) {
        if(currentPage!=0){
            <%--window.location.href="${pageContext.request.contextPath}/ManageServlet?op=leaveManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&n_state=${condition.n_state}";--%>
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=punchCardManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&w_starttime=${condition.w_starttime}"+"&w_endtime=${condition.w_endtime}";
        }
    }

</script>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">打卡记录</li>
    </ol>
</div>
<div id="content">
    <form action="${pageContext.request.contextPath}/ManageServlet?op=punchCardManage" method="post" class="form-inline">
        <div class="form-group">
            <input type="text" name="e_name" placeholder="姓名" class="form-control" value="${condition.e_name}" autofocus="">
        </div>

        <div class="form-group" style="margin-left:15px">
            <input type="date" name="w_starttime"  class="form-control" value="${condition.w_starttime}" >
        </div>
        <span>至</span>
        <div class="form-group">
            <input type="date" name="w_endtime" class="form-control" value="${condition.w_endtime}">
        </div>

        <input type="submit" value="搜索" class="btn btn-default pull-right">
    </form>
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>打卡时间</th>
        </tr>
        <c:forEach items="${pageBean.pageList}" var="punchCard"  varStatus="vs">
            <tr>
                <td>${punchCard.e_num}</td>
                <td>${punchCard.e_name}</td>
                <td><fmt:formatDate value="${punchCard.p_date}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
        </c:forEach>
    </table>
    <h5>当前是第${pageBean.totalPage==0?0:pageBean.currentPage}页,共${pageBean.totalPage}页，总记录数为${pageBean.totalCount}条。</h5>
    <nav style="text-align: center">
        <ul class="pagination">
            <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
            <c:if test="${pageBean.currentPage==1}">
                <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
            </c:if>

            <c:if test="${pageBean.currentPage!=1}">
                <li><a href="javascript:findPage(${pageBean.currentPage-1})"><span>上一页</span></a></li>
            </c:if>

            <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                <c:if test="${pageBean.currentPage==page}">
                    <li class="active"><a href="javascript:void(0)">${page}</a></li>
                </c:if>
                <c:if test="${pageBean.currentPage!=page}">
                    <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${pageBean.currentPage==pageBean.totalPage||pageBean.totalPage==0}">
                <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                </a></li>

            </c:if>

            <c:if test="${pageBean.currentPage!=pageBean.totalPage&&pageBean.totalPage!=0}">
                <li><a href="javascript:findPage(${pageBean.currentPage+1})"> <span>下一页</span>
                </a></li>
            </c:if>
            <li><a href="javascript:findPage(${pageBean.totalPage})"><span>尾页</span></a></li>
        </ul>
    </nav>



</div>
</body>
</html>
