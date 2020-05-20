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



<title>选择</title>

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

.sku-name {
    font: 700 16px Arial,"microsoft yahei";
    color: #666;
    padding-top: 10px;
    line-height: 28px;
    margin-bottom: 5px;
}
.btn-lg {
    height: 46px;
    line-height: 46px;
    padding: 0 26px;
    font-size: 18px;
    font-family: "microsoft yahei";
    color: #fff;
    
}
.lg {
    background-color: #df3033;
}
.table td{width: 150px;}
.table td{font-size: 13px;}
.input{display: none;}
.peizhi:hover {
	background: red;
}
.pagination{display: none;}
.slides img {
	height: 260px;
	background-size: 100%;
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

	<div style="width: 1100px;height: 600px;margin: 0 auto;margin-top: 20px;">
		<div style="width: 500px;height: 600px;float: left;margin-right: 10px">
			<!-- 图片轮播 -->
			<div class="slides-box" style="position: relative;top: 25px;">
				<ul class="slides">
					<li style=""><img alt="" src="images/Main/a7cd9094cd772363d37e4f6d96b356b8_Razer-Blade-Stealth-V4-usp8-2019-update-new.jpg" class="img-responsive"></li>
					<li style=""><img alt="" src="images/Main/8a140d6e5c376880250e43d9a65af5ba_20200409094330.png"></li>
					<li style=""><img alt="" src="images/Main/8bc7d67922e277d633689c53ac4d211e_razer-blade-pro-17-2019-work-play-desktop.jpg"></li>
					<li style=""><img alt="" src="images/Main/ee15c3e650ee33790db07e0ae445e4b3_razer-blade-pro-17-2019-maximize-display-desktop.jpg"></li>
				</ul>	
			</div>
		</div>
		<div style="width: 590px;height: 600px;float: left;">
			<div class='sku-name' style="padding: 20px 10px;height: 45px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>${computer[0].title}</span></div>
			
			<div style="height: 100px;padding: 20px 10px;">
				<p style="font-size: 14px;">${computer[0].label}</p>
				<div style="width: 570px;height: 50px;">
					<span  style="font-size: 40px;color: red;">¥<span class="price"></span>.00</span>
				</div>
			</div>
			
			<div style="width: 590px;margin-top: 10px;">
				
				<table class="table" cellspacing="0"style="">
					

				</table>
			</div>
			
			<div style="width: 590px;margin-top: 10px;">
				<table cellspacing="0">
					<tr>
						<td rowspan="3" class="amount" style="width: 60px;height: 50px;text-align: center;border: 1px solid;">1</td>
					</tr>
					<tr>
						<td style="border-top: 1px solid;border-right: 1px solid;height: 48px;width: 48px;text-align: center;">
						<a href="JavaScript:jia()"><div style="width: 48px;height: 48px;text-align: center; line-height: 50px;">+</div></a></td>					
					</tr>
					<tr>
						<td style="border-top: 1px solid;border-right: 1px solid;border-bottom: 1px solid;width: 48px;text-align: center;"><a href="JavaScript:jian()">
						<div style="width: 48px;height: 48px;text-align: center; line-height: 50px;">-</div></a></td>
						
						<td style="width: 80px;font-size: 10px;"><span style="margin-left: 10px;">库存：</span></td>
						<td class="lg"><a id="shopping" href="JavaScript:void(0)" class="btn-lg">加入购物车</a></td>
						<td style="width: 80px;"></td>
						<td class="lg"><a id ="buy" href="JavaScript:void(0)"  class="btn-lg">立即购买</a></td>				
					</tr>
				</table>
				
			</div>
			
		</div>
	
	</div>
	
</body>
<script type="text/javascript">
	//加入购物车
	function add_to_shopping_cart(data,dt){
		$.post("shoppingTrolley",{Mid:data,},function(data){
			console.log(data);
		})
	}

	console.log(${computerMessage});
	function update(data,j){
		var sum = $(".amount").text();
		$(".price").text(${computerMessage}[j].price);		
		document.getElementById("buy").href="buy?id="+data+"&data="+sum+"";
		
		document.getElementById("shopping").href="JavaScript:add_to_shopping_cart("+data+","+sum+")";
	}
	var ht = ${computerMessage[0].sum};
	var html='<tr><td rowspan="3" style="width: 80px;border: 1px solid;text-align: center;">选择配置：</td></tr>';
	for(var i=0;i<ht;i++){
		html +='<tr>';
			for(var j=0;j<${computerMessage}.length;j++){
				html +='<td><div onclick="update('+${computerMessage}[j].Mid+','+j+')" id="div'+j+'" class="peizhi" style="    margin: 0 5px; border: 1px solid;    padding: 0 4px;">'+
				'<input  type="radio" name="configuration" value="'+${computerMessage}[j].Mid+'" class="input" id="no'+j+'"/><label for="no'+j+'">'+${computerMessage}[j].configuration+'</label></div></td>'			
			}				
			html +='</tr>';
	}
	$(".table").html(html);
	

function jia(){//加
		var amount =parseFloat( $(".amount").text());
		var sum = amount+1;
		$(".amount").text(sum);
		var sum = $(".amount").text();

		var id= $(".input[type='radio']:checked").val();//id
		document.getElementById("buy").href="buy?id="+id+"&data="+sum+"";
		
		document.getElementById("shopping").href="JavaScript:add_to_shopping_cart("+id+","+sum+")";
		
		
	}
	function jian(){//减
		var amount =parseFloat( $(".amount").text());
		var sub = amount-1;
		if(amount ==1 ){
			$(".amount").text(1);
		}else{
			$(".amount").text(sub);
		}
		var sum = $(".amount").text();

		var id= $(".input[type='radio']:checked").val();//id
		document.getElementById("buy").href="buy?id="+id+"&data="+sum+"";
		
		document.getElementById("shopping").href="JavaScript:add_to_shopping_cart("+id+","+sum+")";
		
		
	}
	for(var i=0;i<${computerMessage}.length;i++){
		if(${computerMessage}[i].Mid == ${computerMessage}[i].echo){
			var sum = $(".amount").text();
			$(".price").text(${computerMessage}[i].price);
			$(".input:radio[value='"+${computerMessage}[0].echo+"']").attr('checked','true');			
			var id= $(".input[type='radio']:checked").val();//id
			document.getElementById("buy").href="buy?id="+${computerMessage}[i].echo+"&data="+sum+"";
			document.getElementById("shopping").href="JavaScript:add_to_shopping_cart("+${computerMessage}[i].echo+","+sum+")";
		}
	}
		
</script>
<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/poposlides.js"></script>
	<script>
		$(".slides").poposlides();
	</script>
</html>