<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>



<title>订单</title>

<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href="css/poposlides.css" rel="stylesheet">
<link rel="stylesheet" href="css/pageSwitch.min.css">
<style>

a{text-decoration: none;}

.nav__menu a{color: #333;}
#list li{float: left;
	margin: 0 20px; 0 10px;
}
p{margin:5px 0 5px 0;padding: 0px;}
table td{width: 150px;}
input {
	height: 30px;
    width: 310px
}
</style>
<script src="js/Main/jquery.min.js"></script>
</head>

<body>
	<div>
		<!-- 头部导航栏 -->
		<div style="background-color: rgba(255,255,255,0.95);border-bottom: #d6d6d6 1px solid;box-shadow: 0 2px 5px rgba(0,0,0,0.12);height: 55px;/*position:relative;*/">			
			<div class="navdiv" style="position:absolute;z-index:1">
				<div>
					<ul class="nav__menu">
						<li class="nav__menu-item" style="background: #4e73df;"><a href="Main" style="color: #fff;">商城首页</a></li>
						<li class="nav__menu-item" style=""><a href="ComputerMessage?option=平板电脑" style="">平板电脑</a></li>
						<li class="nav__menu-item" style=""><a href="ComputerMessage?option=一体机" style="">一体机</a></li>
						<li class="nav__menu-item" id="nav__menu-item"><a href="ComputerMessage?option=笔记本">笔记本</a>
							<ul class="nav__submenu">
								<li class="nav__submenu-item"><a href="ComputerMessage?option=商务本">商务本</a></li>
								<li class="nav__submenu-item"><a href="ComputerMessage?option=轻薄本">轻薄本</a></li>
								<li class="nav__submenu-item"><a href="ComputerMessage?option=游戏本">游戏本</a></li>
							</ul></li>
						<li class="nav__menu-item" id="nav__menu-item"><a href="ComputerMessage?option=台式机">台式机</a>
							<ul class="nav__submenu">
								<li class="nav__submenu-item"><a href="ComputerMessage?option=家用台式机">家用台式机</a></li>
								<li class="nav__submenu-item"><a href="ComputerMessage?option=游戏台式机">游戏台式机</a></li>
								<li class="nav__submenu-item"><a href="ComputerMessage?option=商用台式机">商用台式机</a></li>								
							</ul></li>
						<!--<li class="nav__menu-item"><a>${userinfo.userName}</a></li>-->					
					</ul>
				</div>
			</div>
			<div style="height: 100%;width: 260px;margin-left: 1200px;">
				<div style="float: left;margin-left: 80px;margin-top: 12px;text-align: center;"><a href="My">
					<img alt="${username}" src='images/icon/mi.png'style="border-radius: 50%;"><span style="width: 65px;padding-bottom: 10; position: absolute;font-size: 10px;padding-top: 10px;">我的电脑城</span></a>
				</div>		
			</div>
		</div>
	</div>
	<div style="width: 1100px;margin: 0 auto;margin-top: 30px">
		<div style="width: 1100px;height: 260px;">
			<div style="width: 320px;height: 220px;float: left;margin: 0 10px;background: red;">
				<img alt="" src="${Order[0].imagesURL}" width="100%" height="100%">
			</div>
			<div style="width: 740px;height: 200px;float: left;background: red;padding: 10px;">
				<div style="width: 100%;height: 50px;">
					${Order[0].title}
				</div>
				<p>${Order[0].label}</p>
				<table>
					<tr>
						<td style="width: 80px;">处理器：</td>
						<td>${Order[0].processor}</td>
						<td></td>
						<td style="width: 80px;">显卡：</td>
						<td>${Order[0].graphicscard}</td>						
					</tr>
				</table>
				<p>订单号:${Order[0].orderID}</p>
				<div style="width: 100%;height: 50px;">
					<div style="width: 280px;height: 100%;float: left;font-size: 35px;">数量：x<span style="font-size: 38px;">${Order[0].data}</span></div>
					<div style="width: 300px;height: 100%;float: left;font-size: 35px;">总价：¥<span class="total"></span></div>
				</div>
			</div>
		</div>	
	</div>
	<div style="width: 1080px;height: 50px;margin: 0 auto;padding: 0 10px;">
		<a href="JavaScript:cy()" style="padding: 0 30px 20px 30px;border-bottom: 1px solid;font-size: 22px;">常用收货地址</a>
		<a href="JavaScript:tx()" style="padding: 0 30px 20px 30px;border-bottom: 1px solid;font-size: 22px;">填写收货地址</a>
		<a href="JavaScript:submit()" style="border: 1px solid;font-size: 22px;margin-left: 490px;
		padding: 10px 25px;position: absolute;background: red;color: #fff;">提交订单</a>
	</div>
	<div class="sh"></div>
	

	
