<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		#left_div{
			background: #fcfcfc;
			width: 10%;
			height: 650px;
			float: left;
		}
		.iframe_right{
			/*float: left;*/
			background: #111111;
			width: 88%;
			height: 100%;
		}
	</style>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="mainer">
		<div id="left_div">
			<ul>
				<li><a href="myMessage.jsp" target="iframeName">我的信息</a></li>
				<li><a href="#" target="iframeName">可选任务</a></li>
				<li><a href="#" target="iframeName">发布任务</a></li>
			</ul>
		</div>
		<iframe src="myMessage.jsp" name="iframeName" 
		class="iframe_right" frameborder="no">
		</iframe>
	</div>

	
	<div id="footer"></div>
</body>
</html>