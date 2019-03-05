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
   	
<%-- 		<div class="iframe_right" >
			<center class="bt">发布任务</center>
		 <form method="post" action="addTaskServlet" class="form">
			任务标题：<input type="text" name="taskTitle" > <br/>
			任务内容：<input type="text" name="taskBody" > <br/>
			任务赏金：<input type="text" name="bounty" > <br/>
			任务地点：<input type="text" name="place" > <br/>
			<input type="submit" value="确认发布" class="btn"/>
			</form>
		</div>
	</div> --%>
	
	<div class="container_me">
		<h3 class="text-center welcome">发布任务</h3>
		<form action="addTaskServlet" method="post" class="form-horizontal loginform" role="form">
			<div class="form-group">
				<label for="taskTitle" class="col-sm-2 control-label">任务标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="taskTitle"
							 name="taskTitle" placeholder="请输入任务标题">
				</div>
			</div>
			<div class="form-group">
				<label for="taskBody" class="col-sm-2 control-label">任务内容</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="taskBody"
							name="taskBody" placeholder="请输入任务内容">
				</div>
			</div>
			<div class="form-group">
				<label for="bounty" class="col-sm-2 control-label">任务赏金</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bounty"
							name="bounty" placeholder="请输入赏金数">
				</div>
			</div>
			<div class="form-group">
				<label for="place" class="col-sm-2 control-label">任务地点</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="place"
							name="place" placeholder="请输入任务地点">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">确认发布</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>