<%@page import="bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<User> user = (List<User>)request.getAttribute("users");
	int success=1;
	for(User u : user){
		if(u.getState().equals("0")){
			success=0;
		}
	}
%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>我的任务</title>
<head>
	<title></title>
	<style type="text/css">
		body{
			width: 100%;
			height: 100%;
		}
		#mainer{
			width: 50%;
			height: 1000px;
			float: left;
		}
		#left_mainer{
			width: 50%;
			height: 1000px;
			float: right;
			/* background-color: red; */
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
				.connes1{
			padding-left:10px;
			background-color:#befdff;
			padding-right:20px;
		}
		.conntainn{
			/* background-color:#c8e1fa; */
		}
		.user_photo{
			width: 70px;
  		    height: 70px;
    		float: left;
    		margin-right: 12px;
    		border-radius:100%;
    		overflow:hidden;
		}
		.username{
			padding-top:5px;
			margin-bottom:10px;
			font-size:20px;
		}
		.date{
			font-size:15px;
			padding-bottom:15px;
		}
		.task_body{
			font-size:17px;
			margin-left:10px;
			margin-top:10px;
			margin-bottom:10px;
		}
		.place{
			margin-bottom:5px;
		}
		.time{
			margin-bottom:5px;
		}
		.money{
			margin-bottom:5px;
		}
	</style>

</head>
<body>
	<%@ include file="mainpage.jsp" %>
<div id="mainer">
   
   		
   	<div class="container_me">
		<h3 class="text-center welcome">编辑任务</h3>
		<form action="updateTaskServlet" method="post" class="form-horizontal loginform" role="form">
			<div class="form-group">
				<label for="taskTitle_1" class="col-sm-2 control-label">发布时间</label>
				<div class="col-sm-10">
					<div class="form-control" id="taskTitle_1"
							 name="publishDate" >${task.publishDate}</div>
				</div>
			</div>
			<div class="form-group">
				<label for="taskTitle" class="col-sm-2 control-label">任务标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="taskTitle" value="${task.taskTitle}"
							 name="taskTitle" placeholder="请输入任务标题">
				</div>
			</div>
			<div class="form-group">
				<label for="taskBody" class="col-sm-2 control-label">任务内容</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="taskBody" style="height:80px;"
							name="taskBody" placeholder="请输入任务内容">${task.taskBody}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="time_desc" class="col-sm-2 control-label">任务时间</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="time_desc" value="${task.time_desc}"
							name="time_desc" placeholder="请输入时间描述">
				</div>
			</div>
			<div class="form-group">
				<label for="needP_num" class="col-sm-2 control-label">所需人数</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="needP_num" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" value="${task.needP_num}"
							name="needP_num" placeholder="请输入需求人数">
				</div>
			</div>
			<div class="form-group">
				<label for="bounty" class="col-sm-2 control-label">任务赏金</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="bounty" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" value="${task.bounty}"
							name="bounty" placeholder="请输入赏金数">
				</div>
			</div>
			<div class="form-group">
				<label for="suggestId" class="col-sm-2 control-label">任务地点</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="suggestId" value="${task.place}"
							name="place" placeholder="请根据提示选择地点">
					<input type="text" class="form-control" id="lng" style="display:none;" value="${task.lng}"
							name="lng">
					<input type="text" class="form-control" id="lat" style="display:none;" value="${task.lat}"
							name="lat">
					<input type="text" name="id" value="${task.id}" style="display:none;">
					<input type="text" name="state" value="${task.state}" style="display:none;">
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-info" onclick="finishtask()">完成验收</button>
<!-- 					<button type="submit" class="btn btn-info">确认修改</button>
					<button type="button" class="btn btn-info" onclick="deltask()">撤销任务</button>
					<button type="button" class="btn btn-info" onclick="update()">委派任务</button> -->
				</div>
			</div>
		</form>
	</div>

</div>
<div id="left_mainer">
		<div class="container_me">
			<br>
			<h3 class="text-center" style="margin-top: -18px;margin-bottom:30px;">请求人员</h3>
			<div class="ulgroup">
				<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
				<c:forEach items="${users}" var="row">
					<div class="connes1" id=${row.phoneNumber} onclick="find(this.id)">
					<div class="list-group conntainn">
						<div style="height:10px"></div>
						<div class="user_photo">
							<img src="/file/${row.image}" style="height:70px;width:70px;">
						</div>
						<div style="float: right;margin-right:15px"><span class="badge">
						<font size="2" color="">完成状态:${row.state}</font></span></div>
						<div class="username"><font size="5" >${row.name}</font>
						<font size="2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请求时间:${row.date}</font></div>
						<div class="date">学校:<font size="4" >${row.school}</font></div>	
					</div>
				</div>
				</c:forEach>
			</div>
		</div>


	</div>
</body>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IOq4Z8Vm45rpk0rdkind47dOHR7zAwAf"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function find(id){
			window.location.href="trytochatroomServlet?phone="+id;
		}

		function update(){
			//alert("查看请求人员");
			window.location.href="showRequestPersonServlet?taskId="+${task.id};
		};
		function finishtask(){
			var success = '<%=success%>';
			console.log(success);
			if(success=='0'){
				alert("所有委派人员完成任务后才能执行此操作！");
			}else{
				layer.open({
					  title:"提示信息",
					  content: '确认任务完成？'
					  ,btn: ['取消', '确认完成']
					  ,yes: function(index, layero){
						  layer.close(index);
					    //按钮【按钮一】的回调
					  }
					  ,btn2: function(index, layero){
					    //按钮【按钮二】的回调
					  /*   window.location.href="delTaskServlet?taskId="+${task.id}; */
					    //return false 开启该代码可禁止点击该按钮关闭
					  }
					  ,cancel: function(){ 
					    //右上角关闭回调
					    
					    //return false 开启该代码可禁止点击该按钮关闭
					  }
					});
			}
			
		};
	</script>
</html>