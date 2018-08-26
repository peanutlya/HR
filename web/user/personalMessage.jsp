<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/user/css/resume.css" rel="stylesheet" />
    
      <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
  </head>
  <script>
      $(function () {
          $("li:eq(1)").addClass('active');
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
		  <!--Content-->
            	
                <!--Profile-->
                	
                    <!--left-->
                    <div class="row" style="background:#f7f7f7;padding:80px;border:1px solid #ccc">
                    <div class="col-md-5" >
                    	
                            	
                            	<div class="title">
                                	<h3>简况</h3>
                            	</div>
                            	<div class="span2">
                        			<div class="resume-photo">
                            			<img src="${pageContext.request.contextPath}/user/img/photo.jpg"
                            			width="100px" height="100px"/>
                        			</div>
                    			</div>
                        
					</div>
                    <!--right-->
                    <div class="col-md-7" >
                    	
                            	<div class="title display-table">
                                	<p>工号</p>
                                	<span class="pull-right">${employee.e_num}</span>
                            	</div>
                            	<div class="title display-table">
                                	<p>姓名</p>
                                	<span class="pull-right">${employee.e_name}</span>
                            	</div>
                            	<div class="title display-table">
                                	<p>性别</p>
                                	<span class="pull-right">${employee.e_gender}</span>
                           	 	</div>
                            	<div class="title display-table">
                                	<p>联系电话</p>
                                	<span class="pull-right">${employee.e_tellnumber}</span>
                            	</div>
	                            <div class="title display-table">
	                                <p>身份证号</p>
	                                <span class="pull-right">${employee.e_idcard} </span>
	                            </div>
	                            <div class="title display-table">
	                                <p>所在部门</p>
	                                <span class="pull-right">${employeeInfo.d_name}</span>
	                            </div>

	                       
	                    </div>
	               </div>
	            </div><!--/Content -->
		 
     </div>
     </div>
     
  </body>
</html>
