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
    
    <title>My JSP 'logInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
 

  </head>
  <style>
      textarea{
          height:40px !important;
      }
  </style>
  <body>
  <div id="route">
    <ol class="breadcrumb">
        <li><a href="#">系统菜单</a></li>
        <li class="active">日志内容</li>
    </ol>
</div>
   
        
        <div class="col-md-10 ">
        	
        <div class="box box-primary">
            
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
              <h4>From: ${log.e_name}
                  <span class="mailbox-read-time pull-right"></span></h4>
                <h5><fmt:formatDate value="${log.w_subtime}" pattern="yyyy-MM-dd HH:mm"/></h5>
                
              </div>
              <!-- /.mailbox-read-info -->
              
                
              <!-- /.mailbox-controls -->
             
              <div class="mailbox-read-message">
                <h3>已完成内容</h3>
				<textarea rows="3" class="form-control" readonly style="resize:none;"
				>${log.w_contentscompleted}</textarea>
                
					<h3>未完成内容</h3>
					<textarea rows="3" class="form-control" readonly="" style="resize:none;"
				>${log.w_unfinished}</textarea>
                
					<h3>自我评价</h3>
					<textarea rows="3" class="form-control" readonly style="resize:none;"
				>${log.w_selfassessment}</textarea>
               
					<h3>心情与感想</h3>
					<textarea rows="3" class="form-control"  readonly style="resize:none;"
				>${log.w_note}</textarea>
                
				<button class="btn btn-primary" id="btn" style="margin-top:20px;">返回</button>
                
              </div>
              <!-- /.mailbox-read-message -->
 
            </div>
            <!-- /.box-body -->
          
            
          </div>
          <!-- /. box -->
      
        <!-- /.col -->
     



        <script type="text/javascript">
            $('li:eq(4)').addClass("active");
        	$('#btn').click(function(){
        		window.history.back();
        	
        	})
        </script>
		
      
       
       </div>
    
  </body>
</html>
