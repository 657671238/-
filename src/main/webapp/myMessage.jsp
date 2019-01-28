<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
		background: #fcfcfc;
	}
</style>
</head>
<body>
    <div class="main">
    	 <br/><h3 class="text-center"><strong>会员信息修改</strong></h3>
		 <form method="post" action="UpdateServlet" class="form">
			会员密码：<input type="password" name="password" value="${user.password}"> <br/>
			会员真名：<input type="text" name="realname" value="${user.realname}"> <br/>
			手机号码：<input type="text" name="mobile" value="${user.mobile}"> <br/>
			会员年龄：<input type="text" name="age" value="${user.age}"> <br/>
			<input type="submit" value="提交" class="btn"/>
			</form>
	</div>
</body>
</html>