</body>
<script type="text/javascript">
	var total = ${Order[0].data}*${Order[0].price};
	$(".total").text(total+".00");
	
	function cy(){
		$.get("MyAddressMessage",function(data){
			console.log(data);
			var html ='';
			for(var i=1;i<=data.length;i++){
			     html +='<div class="" style="width: 1080px;height: 110px;margin: 0 auto;padding: 0 10px;margin-top: 10px;">'+
							'<p><span style="border-radius: 50%;    background: red;padding: 0 7px">'+i+'</span><a href="JavaScript:defaultAddress('+data[(i-1)].Aid+')" style="margin-left: 60px;">设置默认地址</a></p>'+
							'<p style="padding-left: 16px;">收货人：<span class="">'+data[(i-1)].name+'</span></p>'+
							'<p>收货电话：<span class="">'+data[(i-1)].phone+'</span></p>'+
							'<p>收货地址：<span class="">'+data[(i-1)].address+'</span></p>'+
						'</div>';			
			}			
			$(".sh").html(html);
		})
	}
	function defaultAddress(m){
		console.log(m);
		$.post("defaultAddress",{Aid:m},function(data){
			console.log(data);
			 var html ='<div class="" style="width: 1080px;height: 110px;margin: 0 auto;padding: 0 10px;margin-top: 10px;">'+
							'<p><span style="border-radius: 50%;    background: red;padding: 0 7px">'+1+'</span></p>'+
							'<p style="padding-left: 16px;">收货人：<span class="name">'+data[0].name+'</span></p>'+
							'<p>收货电话：<span class="phone">'+data[0].phone+'</span></p>'+
							'<p>收货地址：<span class="address">'+data[0].address+'</span></p>'+
						'</div>';
			$(".sh").html(html);
		})
	}
	function tx(){
	
				var html ='<div class="" style="width: 1080px;height: 50px;margin: 0 auto;padding: 0 10px;margin-top: 10px;">'+
						'<p style="padding-left: 16px;">收货人：<input type="text" class="name" name="name" value=""/></p>'+
						'<p>收货电话：<input type="text" class="phone" name="phone" value=""/></p>'+
						'<p>收货地址：<input type="text" class="address" name="address" value=""/></p>'+
						'</div>';
		
		$(".sh").html(html);
	}
	function submit(){
		var total = $(".total").text();//总价
		var orderID = ${Order[0].orderID};//订单号
		var dt = ${Order[0].data};//数量
		var name ;//收货姓名
		var phone ;//收货电话
		var address ;//收货地址
		if($(".name").val() ==""){
			 name = $(".name").text();//
			 phone = $(".phone").text();
			 address = $(".address").text();
		
		}else{
			 name = $(".name").val();//
			 phone = $(".phone").val();
			 address = $(".address").val();
		
		}
		var id = ${Order[0].Mid};
		console.log(name);
		console.log(phone);
		console.log(address);
		$.post("Order",{name:name,phone:phone,address:address,orderID:orderID,dt:dt,total:total,id:id},function(data){		
			$("body").html(data);
		})
	}
	
</script>
</html>