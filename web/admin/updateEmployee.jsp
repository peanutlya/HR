<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addEmployee.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <form>
  <div class="form-group">
    <label>员工编号</label>
    <input type="text" class="form-control" id="exampleInputEmail1" >
  </div>
  
  <div class="form-group">
    <label for="exampleInput/Password1">姓名</label>
    <input type="text" class="form-control" id="exampleInputPassword1" >
  </div>
  <div class="form-group">
   <label for="exampleInputEmail1">性别</label>
  <label class="radio-inline" style="margin-left:80px">
  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="male" checked="checked"> 男
</label>
<label class="radio-inline" style="margin-left:250px">
  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="female"> 女
</label>

    </div>
  <div class="form-group">
    <label for="exampleInputPassword1">身份证号</label>
    <input type="text" class="form-control" id="exampleInputPassword1" >
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">联系电话</label>
    <input type="text" class="form-control" id="exampleInputPassword1" >
  </div>
  <div class="form-group">
  <label for="exampleInputPassword1">所在部门</label>
  <select class="form-control">
  <option>财务部</option>
  <option>开发部</option>
  <option>测试部</option>
  <option>销售部</option>
  <option>市场部</option>
  <option>设计部</option>
  <option>运维部</option>
</select>
  </div>
</form>
    
  </body>
</html>
