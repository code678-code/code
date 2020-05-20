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



<title>订单退款&取消</title>

<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href="css/poposlides.css" rel="stylesheet">
<link rel="stylesheet" href="css/pageSwitch.min.css">
<style>

a{text-decoration: none;}

.nav__menu a{color: #333;}
#list li{float: left;
	margin: 0 20px; 0 10px;
}
p{margin:10px 0 0 0;padding: 0px;}
table td{width: 150px;}
input {
	height: 30px;
    width: 310px
}
.mi li{    float: left;
    margin: 5px 15px 10px 15px;
    font-size: 18px;
    background: gainsboro;
    padding: 5px 15px 10px 15px;
    width: 150px;
    text-align: center;    border-radius: 5px;}
    .tj a{    padding: 5px 30px;
    background: #4e73df;color: #fff;border-radius: 5px;}
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
					<img  src='images/icon/mi.png'style="border-radius: 50%;"><span style="width: 65px;padding-bottom: 10; position: absolute;font-size: 10px;padding-top: 10px;">我的电脑城</span></a>
				</div>		
			</div>
		</div>
	</div>
	
	<div style="width: 100%;height: 260px;background: url('images/img/activity.jpg');"></div>	
	<div style="width: 1100px;height: 400px;margin: 0 auto;margin-top: 5px;">
		<div style="width: 100%;height: 60px;    border-bottom: 1px solid;"class="mi">
			<ul>
				<li><a href="My">返回</a></li>
			</ul>		
		</div>
		<div class="shopping" style="width: 100%;height: 150px;margin-top: 5px;">
			<div style="float: left;"><img alt="" src="${MyRefund[0].imagesURL}"></div>
			<div style="float: left;width: 800px;height: 220px;">
				<p>${MyRefund[0].title}</p>
				<p><span class="no"></span></p>
				<p><span class="je" style="    font-size: 40px;">￥${MyRefund[0].total}</span></p>
				<p style="margin-top: 30px;margin-left: 90px;"><span class="tj"></span></p>
			</div>
		</div>
		
	</div>
	<!-- ${MyRefund}-----删除 --->
	
</body>
<script type="text/javascript">
	var z ="${MyRefund[0].label}";
	if(z == "待支付"){
		$(".no").text("商品订单号：${MyRefund[0].orderID}");
		var html ="<a href='JavaScript:MyRefundID(${MyRefund[0].Oid})'>取消订单</a>";
		$(".tj").html(html);
	}
	if(z == "已支付"){
		$(".no").text("支付宝交易号：${MyRefund[0].payID}");
		var html ="<a href='JavaScript:MyRefundID(${MyRefund[0].Oid})'>申请退款</a>";
		$(".tj").html(html);
	}
	function MyRefundID(id){
		$.post("MyRefundID",{Oid:id},function(data){
			console.log(data);
			$(".shopping").css("display","none");
			alert("订单操作成功！");
		})
	}
</script>

</html>