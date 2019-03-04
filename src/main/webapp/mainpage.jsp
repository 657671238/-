<%@ page language="java" pageEncoding="UTF-8"%>
<style type="text/css">
#left_div {
	background: #fcfcfc;
	width: 300px;
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
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <div id="left_div">
	<ul>
		<li><a href="myMessageServlet">我的信息</a></li>
		<li><a href="selectableTasksServlet">可选任务</a></li>
		<li><a href="myTaskServlet">我的任务</a></li>
		<li><a href="selectedTasksServlet">已选任务</a></li>
		<li><a href="publishTasks.jsp">发布任务</a></li>
	</ul>
</div> -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid"> 
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">任务菜单</a>
    </div>
    <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="myMessageServlet">会员信息</a></li>
            <li><a href="publishTasks.jsp">发布任务</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    查看任务 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="selectableTasksServlet">全部任务</a></li>
                    <li class="divider"></li>
                    <li><a href="myTaskServlet">我的任务</a></li>
                    <li class="divider"></li>
                    <li><a href="selectedTasksServlet">已选任务</a></li>
                </ul>
            </li>
        </ul>
    </div>
    </div>
</nav>
<div id= "right_top_login">
	<a href="index.jsp">退出登陆</a>
</div>