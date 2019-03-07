<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta charset="UTF-8">
	<title>注册</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
			width:600px;
			margin-top:100px;
		}
		.welcome{
			margin-top:80px;
			margin-bottom:30px;
		}
		.getyzm{
			margin-top:10px;
			margin-bottom:0px;
		}
		.index{
			float:right;
		}
	</style>

<script type="text/javascript">
	window.onload=function(){
		var phoneNumber="<%=request.getParameter("phoneNumber")%>";
		var message1 = "<%=request.getAttribute("message1") %>";
		if(phoneNumber=='null'){
		}
		else{
			document.getElementById("userName").value=phoneNumber;	
		}
		if(message1 != 'null'){
			if(message1 == "true"){
				alert("注册成功");
			}
			else{
				alert("已存在该账号");
			}
			window.location.href="registerpage.jsp";
		}
	};
	function smsService(){
		var phoneNumber=document.getElementById("userName").value;
	
		window.location.href="smsServlet?phoneNumber="+phoneNumber;
	};
	function check(){

		var message='<%=request.getAttribute("message")%>';
		var pwd=document.getElementById("password").value;
		var pwd0=document.getElementById("password0").value;
		var identify=document.getElementById("identify").value;
		if(identify != message){
			alert('验证码错误！');
			return false;
		}
		if(pwd != pwd0){
			alert('两次密码输入不一致！');
			return false;
		}
		
		document.getElementById("loadForm").submit();
	}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center welcome">注册新账号</h3>
		<form action="registerServlet" method="post"  class="form-horizontal loginform" role="form" id="loadForm">
			<div class="form-group">
				<label for="userName" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userName" placeholder="请输入手机号"
							onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')
							 name="userName">
				</div>
			</div>
			<div class="form-group">
				<label for="identify" class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="identify"
							placeholder="请输入手机收到的验证码">
				</div>
				<a class="col-sm-3 getyzm" onclick=smsService()>获取验证码</a>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password"
							placeholder="请输入密码" name="password">
				</div>
			</div>
			<div class="form-group">
				<label for="password0" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password0"
							placeholder="请确认密码" name="password0">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" onclick=check() >注册</button>
					 <a class="index" href="index.jsp">返回登陆</a>
				</div>
			</div>
		</form>

	</div>

</body>
</html>
