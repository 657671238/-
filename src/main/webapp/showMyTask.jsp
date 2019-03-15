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
		#mainer{
			width: 100%;
			height: 1000px;
		}
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 100%;
			height: 100%;
		}
	</style>
	<script type="text/javascript">
		function update(){
			alert("查看请求人员");
			window.location.href="showRequestPersonServlet?taskId="+${task.id};
		};
		function deltask(){
			alert("确认撤销任务");
			window.location.href="delTaskServlet?taskId="+${task.id};
		};
	</script>
</head>
<body>
	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
		    	 <br/><h3 class="text-center"><strong>查看我发布的任务</strong></h3>
		 <form method="post" action="updateTaskServlet" class="form">
			任务编号：<input type="text" onfocus=this.blur() name="id" value="${task.id}"> <br/>
			发布日期：<input type="text" onfocus=this.blur() name="date" value="${task.publishDate}"> <br/>
			任务状态：<input type="text" onfocus=this.blur() name="state" value="${task.state}"> <br/>
			任务标题：<input type="text" name="title" value="${task.taskTitle}"> <br/>
			任务内容：<input type="text" name="body" value="${task.taskBody}"> <br/>
			任务赏金：<input type="text" name="bounty" value="${task.bounty}"> <br/>
            <input type="submit" value="确认修改" class="btn"  />
		</form>
		<div><button type="submit" value="查看请求人员" class="btn" onclick=update()>查看请求人员</button></div>
		<button  value="撤销任务" class="btn" onclick=deltask()>撤销任务</button>
		</div>
	</div>
</body>
</html>