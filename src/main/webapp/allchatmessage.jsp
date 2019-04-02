<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
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
			/* background-color:#c8e1fa; */
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

	<%@ include file="mainpage.jsp"%>
	<div class="iframe_right">
		<br>
		<h3 class="text-center" style="margin-top: 0px;">消息列表</h3>
		<div class="ulgroup">
			<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
			<c:forEach items="${erlist}" var="row">
				<div class="connes1">
					<div id=${row.otherId} onclick="find(this.id)"
						class="list-group conntainn">
						<div style="height:10px"></div>
						<div class="user_photo">
							<img src="/file/${row.image}" style="height:70px;width:70px;">
						</div>
						<div style="float: right;margin-right:15px"><span class="badge">
						<font size="2" color="">未读消息条数:${row.noread}</font></span></div>
						<div class="username"><font size="5" >${row.othername}</font>
						<font size="2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${row.messageDate}</font></div>
						<div class="date"><font size="5" color="red">${row.lastmessage}</font></div>	
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script src="js/jquery.js" type="text/javascript"></script>
  	<script src="js/school.js" type="text/javascript"></script>
	<script type="text/javascript">
			//添加导航栏选中事件
			$("li.active").removeClass("active");
			$(".li_4").addClass("active");
			function find(id){
				window.location.href="trytochatroomServlet?phone="+id;
			}

	</script>
</body>
</html>