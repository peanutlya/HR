<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        $('li:eq(1)').addClass("active");
        var t=$("input[name='keywords']").val();
        $("input[name='keywords']").val("").focus().val(t);
    })
    function findPage(currentPage) {
        if(currentPage!=0){
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=departmentManage&currentPage="+currentPage+"&keywords=${keywords}";
        }
    }
    function deleteDepartment(d_num) {
       $.ajax({
            url:"${pageContext.request.contextPath}/ManageServlet?op=deleteDepartmentCheck&d_num="+d_num,
            dataType:"json",
            success:function(res){
                if(res.key=="0"){
                   var p=layer.confirm(res.content+",您确定删除该部门吗",function () {
                       window.location.href="${pageContext.request.contextPath}/ManageServlet?op=deleteDepartment&d_num="+d_num;
                   });
                }else{
                    layer.alert(res.content);
                }
            }
        })
    }
    
    function editDepartment(d_num) {
        var index=layer.open({
            title: false,
            type: 2,
            content:"${pageContext.request.contextPath}/ManageServlet?op=editDepartment&d_num="+d_num,
            closeBtn: false,
            shadeClose: true,
            area: ['500px', '400px'],

        })

    }



</script>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">部门管理</li>
    </ol>
</div>
<div id="content">
    <form method="post" action="${pageContext.request.contextPath}/ManageServlet?op=departmentManage">
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-6"></div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="部门编号/部门名称" name="keywords" autofocus="" value="${keywords}">
                    <span class="input-group-btn">
             				        <button class="btn btn-default" type="submit">搜索</button>
             				      </span>
                </div><!-- /input-group -->
            </div>

        </div>
    </form>
    <table class="table table-bordered table-striped table-hover">
        <tr>
            <th>部门编号</th>
            <th>部门名称</th>
            <th>部门经理</th>
            <th>部门描述</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageBean.pageList}" var="department"  varStatus="vs">
            <tr>
                <td>${department.d_num}</td>
                <td>${department.d_name}</td>
                <td>${department.d_manager}</td>
                <td>${department.d_describe}</td>
                <td>
                    <a class="btn btn-info btn-xs" href="javascript:editDepartment('${department.d_num}')">编辑</a>
                    <%--<a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/ManageServlet?op=editDepartment&d_num=${department.d_num}">编辑</a>--%>
                    <a class="btn btn-danger btn-xs" href="javascript:deleteDepartment('${department.d_num}')">删除</a>
                </td>
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
