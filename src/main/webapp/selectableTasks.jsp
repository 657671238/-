<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看可选任务</title>
<head>
	<title></title>
	<style type="text/css">
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 100%;
			height: 100%;
		}
		.ulgroup{
			width:800px;
  			margin-right: auto;
  			margin-left: auto;			
		}
		.connes1{
			padding-left:10px;
			background-color:#c8e1fa;
		}
		.conntainn{
			background-color:#c8e1fa;
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
		<div class="iframe_right" >
			<br>
			<h3 class="text-center" style="margin-top:0px;">任务列表</h3>
			<div class="ulgroup">
				<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
				<c:forEach items="${tasklist}" var="row">
				<div class="connes1">
					<div id=${row.id} onclick="find(this.id)" class="list-group conntainn">
						<div style="height:10px"></div>
						<div class="user_photo">
							<img src="/file/${row.photo}" style="height:70px;width:70px;">
						</div>
						<div style="float: right;margin-right:15px"><span class="badge">状态</span></div>
						<div class="username">${row.name}</div>
						<div class="date">${row.publishDate}</div>	
						<hr style=" height:2px;border:none;border-top:2px dashed  #185598;margin:10px;" />
						<div class="task_body">
							<div style="font-size:19px;">${row.taskTitle}:</div>
							&nbsp&nbsp&nbsp&nbsp&nbsp${row.taskBody}
						</div>
						<hr style=" height:2px;border:none;border-top:2px dashed  #185598;margin:10px;" />
						<div class="place">
							<img src="./img/where.png" style="height:20px;width:20px;">
							任务地点：${row.place}
						</div>
						<div class="time">
							<img src="./img/when.png" style="height:20px;width:20px;">
							任务时间：${row.time_desc}
						</div>
						<div class="money">
							<img src="./img/money.png" style="height:20px;width:20px;">
							任务赏金：${row.bounty}
						</div>
						
<%-- 						<span class="badge">状态</span>
						<div>
							<div >标题：${row.taskTitle}</div>
							<div > 内容：${row.taskBody}</div>
							<div >发布者：${row.pushPhone}</div>
							<div >发布日期：${row.publishDate}</div>
							<div >任务状态：${row.state}</div>
							<div >任务赏金：${row.bounty}</div>
							<div >任务地点：${row.place}</div>
							<div >经度：${row.lng}</div>
							<div >纬度：${row.lat}</div>
							<div >需求人数：${row.needP_num}</div>
							<div >时间描述：${row.time_desc}</div>
							<div>姓名：${row.name}</div>
							<div>图片：${row.photo}</div>
							<div style="display:none" value=${row.id}>${row.id}</div>
						</div> --%>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>

</body>
	<script type="text/javascript">
			//添加导航栏选中事件
			$("li.active").removeClass("active");
			$(".li_3").addClass("active");
		function find(id){
			//alert(id);
			window.location.href="showTaskServlet?taskId="+id;
		}
	</script>
</html>