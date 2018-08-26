<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假审核</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
    <style type="text/css">
        #div{box-shadow: 0px 0px 15px #cac6c6;margin:5px;}
        #div table{margin-left:20px}
        #div tr td{text-align:left;}
        #div tr td#td{width:400px;}
        #div tr td span{font-size:8px;color:#888}
        #div tr td div{font-weight:bold;font-size:12px;color:#000;padding-top:5px;}
        #div tr td .result{margin-left:150px}
        #div tr td .result .btn span{font-size:12px;margin:5px;color:#fff;}
        #div tr td .result .btn{margin-left:50px}
        #div:nth-child(odd){background:#ededed;}
        #div:nth-child(even){background:#f1faee;}
    </style>
</head>
<script>

    $(function () {
        $('li:eq(3)').addClass("active");
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
    })
    function findPage(currentPage) {
        if(currentPage!=0){
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=leaveManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&n_state=${condition.n_state}";
        }
    }
    function updateNoteState(e_num,n_state,check) {
        if(check==1){
            var p=layer.confirm("确定通过该请假申请？",function () {
                window.location.href="${pageContext.request.contextPath}/ManageServlet?op=updateNoteState&e_num="+e_num+"&n_state="+n_state;
            });
        }else if(check==0){
            var p=layer.confirm("真要残忍拒绝吗？",function () {
                window.location.href="${pageContext.request.contextPath}/ManageServlet?op=updateNoteState&e_num="+e_num+"&n_state="+n_state;
            });
        }
    }
</script>
<body>




<div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">假勤管理</li>
    </ol>
</div>
<form action="${pageContext.request.contextPath}/ManageServlet?op=leaveManage" method="post" class="form-inline">
    <div class="form-group">
        <input type="text" name="e_name" placeholder="姓名" class="form-control" value="${condition.e_name}" autofocus="">
    </div>
    <div class="radio" style="margin-left:15px">
        <input type="radio" name="n_state" value="0" ${condition.n_state=="0" ?'checked':''}>待审核
        <input type="radio" name="n_state" value="1" ${condition.n_state=="1" ?'checked':''}>已通过
        <input type="radio" name="n_state" value="-1" ${condition.n_state=="-1"?"checked":""}>已拒绝
        <input type="radio" name="n_state" value="" ${condition.n_state==""?"checked":""}>全部
    </div>
    <input type="submit" value="搜索" class="btn btn-default pull-right">
</form>
<c:forEach items="${pageBean.pageList}" var="note"  varStatus="vs">
    <div id="div" >
        <table>
            <tr><td id="td"><div>${note.e_name}</div></td>
                <c:if test="${note.n_state==0}">
                    <td rowspan="6"  valign="middle">
                        <!--	<button class="btn btn-success btn-xs " onclick="updateNoteState('${note.e_num}','1',1)"><span class="glyphicon glyphicon-ok">通过</span></button>
                        			<button class="btn btn-danger btn-xs" onclick="updateNoteState('${note.e_num}','-1',0)"><span class="glyphicon glyphicon-remove">拒绝</span></button>
                        			-->
                        <div class="result">
                            <button class="btn btn-success btn-xs " onclick="updateNoteState('${note.e_num}','1',1)"><span class="glyphicon glyphicon-ok">通过</span></button>
                            <button class="btn btn-danger btn-xs" onclick="updateNoteState('${note.e_num}','-1',0)"><span class="glyphicon glyphicon-remove">拒绝</span></button>
                        </div>
                    </td>
                </c:if>
                <c:if test="${note.n_state!=0}">
                    <td><span class="text-muted">已处理</span></td>
                </c:if>
            </tr>
            <tr><td id="td"><span>员工编号：${note.e_num}</span></td> </tr>
            <tr><td id="td"><span>请假时间：<fmt:formatDate value="${note.n_starttime}" pattern="yyyy-MM-dd HH:mm"/>～<fmt:formatDate value="${note.n_endtime}" pattern="yyyy-MM-dd HH:mm"/></span></td>  </tr>
            <tr><td id="td"><span>请假种类：${note.n_type}</span></td>
            </tr>
            <tr><td id="td"><span>请假原因：${note.n_forreason}</span></td></tr>
            <tr><td id="td"><span>审核状态：<span style="color:#d44950">${note.n_state==0?'待审核':(note.n_state==1?'已通过':'已拒绝')}</span></td></tr>


        </table>

    </div>
</c:forEach>

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






</body>
</html>
