<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
<head>
	<title></title>
	<style type="text/css">
		body{
			width: 100%;
			height: 100%;
		}
		#header{
			
		}
		#mainer{
			width: 100%;
			height: 650px;
		}
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 88%;
			height: 100%;
		}
	</style>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
		    	 <br/><h3 class="text-center"><strong>会员信息修改</strong></h3>
		 <form method="post" action="updateServlet" class="form">
			会员账号：<input type="text" name="phoneNumber" value="${user.phoneNumber}"> <br/>
			会员称呼：<input type="text" name="name" value="${user.name}"> <br/>
			会员学校：<input type="text" name="school" value="${user.school}"> <br/>
			出生年月：<input type="date" name="birth" value="${user.birth}"> <br/>
			<input type="submit" value="确认修改" class="btn"/>
			</form>
		</div>
	</div>
	
	<div id="footer"></div>
</body>
</html>