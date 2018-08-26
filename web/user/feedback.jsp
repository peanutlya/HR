<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
    $(function () {
        $('li:eq(6)').addClass('active');
    })
    function findPage(currentPage) {
        if(currentPage!=0){
            window.location.href="${pageContext.request.contextPath}/UserServlet?op=showFeedBack&currentPage="+currentPage;
        }
    }
</script>
<body>
<%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <%@include file="left.jsp"%>
        </div>

       <div class="col-md-8">
           <div id="route">
               <ol class="breadcrumb">
                   <li><a href="#">系统菜单</a></li>
                   <li class="active">反馈结果</li>
               </ol>
           </div>
           <table class="table table-bordered table-striped table-hover">
               <tr>
                   <th>员工编号</th>
                   <th>员工姓名</th>
                   <th>请假时间</th>
                   <th>请假种类</th>
                   <th>请假原因</th>
                   <th>审核状态</th>
               </tr>
               <c:forEach items="${pageBean.pageList}" var="note" varStatus="vs">
                   <tr>
                       <td>${note.e_num}</td>
                       <td>${note.e_name}</td>
                       <td><fmt:formatDate value="${note.n_starttime}" pattern="yyyy-MM-dd HH:mm"/>～<fmt:formatDate value="${note.n_endtime}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <td>${note.n_type}</td>
                       <td>${note.n_forreason}</td>
                       <td id="state" class="text-danger">${note.n_state==0?'待审核':(note.n_state==1?'已通过':'已拒绝')}</td>
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




    </div>
</body>
</html>
