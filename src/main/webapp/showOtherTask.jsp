<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>可选任务</title>
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
			width: 88%;
			height: 100%;
		}
	</style>
	<script type="text/javascript">
		function update(){
			alert("修改键位");
		};
		function deltask(){
			alert("确认撤销任务");
			window.location.href="delTaskServlet?taskId="+${task.id};
		};
		function chatroom(id){
			window.location.href="trytochatroomServlet?phone="+id;
		}
	</script>
</head>
<body>
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
		    	 <br/><h3 class="text-center"><strong>查看此任务</strong></h3>
		 <form method="post" action="requestTaskServlet" class="form">
			任务编号：<input type="text" onfocus=this.blur() name="id" value="${task.id}"> <br/>
			发布人ID：<input type="text" onfocus=this.blur() name="phone" value="${task.pushPhone}"> <br/>
			发布日期：<input type="text" onfocus=this.blur() name="date" value="${task.publishDate}"> <br/>
			任务状态：<input type="text" onfocus=this.blur() name="state" value="${task.state}"> <br/>
			任务标题：<input type="text" onfocus=this.blur() name="title" value="${task.taskTitle}"> <br/>
			任务内容：<input type="text" onfocus=this.blur() name="body" value="${task.taskBody}"> <br/>
			任务赏金：<input type="text" onfocus=this.blur() name="bounty" value="${task.bounty}"> <br/>
            <input type="submit" value="请求此任务" class="btn"  />
            
		</form>
			<button onclick=chatroom(${task.pushPhone})>打开聊天</button>
		</div>
</body>
</html>