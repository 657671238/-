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
			width:500px;
  			margin-right: auto;
  			margin-left: auto;			
		}
	</style>

</head>
<body>
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
			<br>
			<h3 class="text-center">任务列表</h3>
			<ul class="list-group ulgroup">
				<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
				<c:forEach items="${tasklist}" var="row">
					<li id=${row.id} onclick="find(this.id)" class="list-group-item">
					<span class="badge">状态</span>
						<div>
							<div >标题：${row.taskTitle}</div>
							<div > 内容：${row.taskBody}</div>
							<div >发布者：${row.pushPhone}</div>
							<div >发布日期：${row.publishDate}</div>
							<div >任务状态：${row.state}</div>
							<div >任务赏金：${row.bounty}</div>
							<div style="display:none" value=${row.id}>${row.id}</div>
						</div></li>
				</c:forEach>
			</ul>
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