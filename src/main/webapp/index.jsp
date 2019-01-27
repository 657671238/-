<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登陆</title>
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
</head>
<body>
	<div id="secBody">
		<form action="#" method="post" id="loadForm">
			<div class="innerBody">
				<div class="tableTap">
					<h3 class="f1">赏金系统登陆</h3>
					<a href="registerpage.jsp" class="fr">注册账号</a>
				</div>
				<div class="tableItem">
					<i class="userHead"></i>
					<input type="text" name="userName" placeholder="用户名/手机号">    		
				</div>

				<div class="tableItem">
					<i class="userLock"></i>
					<input type="text" name="password" placeholder="密码">    		
				</div>
				<div class="tableAuto">
					<a class="autoMatic" href="#">
						<input type="checkbox" class="loadGiet" />
						自动登录
					</a>
					<div>
						<input type="submit" class="tableBtn" value="登录">
					</div>
				</div>
			</div>
		</form>

	</div>
</body>
</html>