<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
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
   	<%@ include file="mainpage.jsp" %>

	<div id="l-map"></div>
	
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
					<textarea class="form-control" id="taskBody" style="height:80px;"
							name="taskBody" placeholder="请输入任务内容"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="needP_num" class="col-sm-2 control-label">所需人数</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="needP_num" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"
							name="needP_num" placeholder="请输入需求人数">
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
				<label for="suggestId" class="col-sm-2 control-label">任务地点</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="suggestId"
							name="place" placeholder="请根据提示选择地点">
					<input type="text" class="form-control" id="lng" style="display:none;"
							name="lag">
					<input type="text" class="form-control" id="lat" style="display:none;"
							name="lat">
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IOq4Z8Vm45rpk0rdkind47dOHR7zAwAf"></script>
	<script type="text/javascript">
		//地图使用的全局变量
		var map;
		var myValue;
		//初始化函数
		$(function(){
			//添加导航栏选中事件
			$("li.active").removeClass("active");
			$(".li_2").addClass("active");
			
			//点击地理位置输入框时地图才出现
			$("#suggestId").focus(function() {
				$("#l-map").show();
			});
/* 			$("#suggestId").blur(function() {
				$("#l-map").hide();
			}); */
			
			
			// 初始化地图,设置城市和地图级别。
			map = new BMap.Map("l-map");
			map.centerAndZoom(new BMap.Point(114.160676,30.671784), 12);
			
			//设置鼠标滚动事件
			map.enableScrollWheelZoom(true);
			
			//地图点击调用
			map.addEventListener("click", showInfo);
			 
			
			//建立一个自动完成的对象
			var ac = new BMap.Autocomplete(
					{
						"input" : "suggestId",
						"location" : map
					});
			
			ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
				var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province + _value.city + _value.district
							+ _value.street + _value.business;
				}
				str = "FromItem<br />index = " + e.fromitem.index
						+ "<br />value = " + value;

				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province + _value.city + _value.district
							+ _value.street + _value.business;
				}
				str += "<br />ToItem<br />index = " + e.toitem.index
						+ "<br />value = " + value;
				G("searchResultPanel").innerHTML = str;
			});


			ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
				var _value = e.item.value;
				myValue = _value.province + _value.city + _value.district
						+ _value.street + _value.business;
				G("searchResultPanel").innerHTML = "onconfirm<br />index = "
						+ e.item.index + "<br />myValue = " + myValue;

				setPlace();
			});
			
		})
	
		//地图点击事件
		function showInfo(e) {
			alert(e.point.lng + ", " + e.point.lat);
			//实现经纬度的存储
			$("#lng").val(e.point.lng);
			$("#lat").val(e.point.lat);
			map.centerAndZoom(new BMap.Point(e.point.lng, e.point.lat), 18);
			map.clearOverlays(); //清除地图上所有覆盖物
			marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)); // 创建点
			map.addOverlay(marker);
			getpointName(e.point.lng, e.point.lat);
		}
		//实现通过经纬度坐标获取地址描述
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
</html>