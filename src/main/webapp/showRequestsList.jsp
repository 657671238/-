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
        #totalCount, #totalPrice {
                font-size:25px;
                color: red;
            }
        #totalPrice {
                display: inline-block;
                text-align:left;
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
	                    <span>总计需要: <span id="totalPrice">${needP_num}</span>位请求人员<span>
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
<script type="text/javascript" src="js/mylayer.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript">


var selectCartList = [];  //以及选中的用户信息
$(function(){

	//绑定全选按钮的事件
	bindAllChecked();
	//绑定当个选项框的事件
	bindSelectOneChecked();
	//绑定下单按钮
	submitOrder();
});




function bindAllChecked(){
    $('#selectAll').on('change', function(evt) {
        // 获取事件源的两种方式: evt.target或者this
        // 这里拿到的是原生的JavaScript对象
        if ($(this).prop('checked')) {  //选中
            $('td input[type="checkbox"]').prop('checked', true); //全部选中
            calcTotal();  //计算总的价格
        } else {   //不选中
            $('td input[type="checkbox"]').prop('checked', false);//全部不选中
            $('#totalCount').text('0');
            calcTotal(); 
        }
    });
}

function bindSelectOneChecked(){
	 // 为单个商品项的复选框绑定改变事件
   $('input[name="selectOne"]').on('change', function() {
       calcTotal();
       if (!$(this).prop('checked')) {
           $('#selectAll').prop('checked', false);
       }
   });
}

//计算总计
function calcTotal() {
    var checkBoxes = $('input[name="selectOne"]');
    var countInputs = $('input.mycenter.count');
    var totalCount = 0;
    //初始化一个选中的购物车对象
    selectCartList = [];
    for (var i = 0; i < checkBoxes.length; i += 1) {
        // 复选框被勾中的购物车项才进行计算
        if ($(checkBoxes[i]).prop('checked')) {
            // 强调: jQuery对象使用下标运算或get方法会还原成原生的JavaScript对象
            totalCount += 1;
            //获取用户的id
            var user_id = $(checkBoxes[i]).parent().next().next().text();
            selectCartList.push(user_id);
        }
    }
    $('#totalCount').text(totalCount);
    //更新购物车的数据
	console.log(selectCartList);
}


//提交订单到服务器了
function submitOrder(){
	$("#submitOrder").click(function(){
		 //需要判断用户登录
		if($("#totalCount").text()!=${needP_num}){
			alert("选中人数必须等于需求人数！");
			return;
		}
		else{
			var id = ${param.taskId};
			layer.open({
				  title:"提示信息",
				  content: '确认委派任务？'
				  ,btn: ['取消', '确认委派']
				  ,yes: function(index, layero){
					  layer.close(index);
				    //按钮【按钮一】的回调
				  }
				  ,btn2: function(index, layero){
				    //ajax请求servlet
 				    $.ajax({
				    	type : "GET",
				    	data : {
				    		users : selectCartList,
				    		taskid : id
				    	},
				    	traditional: true,
						url : "delegateTaskServlet",
						dataType : "json",
						success : function(data){
							
						}
				    }) 
				    
				    
				    
				    
				  }
				  ,cancel: function(){ 
				    //右上角关闭回调
				    
				    //return false 开启该代码可禁止点击该按钮关闭
				  }
				});

			
		}
	});
}
</script>
</html>