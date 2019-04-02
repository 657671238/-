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
			width: 100%;
			height: 100%;
		}
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
		#l-map{
			display:none;
			position: absolute;
  			left: 30px;
 			top: 70px;
 			height:500px;	
 			width:500px;
 			background-color:#ffffff;
 			z-index:9999;
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
   	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
   		<div id="l-map"></div>
   		
   		<div class="container_me">
		<h3 class="text-center welcome">任务详情</h3>
		<form action="requestTaskServlet" method="post" class="form-horizontal loginform" role="form">
			<div class="form-group">
				<label for="taskTitle_1" class="col-sm-2 control-label">发布时间</label>
				<div class="col-sm-10">
					<div class="form-control" id="taskTitle_1"
							 name="publishDate" readonly>${task.publishDate}</div>
				</div>
			</div>
			<div class="form-group">
				<label for= "taskTitle" class="col-sm-2 control-label">任务标题</label>
				<div class="col-sm-10">
					<div class="form-control" id="taskTitle_1"
							 name="publishDate" readonly>${task.taskTitle}</div>
				</div>
			</div>
			<div class="form-group">
				<label for="taskBody" class="col-sm-2 control-label">任务内容</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="taskBody" style="height:80px;"
							name="taskBody" placeholder="请输入任务内容" readonly>${task.taskBody}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="time_desc" class="col-sm-2 control-label">任务时间</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="time_desc" value="${task.time_desc}"
							name="time_desc" placeholder="请输入时间描述" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="needP_num" class="col-sm-2 control-label">所需人数</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="needP_num" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" value="${task.needP_num}"
							name="needP_num" placeholder="请输入需求人数" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="bounty" class="col-sm-2 control-label">任务赏金</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bounty" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" value="${task.bounty}"
							name="bounty" placeholder="请输入赏金数" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="suggestId" class="col-sm-2 control-label">任务地点</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="suggestId" value="${task.place}"
							name="place" placeholder="请根据提示选择地点" readonly>
					<input type="text" class="form-control" id="lng" style="display:none;" value="${task.lng}"
							name="lng">
					<input type="text" class="form-control" id="lat" style="display:none;" value="${task.lat}"
							name="lat">
					<input type="text" name="id" value="${task.id}" style="display:none;">
					<input type="text" name="state" value="${task.state}" style="display:none;">
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				</div>
			</div>
			<div style="display:none;">
				<input type="text" name="id" value="${task.id}" style="display:none;">
				<input type="text" name="phone" value="${task.pushPhone}" style="display:none;">
			
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">请求任务</button>
					<button type="button" class="btn btn-default" onclick="deltask()">联系发布者</button>
				</div>
			</div>
		</form>
	</div>

	</div>
<%-- 		<div class="iframe_right" >
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
		</div> --%>
</body>
</html>