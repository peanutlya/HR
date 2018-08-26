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
          $('li:eq(2)').addClass('active');
          if('${result}'!=null&&'${result}'!=''){
              layer.alert('${result}');
          }
      })
  </script>
  <body>
   	<%@include file="top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <%@include file="left.jsp"%>
        </div>
        
         
         

     <div class="col-md-10" >
    <div id="route">
		                <ol class="breadcrumb">
		                    <li><a href="#">系统菜单</a></li>
		                    <li class="active">个人信息</li>
		                </ol>
		            </div>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/UserServlet?op=addLeave" method="post">
        <input type="hidden" name="e_num" value="${employee.e_num}">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">申&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;人：</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="e_name" value="${employee.e_name}" readonly>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-2 control-label">请&nbsp;假&nbsp;时&nbsp;间：</label>
   <div class="col-sm-10">
     
  		<div class="col-md-5" ><%@include file="date.jsp" %></div>
  		<div class="col-md-2" style="text-align:center;">至</div>
  		<div class="col-md-5"><%@include file="date1.jsp" %></div>
	
    </div>
  </div>
  <div class="form-group">
    <label for="" class="col-sm-2 control-label">请&nbsp;假&nbsp;种&nbsp;类：</label>
    <div class="col-sm-10">
    <div class="col-md-4" style="text-align:center;">
      <div class="radio">
  <label>
    <input type="radio" name="n_type" id="optionsRadios1" value="病假" checked>
    病假
  </label>
</div>
</div>
<div class="col-md-4" style="text-align:center;">
<div class="radio">
  <label>
    <input type="radio" name="n_type" id="optionsRadios2" value="事假">
   事假
  </label>
</div>
</div>
<div class="col-md-4" style="text-align:center;">
<div class="radio">
  <label>
    <input type="radio" name="n_type" id="optionsRadios3" value="其他">
    其他
  </label>
</div>
</div>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">请&nbsp;假&nbsp;原&nbsp;因：</label>
    <div class="col-sm-10">
      <textarea class="form-control" rows="6"  maxlength="100" placeholder="请输入不超过100字" style="resize:none;" name="n_forreason"></textarea>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">提交申请</button>
    </div>
  </div>
</form>
</div>
</div>
        
    
</div>
  </body>
</html>
