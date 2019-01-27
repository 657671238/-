<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta charset="UTF-8">
	<title>注册</title>
	<style type="text/css">
	#secBody{
		padding-top: 26px;
		background: #fcfcfc;
		padding-bottom: 30px;
	}
	.innerBody{
		width: 330px;
		padding-top: 50px;
		margin: 0 auto;
	}
	.tableTap{

	}
	.tableTap h3{
		font-size: 14px;
		color: #666;
		font-weight: bold;
		line-height: 30px;
	}   
</style>

<script type="text/javascript">
	window.onload=function(){
		var phoneNumber="<%=request.getParameter("phoneNumber")%>";
		if(phoneNumber=='null'){
			document.getElementById("userName").value="";	
			console.log(phoneNumber);
		}
		else{
				
			document.getElementById("userName").value=phoneNumber;	
			console.log(phoneNumber+"123");

		}
	};
	function smsService(){
		var phoneNumber=document.getElementById("userName").value;
		alert(phoneNumber);
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
	<div id="secBody">
		<form action="loginServlet" method="post" id="loadForm">
			<div class="innerBody">
				<div class="tableTap">
					<h3 class="f1">注册新用户</h3>
				</div>
				<div class="tableItem">
					<i class="userHead"></i>
					<input type="text" id="userName" name="userName" placeholder="手机号" 
					 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
					<b class="setButton" onclick=smsService()>获取验证码</b>    		
				</div>

				<div class="tableItem">
					<i class="userLock"></i>
					<input type="text" id="identify" name="identify" placeholder="请输入验证码">    		
				</div>
				<div class="tableItem">
					<i class="userLock"></i>
					<input id="password" type="text" name="password" placeholder="请输入密码">    		
				</div>
				<div class="tableItem">
					<i class="userLock"></i>
					<input id="password0" type="text" name="password0" placeholder="确认密码">    		
				</div>
				<div class="registerButton">
					<input type="button" value="确认注册" onclick=check()>	
				</div>
			</div>
		</form>

	</div>

</body>
</html>
