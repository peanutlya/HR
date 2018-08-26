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
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
	<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>

	
	<style type="text/css">
	img{
	width:22px;
	height:22px;
	margin-top:-5px;
	margin-right:10px;
	}
	
	#left{
	color:#999;
	line-height:30px;
	}
		
	</style>
</head>

<body>

<div id="left">
	<ul class="nav nav-pills nav-stacked myul">
		<li><a href="${pageContext.request.contextPath}/user/welcome.jsp"><img alt="系统菜单" src="${pageContext.request.contextPath}/images/首页-h.png">首页</a></li>
		<li><a href="${pageContext.request.contextPath}/UserServlet?op=showPersonalMessage"><img alt="个人信息" src="${pageContext.request.contextPath}/images/个人信息-h.png">个人信息</a></li>
		<li><a href="${pageContext.request.contextPath}/user/leaveRequest.jsp"><img alt="请假申请" src="${pageContext.request.contextPath}/images/请假申请-h.png">请假申请</a></li>
		<li><a href="${pageContext.request.contextPath}/UserServlet?op=showWorkLog"><img alt="工作日志" src="${pageContext.request.contextPath}/images/工作日志-h.png">工作日志</a></li>
		<li><a href="${pageContext.request.contextPath}/user/attendance.jsp"><img alt="出勤情况" src="${pageContext.request.contextPath}/images/出勤情况-h.png">出勤情况</a></li>
		<li><a href="${pageContext.request.contextPath}/user/signin.jsp"><img alt="打卡" src="${pageContext.request.contextPath}/images/打卡-h.png">每日打卡</a></li>
		<li><a href="${pageContext.request.contextPath}/UserServlet?op=showFeedBack"><img alt="结果" src="${pageContext.request.contextPath}/images/结果-h.png">反馈结果</a></li>
		
		<li id="test"><a href="${pageContext.request.contextPath}/ManageServlet?op=exit"><img alt="退出登录" src="${pageContext.request.contextPath}/images/退出登录-h.png">安全退出</a></li>
	</ul>
</div>
</body>
</html>
