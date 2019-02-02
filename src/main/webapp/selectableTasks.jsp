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
		body{
			width: 100%;
			height: 100%;
		}
		#header{
			
		}
		#mainer{
			width: 100%;
			height: 650px;
		}
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 88%;
			height: 100%;
		}
	</style>
	<script>
		function find(id){
			//alert(id);
			window.location.href="showTaskServlet?taskId="+id;
		}
	</script>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
		<div class="iframe_right" >
			<br>
			<center class="bt">任务列表</center>
			<ul>
				<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
				<c:forEach items="${tasklist}" var="row">
					<li id=${row.id} onclick="find(this.id)">
						<div>
							<div>标题：${row.taskTitle}</div>
							<div>内容：${row.taskBody}</div>
							<div>发布者：${row.pushPhone}</div>
							<div>发布日期：${row.publishDate}</div>
							<div>任务状态：${row.state}</div>
							<div>任务赏金：${row.bounty}</div>
							<div style="display:none" value=${row.id}>${row.id}</div>
						</div></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	
	<div id="footer"></div>
</body>
</html>