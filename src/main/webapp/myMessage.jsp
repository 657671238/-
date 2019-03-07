<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
	<style type="text/css">
		.container_me {
			width:600px;
			padding-right: 15px;
 		    padding-left: 15px;
  			margin-right: auto;
  			margin-left: auto;
  			margin-top: 50px;
		}
		.welcome{
			margin-bottom:30px;
		}

	</style>

</head>
<body>

  	<%@ include file="mainpage.jsp" %>

	<div class="container_me">
		<h3 class="text-center welcome">会员信息中心</h3>
		<form action="updateServlet" method="post" class="form-horizontal loginform" role="form" enctype="multipart/form-data">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">会员账号</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							 name="phoneNumber" value="${user.phoneNumber}">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">会员昵称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							name="name" value="${user.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="school" class="col-sm-2 control-label">会员学校</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="school"
							name="school" value="${user.school}">
				</div>
			</div>
			<div class="form-group">
				<label for="year" class="col-sm-2 control-label">出生年月</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="year"
							name="birth" value="${user.birth}">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_image" class="col-sm-2 control-label">我的头像</label>
				<div class="col-sm-10">	
						<img id="pro_image" style="width:180px" alt="暂无图片"/>
						<input type="hidden" id="original_image" name="image" value="${user.image}">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_image" class="col-sm-2 control-label">上传图片:</label>
				<div class="col-sm-10">
						<input type="file" accept=".jpg,.png,.jpeg,.gif" name="upload" id="uploadFile" onchange="loadImage()"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-info" >确认修改</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
			//当file控件  选中一张图片的时候  就会触发这个方法  这个方法可以将上面的图片换掉
			$(function(){
				 $("#pro_image").attr('src',"/file/"+"${user.image}");
			})
			var oldImage = null;
			function loadImage(){
				//get(0) 是将JQuery对象  转换为DOM对象
				//document.getElementById("uploadFile");
				var upload = $("#uploadFile").get(0);
				console.dir(upload);
				//表示至少选中了一张图片信息
				if(upload.files.length>0){
					var file = upload.files[0];
					var read = new FileReader();
					read.readAsDataURL(file);
					read.onloadend = function(){
						$("#pro_image").attr("src",read.result);	
					}
				}else{
					console.log("用户没有选中图片")
					$("#pro_image").attr("src",oldImage);
				}
			}
			
	</script>
</body>
</html>