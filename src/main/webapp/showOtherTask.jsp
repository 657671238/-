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
		<h3 class="text-center welcome">任务详情</h3>
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
					<button type="button" class="btn btn-default" onclick= "submitt(${task.state})">请求任务</button>
					<button type="button" class="btn btn-default" onclick="chatroom(${task.pushPhone})">联系发布者</button>
				</div>
			</div>
		</form>
	</div>

	</div>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IOq4Z8Vm45rpk0rdkind47dOHR7zAwAf"></script>
	
	<script type="text/javascript">
		function submitt(state){
			if(state==-1){
				alert("该任务正在进行中！");
			}
		}
		function chatroom(id){
			window.location.href="trytochatroomServlet?phone="+id;
		}
		//点击地理位置输入框时地图才出现
		$("#suggestId").focus(function() {
			$("#l-map").show();
			if($("#lng").val()!=null && $("#lng").val()!=""  ){
				map.centerAndZoom(new BMap.Point(center_lng,center_lat), 18);
				marker = new BMap.Marker(new BMap.Point(center_lng, center_lat)); // 创建点
				map.addOverlay(marker);
			}
			
		});
		$("#suggestId").blur(function(){
			$("#l-map").hide();
		});
		
		//地图使用的全局变量
		var map;
		var myValue;
		//初始化函数
		$(function(){

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

		})


	 	function  getpointName(lng,lat){
	 		console.log(lng+","+lat);
			$.ajax({
				
						type : "GET",
						//添加参数进行分页  查询
						url : "http://api.map.baidu.com/geocoder/v2/",
						data : {
							location : lat+","+lng,
							latest_admin:1,
							output:"json",
							ak: "IOq4Z8Vm45rpk0rdkind47dOHR7zAwAf"
						},
						dataType : "jsonp",
						success:function(data){
							if(data.status===0){
								console.log("数据请求成功");
								console.log(data.result.formatted_address);
								console.log(data.result.sematic_description);
								//实现地理位置的存储
								$("#suggestId").val(data.result.formatted_address+data.result.sematic_description);
							}
						},
						error : function(xhr, error, status) {
							console.log(error);
							//alert(error);
							//mylayer.showError(data.data);
						}
			})
			
		} 

		// 百度地图API功能
		function G(id) {
			return document.getElementById(id);
		}

		//设置放大后的新地图
		function setPlace() {
			map.clearOverlays(); //清除地图上所有覆盖物
			function myFun() {
				var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
				console.log(pp.lng + " " + pp.lat);
				//实现经纬度的存储
				$("#lng").val(pp.lng);
				$("#lat").val(pp.lat);
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp)); //添加标注
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
				onSearchComplete : myFun
			});
			local.search(myValue);
		}

	</script>
</body>
</html>