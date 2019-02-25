<%@ page language="java" pageEncoding="UTF-8"%>
<style type="text/css">
#left_div {
	background: #fcfcfc;
	width: 200px;
	height: 1000px;
	float: left;
}
#right_top_login{
	position: absolute;
  	top: 10px;
  	right: 10px;
  	width: 100px;
  	height: 100px;

}


</style>


<div id="left_div">
	<ul>
		<li><a href="myMessageServlet">我的信息</a></li>
		<li><a href="selectableTasksServlet">可选任务</a></li>
		<li><a href="publishTasks.jsp">发布任务</a></li>
		<li><a href="selectedTasksServlet">已选任务</a></li>
	</ul>
</div>
<div id= "right_top_login">
	<a href="index.jsp">退出登陆</a>
</div>