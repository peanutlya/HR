<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
	<script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
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
		<li><a href="${pageContext.request.contextPath}/admin/index.jsp"><img alt="系统菜单" src="${pageContext.request.contextPath}/images/首页-h.png">系统菜单</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=departmentManage"><span><img alt="部门管理" src="${pageContext.request.contextPath}/images/部门管理-h.png"></span>部门管理</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=employeeManage"><img alt="员工管理" src="${pageContext.request.contextPath}/images/员工管理-h.png">员工管理</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=leaveManage&n_state=0"><img alt="考勤" src="${pageContext.request.contextPath}/images/考勤-h.png">假勤管理</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=logManage"><img alt="日志管理" src="${pageContext.request.contextPath}/images/日志管理-h.png">日志管理</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=signin"><img alt="打卡" src="${pageContext.request.contextPath}/images/打卡-h.png">每日打卡</a></li>
		<li><a href="${pageContext.request.contextPath}/ManageServlet?op=punchCardManage"><img alt="打卡记录" src="${pageContext.request.contextPath}/images/打卡记录-h.png">打卡记录</a></li>
		<li id="test"><a href="${pageContext.request.contextPath}/ManageServlet?op=exit"><img alt="退出登录" src="${pageContext.request.contextPath}/images/退出登录-h.png">安全退出</a></li>
	</ul>
</div>

<script type="text/javascript">

$("span").click(function(){
    var src = "${pageContext.request.contextPath}/images/部门管理-b.png";    //新图片地址
    $(this).find("img").attr("src",src);    //更换图片地址
});

</script>

</body>
</html>
