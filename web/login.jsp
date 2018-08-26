
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>xyxy</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bs/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/bs/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/bs/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/bs/js/holder.min.js"></script>
</head>

<style>
  body{
    background: url(images/bg.jpg) no-repeat left top;
    background-size:100% 100%;
  }
  .container.mycontent{
  	width:420px;
   	opacity: 0.8;
    margin-top:130px;
    background:#fff;
    border-radius:5%;
    box-shadow: 0px 0px 25px #cac6c6;
  }

  .form-control{
    height:40px;
	width:320px;
	margin:auto;
  }
  form{
    margin-top:40px;
    margin-bottom:40px;
  }
  .checkbox{
  	text-align:center;
  	margin:20px 0px;
  }
	.form-group{
		margin:30px 0px;
	}
	.btn{background:#20a0ff;color:#fff;}
	.btn:hover{color:#fff;}
</style>

<body>
<div class="container mycontent">
  <h2 align="center">人事资源管理系统</h2>

  <form action="${pageContext.request.contextPath}/loginServlet" method="post">
    <div class="form-group">
      <input type="text" class="form-control" placeholder="请输入用户名" autofocus="" name="e_num" required="" >
    </div>
    <div class="form-group">
      <input type="password" class="form-control" placeholder="请输入密码" name="e_name" required="">
    </div>

    <div class="checkbox">
      <div class="row">
      <div class="col-xs-1 "></div>
    <div class="col-xs-4 "><input type="checkbox">记住密码</div>

       <div class="col-xs-7"><label for="" style="color:red">${errorMsg}</label></div>
        
    </div>
    </div>


    <div class="row">
    <div class="col-xs-1 "></div>
      <div class="col-xs-10 ">
        <button  class="btn  btn-block" type="submit">登录</button>
      </div>
       <div class="col-xs-1 "></div>
    </div>
   
    

  </form>
</div>

</body>
</html>
