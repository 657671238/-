<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看请求列表</title>
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
			height: 100%;
		}
		.iframe_right{
			/*float: left;*/
			background: #fcfcfc;
			width: 88%;
			height: 100%;
		}
	</style>
	<script>
		function find(){
			alert("find");
			window.location.href="showTaskServlet?taskId="+id;
		}
		function give(){
			alert("give");
			//window.location.href="showTaskServlet?taskId="+id;
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
			<center class="bt">请求列表</center>
			<ul>
				<!-- 新闻列表 ，静态HTML代码与动态代码混合编程-->
				<c:forEach items="${requestsList}" var="row">
					<li id="1" onclick="">
						<div>
							<div>任务编号：${row.taskId}</div>
							<div>请求人：${row.publishPhone}</div>
							<div>请求时间：${row.requestDate}</div>
							<div>请求状态：${row.state}</div>
						</div></li>
					<button onclick=find()>详细资料</button>
					<button onclick=give()>委派任务</button>
					<button onclick=chat()>打开聊天</button>
				</c:forEach>
			</ul>
		</div>
	</div>

	
	<div id="footer"></div>
</body>
</html>