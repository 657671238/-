<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
	<style type="text/css">
		.container_me {
			width:600px;
			padding-right: 15px;
 		    padding-left: 15px;
  			margin-right: auto;
  			margin-left: auto;
  			margin-top: 50px;
		}
		.welcome{
			margin-bottom:30px;
		}

	</style>

</head>
<body>

  	<%@ include file="mainpage.jsp" %>

	<div class="container_me">
		<h3 class="text-center welcome">会员信息中心</h3>
		<form action="loginServlet" method="post" class="form-horizontal loginform" role="form">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">会员账号</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							 name="phoneNumber" value="${user.phoneNumber}">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">会员昵称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							name="name" value="${user.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="school" class="col-sm-2 control-label">会员学校</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="school"
							name="school" value="${user.school}">
				</div>
			</div>
			<div class="form-group">
				<label for="year" class="col-sm-2 control-label">出生年月</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="year"
							name="birth" value="${user.birth}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">确认修改</button>
				</div>
			</div>
		</form>


<%-- 		<div class="iframe_right" >
		    	 <br/><h3 class="text-center"><strong>会员信息修改</strong></h3>
		 <form method="post" action="updateServlet" class="form">
			会员账号：<input type="text" name="phoneNumber" value="${user.phoneNumber}"> <br/>
			会员称呼：<input type="text" name="name" value="${user.name}"> <br/>
			会员学校：<input type="text" name="school" value="${user.school}"> <br/>
			出生年月：<input type="date" name="birth" value="${user.birth}"> <br/>
			<input type="submit" value="确认修改" class="btn"/>
			</form> --%>
	</div>

</body>
</html>