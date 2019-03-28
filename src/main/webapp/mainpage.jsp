<%@ page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/bootstrap.min.css">  
<style type="text/css">
#left_div {
	background: #fcfcfc;
	width: 300px;
	height: 1000px;
	float: left;
}
#right_top_login{
	position: absolute;
  	top: 18px;
  	right: 0px;
  	width: 85px;
  	height: 100px;

}
.dropdown-menu>li>a{
	padding:8px 20px;
}
</style>

<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
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
    <div class="collapse navbar-collapse" id="example-navbar-collapse" >
        <ul class="nav navbar-nav">
            <li class="li_1"><a href="myMessageServlet">会员信息</a></li>
            <li class="li_2"><a href="publishTasks.jsp">发布任务</a></li>
            <li class="li_3 dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    查看任务 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu drop_1">
                    <li><a href="selectableTasksServlet"  class="li_11">全部任务</a></li>
                    <li><a href="myTaskServlet" class="li_11">我的任务</a></li>
                    <li><a href="selectedTasksServlet"  class="li_11">已选任务</a></li>
                </ul>
            </li>
            <li><a href="getemailsServlet">消息列表</a></li>
        </ul>
    </div>
    </div>
</nav>
<div id= "right_top_login">
	<a href="index.jsp">退出登陆</a>
</div>