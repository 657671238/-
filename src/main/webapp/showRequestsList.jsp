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
		function find(id){
			alert("find");
			window.location.href="showTaskServlet?taskId="+id;
		}
		function give(){
			alert("give");
			//window.location.href="showTaskServlet?taskId="+id;
		}
		function chat(id){
			//alert("chat");
			window.location.href="trytochatroomServlet?phone="+id;
		}
	</script>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="mainer">
   		<%@ include file="mainpage.jsp" %>
   		
   		<div class="container">
 		<h2 class="text-center">任务请求人员</h2>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" id="category">
					</ul>
					<ul class="nav navbar-nav navbar-left" style="margin-left:10px;line-height:50px;">
						<li><a class="" href="javascript:history.back()"> <--返回 </a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<div class="row" id="noContent" style="display:none;height:200px;">
			
		</div>
		<div class="row" id="contentPanel" style="dispaly:none">
			<div class="col-md-12">
				<table class="table table-bordered" id="content">
				<tr>
				    <th><input id='selectAll' type='checkbox'>全选</th>
					<th>任务ID</th>
					<th>请求人ID</th>
					<th>请求人姓名</th>
					<th>请求人学校</th>
					<th>请求时间</th>
					<th>操作</th>
					<c:forEach items="${requestsList}" var="row">
						<tr>
							<td><input name='selectOne' type='checkbox'></td>
							<td>${row.taskId}</td>
							<td>${row.publishPhone}</td>
							<td>${row.name}</td>
							<td>${row.school}</td>
							<td>${row.requestDate}</td>
							<td><a href="trytochatroomServlet?phone=${row.publishPhone}">联系该请求人</a></td>
						</tr>
					</c:forEach>
				</tr>
				</table>
				<div id="cart-footer">
	                <div class="text-right" style="font-size:15px">
	                    <span>总共选中了<span id="totalCount">0</span>位请求人员</span>
	                    <span>总计需要: <span id="totalPrice">0</span>位请求人员<span>
	                    <button class="btn btn-danger btn-lg" id="submitOrder">确认委派</button>
	                </div>
            	</div>
			</div>
		</div>
	</div>
<%-- 		<div class="iframe_right" >
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
					<button onclick="find(${row.publishPhone })">详细资料</button>
					<button onclick=give()>委派任务</button> 
					<button onclick="chat(${row.publishPhone })">打开聊天</button>
				</c:forEach>
			</ul>
		</div> --%>
	</div>

	
	<div id="footer"></div>
</body>
</html>