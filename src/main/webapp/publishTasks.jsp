<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布任务</title>
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
					<br>
			<center class="bt">发布任务</center>
			<br>
		 <form method="post" action="addTaskServlet" class="form">
			任务标题：<input type="text" name="taskTitle" > <br/>
			任务内容：<input type="text" name="taskBody" > <br/>
			任务赏金：<input type="text" name="bounty" > <br/>
			任务地点：<input type="text" name="place" > <br/>
			<input type="submit" value="确认发布" class="btn"/>
			</form>
		</div>
	</div>

	
	<div id="footer"></div>
</body>
</html>