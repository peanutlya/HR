
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>
<script>
    $(function () {
        $('li:eq(0)').addClass("active");
    })
</script>
<style>
	
	#content{background:#fff;width:900px;margin:auto;color:#fff;}
	.ul{list-style-type:none;}
	.ul .l1{width:250px;height:310px;background:#187d9a;float:left;margin:5px;}
	.ul .l2{width:150px;height:310px;background:#4fb5c7;float:left;margin:5px;}
	.ul .l3{width:150px;height:310px;background:#90a8e3;float:left;margin:5px;}
	.ul .l4{width:250px;height:150px;background:#eaaf76;float:left;margin:5px;}
	.ul .l5{width:250px;height:150px;background:#db6987;float:left;margin:5px;}
	.ul .l6{width:205px;height:150px;background:#88bad9;float:left;margin:5px;}
	.ul .l7{width:205px;height:150px;background:#c0d9d9;float:left;margin:5px;}
	.ul .l8{width:400px;height:150px;background:#a0cf41;float:left;margin:5px;}
	.ul .l1 p{margin:0 0 0 25% ;}
	.ul .l1 img{width:80px;height:80px;margin:28% 0 10px 28%;}
	.ul .l2 img{width:80px;height:80px;margin:50% 0 10px 25%;}
	.ul .l2 p{margin:0 0 0 28% ;}
	.ul .l3 img{width:80px;height:80px;margin:50% 0 10px 25%;}
	.ul .l3 p{margin:0 0 0 28% ;}
	.ul .l4 img{width:80px;height:80px;margin:10% 0 10px 35%;}
	.ul .l4 p{margin:0 0 0 38% ;}
	.ul .l5 img{width:80px;height:80px;margin:10% 0 10px 35%;}
	.ul .l5 p{margin:0 0 0 38% ;}
	.ul .l6 img{width:80px;height:80px;margin:9% 0 10px 30%;}
	.ul .l6 p{margin:0 0 0 33% ;}
	.ul .l7 img{width:80px;height:80px;margin:9% 0 10px 30%;}
	.ul .l7 p{margin:0 0 0 33% ;}
	.ul .l8 img{width:80px;height:80px;margin:5% 0 10px 38%;}
	.ul .l8 p{margin:0 0 0 41% ;}
	ul li a{color:#fff;}
	ul li a:hover{color:#fff;text-decoration:none;}
</style>
<body>
<%@include file="top.jsp"%>
<div id="content">

      <ul class="ul">
        
        <li class="l1"> <a href="">
        	<img src="images/person.png">  
        	<p>姓名：${employee.e_name}<br>
        	工号：${employee.e_num}</p>
        </a> </li>
        <li class="l2"> <a href="${pageContext.request.contextPath}/UserServlet?op=showPersonalMessage">
        <img src="images/personalMessage.png">  
        	<p>个人信息</p>
        </a> </li>
        <li class="l3"> <a href="leaveRequest.jsp">  
        <img src="images/leaveRequest.png">  
        	<p>  请假申请</p>
      </a> </li>

        <li class="l4"> <a href="${pageContext.request.contextPath}/UserServlet?op=showWorkLog">
        <img src="images/workLog.png">  
        	<p>  工作日志</p>  </a> </li>
       
        <li class="l5"> <a href="${pageContext.request.contextPath}/user/attendance.jsp">
        <img src="images/attendance.png">  
        	<p>  出勤情况</p> </a> </li>
        <li class="l6"> <a href="${pageContext.request.contextPath}/UserServlet?op=showFeedBack">
        <img src="images/leaveMessage.png">  
        	<p>  反馈结果</p></a> </li>
        <li class="l7"> <a href="${pageContext.request.contextPath}/user/signin.jsp">
        <img src="images/announcement.png">  
        	<p>  每日打卡</p> </a> </li>
        <li class="l8"> <a href="${pageContext.request.contextPath}/ManageServlet?op=exit">
        <img src="images/exit.png">  
        	<p>  安全退出</p> </a> </li>
      

      </ul>
  
  	
</div>

	
</body>
</html>
