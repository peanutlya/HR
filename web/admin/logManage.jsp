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
    
    <title>My JSP 'logMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
  <!-- Font Awesome -->
  
  </head>
  <script>

    $(function () {
        $('li:eq(4)').addClass("active");
        var t=$("input[name='e_name']").val();
        $("input[name='e_name']").val("").focus().val(t);
    })
    function findPage(currentPage) {
        if(currentPage!=0){
            <%--window.location.href="${pageContext.request.contextPath}/ManageServlet?op=leaveManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&n_state=${condition.n_state}";--%>
            window.location.href="${pageContext.request.contextPath}/ManageServlet?op=logManage&currentPage="+currentPage+"&e_name=${condition.e_name}"+"&w_starttime=${condition.w_starttime}"+"&w_endtime=${condition.w_endtime}";
        }
    }

</script>
  <body style="border:1px solid #ccc">
  <div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">日志管理</li>
    </ol>

    
    
	   	<form action="${pageContext.request.contextPath}/ManageServlet?op=logManage" method="post" class="form-inline">
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
        
      
        	
            

              
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            
             
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <c:forEach items="${pageBean.pageList}" var="log"  varStatus="vs">
                  <tr>
                    <td>${(pageBean.currentPage-1)*pageBean.pageSize+vs.count}</td>
                    
                    <td class="mailbox-name">${log.e_name}</td>
                    <td class="mailbox-subject" style="text-align:left;"><b>工作内容：</b> 
                    <a href="${pageContext.request.contextPath}/ManageServlet?op=logInfo&e_name=${log.e_name}">${log.w_contentscompleted}</a>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date"><fmt:formatDate value="${log.w_subtime}" pattern="yyyy-MM-dd HH:mm"/></td>
                  </tr>
                 </c:forEach>
                 
                  </tbody>
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
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
     
            
         
        
        
			
         
      
    

  </body>
</html>
