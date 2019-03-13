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
	#choose-box-wrapper{
		width: 652px;
		filter:alpha(opacity=50);
		padding:10px;
		border-radius:5px;
		display:none;
	}
	#choose-box{
		border: 1px solid #005EAC;
		width:650px;
		background-color:white;
	}
	#choose-box-title{
		background:#3777BC;
		color: white;
		padding: 4px 10px 5px;
		font-size: 14px;
		font-weight: 700;
		margin: 0;
	}
	#choose-box-title span{
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
	}

	#choose-a-province, #choose-a-school{
		margin:5px 8px 10px 8px;
		border: 1px solid #C3C3C3;
	}
	#choose-a-province a{
		display:inline-block;
		height: 18px;
		line-height: 18px;
		color:#005EAC;
		text-decoration: none;
		font-size: 9pt;
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
		margin:2px 5px;
		padding: 1px;
		text-align: center;
	}
	#choose-a-province a:hover{
		text-decoration:underline;
		cursor:pointer;
	}
	#choose-a-province .choosen{
		background-color: #005EAC;
		color:white;
	}
	
	#choose-a-school{
		overflow-x: hidden;
		overflow-y: auto;
		height: 200px;
	}
	#choose-a-school a{
		height: 18px;
		line-height: 18px;
		color:#005EAC;
		text-decoration: none;
		font-size: 9pt;
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
		float: left;
		width: 160px;
		margin: 4px 12px;
		padding-left:10px;
		background:url(img/2012072500060712.gif) no-repeat 0 9px;
	}
	#choose-a-school a:hover{
		background-color:#005EAC;
		color:white;
		cursor:pointer;
	}
	
	#choose-box-bottom{
		background: #F0F5F8;
		padding: 8px;
		text-align: right;
		border-top: 1px solid #CCC;
		height:40px;
	}
	#choose-box-bottom input{
		vertical-align: middle;
		text-align: center;
		background-color:#005EAC;
		color:white;
		border-top: 1px solid #B8D4E8;
		border-left: 1px solid #B8D4E8;
		border-right: 1px solid #114680;
		border-bottom: 1px solid #114680;
		cursor: pointer;
		width: 60px;
		height: 25px;
		margin-top: 6px;
		margin-right: 6px;
	}
	</style>

</head>
<body>

  	<%@ include file="mainpage.jsp" %>

	<div class="container_me">
		<h3 class="text-center welcome">学生信息中心</h3>
		<form action="updateServlet" method="post" class="form-horizontal loginform" role="form" enctype="multipart/form-data">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">学生账号</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"  readonly="readonly"
							 name="phoneNumber" value="${user.phoneNumber}">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">学生姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
							name="name" value="${user.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="school" class="col-sm-2 control-label">所属高校</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="school" onclick="pop()" autocomplete="off"
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
						<img id="pro_image" style="width:100px;height:100px;" alt="暂无图片"/>
						<input type="hidden" id="original_image" name="image" value="${user.image}">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_image" class="col-sm-2 control-label">更新头像:</label>
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
	
	<!-- 	学校输入提示框 -->
	<div id="choose-box-wrapper">
	  <div id="choose-box">
		<div id="choose-box-title">
			<span>选择学校</span>
		</div>
		<div id="choose-a-province">
		</div>
		<div id="choose-a-school">
		</div>
		<div id="choose-box-bottom">
			<input type="botton" onclick="hide()" value="关闭" />
		</div>
	  </div>
	</div>
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script src="js/jquery.js" type="text/javascript"></script>
  	<script src="js/school.js" type="text/javascript"></script>
	<script type="text/javascript">
			//当file控件  选中一张图片的时候  就会触发这个方法  这个方法可以将上面的图片换掉
			$(function(){
				 $("#pro_image").attr('src',"/file/"+"${user.image}");
			})
			var oldImage = "/file/"+"${user.image}";
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
			function pop(){
				//将窗口居中
				makeCenter();

				//初始化省份列表
				initProvince();

				//默认情况下, 给第一个省份添加choosen样式
				$('[province-id="1"]').addClass('choosen');

				//初始化大学列表
				initSchool(1);
			}
			//隐藏窗口
			function hide()
			{
				$('#choose-box-wrapper').css("display","none");
			}

			function initProvince()
			{
				//原先的省份列表清空
				$('#choose-a-province').html('');
				for(i=0;i<schoolList.length;i++)
				{
					$('#choose-a-province').append('<a class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
				}
				//添加省份列表项的click事件
				$('.province-item').bind('click', function(){
						var item=$(this);
						var province = item.attr('province-id');
						var choosenItem = item.parent().find('.choosen');
						if(choosenItem)
							$(choosenItem).removeClass('choosen');
						item.addClass('choosen');
						//更新大学列表
						initSchool(province);
					}
				);
			}

			function initSchool(provinceID)
			{
				//原先的学校列表清空
				$('#choose-a-school').html('');
				var schools = schoolList[provinceID-1].school;
				for(i=0;i<schools.length;i++)
				{
					$('#choose-a-school').append('<a class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
				}
				//添加大学列表项的click事件
				$('.school-item').bind('click', function(){
						var item=$(this);
						var school = item.attr('school-id');
						//更新选择大学文本框中的值
						$('#school').val(item.text());
						//关闭弹窗
						hide();
					}
				);
			}

			function makeCenter()
			{
				$('#choose-box-wrapper').css("display","block");
				$('#choose-box-wrapper').css("position","absolute");
				$('#choose-box-wrapper').css("top", "280px");
				$('#choose-box-wrapper').css("left", "564px");
			}
	</script>
</body>
</html>