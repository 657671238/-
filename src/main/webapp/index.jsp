<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登陆</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
			width:500px;
			margin-top:100px;
		}
		.welcome{
			margin-top:80px;
			margin-bottom:30px;
		}
		.register{
			float:right;
		}
	</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center welcome">欢迎来到赏金任务系统</h3>
		<form action="loginServlet" method="post" class="form-horizontal loginform" role="form">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							placeholder="请输入用户名" name="userName">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="lastname"
							placeholder="请输入密码" name="password">
				</div>
			</div>
			  <div class="form-group">
    			<div class="col-sm-offset-2 col-sm-10">
    				  <div class="checkbox">
        				<label>
       			 			  <input type="checkbox">记住密码
      					  </label>
      					  <a class="register" href="registerpage.jsp"> 注册账号</a>
    					  </div>
  					  </div>
 				 </div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">登录</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){	
			var message = "<%=request.getAttribute("message")%>";
			console.log(message);
			if(message=="true"){
				window.location.href="myMessageServlet";
			}else if(message=="false"){
				alert("账号密码输入错误");
			}
		});
	</script>
</body>
</html>