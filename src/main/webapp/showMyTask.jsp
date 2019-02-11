<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的任务</title>
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
			height: 1000px;
		}
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 88%;
			height: 100%;
		}
	</style>
	<script type="text/javascript">
		function update(){
			alert("修改键位");
		};
		function deltask(){
			
		};
	</script>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
		    	 <br/><h3 class="text-center"><strong>查看我发布的任务</strong></h3>
		 <form method="post" action="#" class="form">
			任务编号：<input type="text" name="phoneNumber" value="${task.id}"> <br/>
			任务标题：<input type="text" name="name" value="${task.taskTitle}"> <br/>
			任务内容：<input type="text" name="school" value="${task.taskBody}"> <br/>
			发布日期：<input type="text" name="birth" value="${task.publishDate}"> <br/>
			<input type="submit" value="确认修改" class="btn" onclick=update() />
			<input type="submit" value="撤销任务" class="btn" onclick=deltask() />
			<div><input type="submit" value="查看请求人员" class="btn" onclick=update() /></div>
			</form>
		</div>
	</div>
	
	<div id="footer"></div>
</body>
</html>