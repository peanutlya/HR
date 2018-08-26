<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>人事资源管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<script>
    $(function () {
       $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/AjaxServlet?op=findEmployeeInDepartment&d_num=${currentDepartment.d_num}",
            async:true,
            dataType:"json",
            success:function (res) {
                $.each(res,function (index,item) {
                    var oP=$("<option>"+item.e_name+"</option>");
                    $(oP).val(item.e_name);
                    $('#manager').append(oP);
                })
                $("option[value='${currentDepartment.d_manager}']").prop("selected",true);
            }
        });
    })
</script>
<style>

    form{
        margin-top:15px;
    }
</style>
<body>
<div class="container">
    <form class="form-horizontal" id="myform" action="${pageContext.request.contextPath}/ManageServlet?op=updateDepartment" method="post">

        <div class="form-group">
            <label  class="col-sm-2 col-sm-offset-3 control-label">部门编号</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="e_num" name="d_num" value="${currentDepartment.d_num}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 col-sm-offset-3 control-label">部门名称</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="passowrd" name="d_name"  value="${currentDepartment.d_name}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 col-sm-offset-3 control-label">部门经理</label>
            <div class="col-sm-3">
                <select class="form-control" id="manager" name="d_manager">

                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 col-sm-offset-3 control-label">部门描述</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="d_describe" value="${currentDepartment.d_describe}">
            </div>
        </div>

        <div class="form-group" style="margin-top:45px">
            <label  class="col-sm-2 col-sm-offset-3 control-label"></label>
            <div class="col-sm-3">
                <button type="submit" class="btn btn-success" style="margin-right:30px">确定</button>
                <button type="reset" class="btn btn-primary" >重置</button>

            </div>
        </div>


    </form>

</div>
</body>
</html>