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

</head>
<body>
   	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
   		<div id="l-map"></div>
   		
   		<div class="container_me">
		<h3 class="text-center welcome">任务详情&nbsp&nbsp&nbsp&nbsp<font size="3" color="red">任务状态：${task.state}</font></h3>
		<form action="requestTaskServlet" id="form_f" method="post" class="form-horizontal loginform" role="form">
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
					<button type="button" class="btn btn-info" onclick= "submitt(${task.id})">提交任务</button>
					<button type="button" class="btn btn-info" onclick= "cancel(${task.state},${task.pushPhone},${task.id})">撤销请求</button>
					<button type="button" class="btn btn-info" onclick="chatroom(${task.pushPhone})">联系发布者</button>
				</div>
			</div>
		</form>
	</div>

	</div>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IOq4Z8Vm45rpk0rdkind47dOHR7zAwAf"></script>
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript">
	
		//地图使用的全局变量
		var map;
		var myValue;
		function submitt(id){
			//此处应该有任务发布状态，是否请求成功 ，请求成功后才可以提交
			layer.open({
				  title:"请完成任务后进行提交",
				  content: '确认提交任务？'
				  ,btn: ['取消', '确认完成']
				  ,yes: function(index, layero){
					  alert("该任务正在进行中！");
					  layer.close(index);
				    //按钮【按钮一】的回调
				  }
				  ,btn2: function(index, layero){
					  alert("该任务正在进行中！111");
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
		
		function cancel(state,phone,id){
			if(state==-1){
				alert("该任务正在进行中！");
			}
			if(state==-2){
				alert("该任务已完成！");
			}
			//撤销任务逻辑
			if(state>0){
				window.location.href="requestTaskServlet?phone="+phone+"&&id="+id;
			}
		}
		
		function chatroom(id){
			window.location.href="trytochatroomServlet?phone="+id;
		}

		$("#suggestId").blur(function(){
			$("#l-map").hide();
		});
		

		//初始化函数
		$(function(){

			//点击地理位置输入框时地图才出现
			$("#suggestId").focus(function() {
				$("#l-map").show();
				// 初始化地图,设置城市和地图级别。
				map = new BMap.Map("l-map");
				
				var center_lng = $("#lng").val();
				var center_lat = $("#lat").val();
				if($("#lng").val()==null || $("#lng").val()==""  ){
					map.centerAndZoom(new BMap.Point(114.160676,30.671784), 12);
				}
				else{ 
					map.centerAndZoom(new BMap.Point(center_lng,center_lat), 18);
					marker = new BMap.Marker(new BMap.Point(center_lng, center_lat)); // 创建点
					map.addOverlay(marker);
				} 
				//设置鼠标滚动事件
				map.enableScrollWheelZoom(true);
			});

		})


	</script>
</body>
</html>