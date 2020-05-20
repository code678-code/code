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



<title>我的购物车</title>

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
    font-size: 22px;
    background: gainsboro;
    padding: 5px 15px 10px 15px;
    width: 150px;
    text-align: center;    border-radius: 5px;}
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
				<li><a href="JavaScript:MyShoppingCart()">我的购物车</a></li>
				<li><a href="JavaScript:MyOrder()">我的订单</a></li>
				<li><a href="JavaScript:MyMessage()">个人信息</a></li>
				<li><a href="JavaScript:Mylogistics()">物流信息</a></li>
			</ul>		
		</div>
		<div class="shopping" style="width: 100%;height: 150px;margin-top: 5px;">
			
		</div>
		
	</div>
	
	
</body>
<script type="text/javascript">
	function Mylogistics(){
		$.get("Mylogistics",function(data){
			console.log(data);
			var html ="";
			for(var i=0;i<data.length;i++){
				html +='<div style="width: 1080px;height: 220px;background: gray;padding: 10px;    margin-bottom: 10px;">'+
						'<div style="float: left;"><img alt="" src="'+data[i].imagesURL+'"width="340px" height="220px" style="float: left;"></div>'+
						'<div style="width: 730px;height: 220px;margin-left: 10px;float: left;">'+
						'<p style="font-size: 19px;">'+data[i].title+'</p>'+
						'<p><span style="margin-right: 100px;">处理器：'+data[i].processor+'</span><span>显卡：'+data[i].graphicscard+'</span></p>';
						if(data[i].logisticsID == undefined){
							html +='<p><span style="margin-right: 100px;">物流ID：----------------------</span><span>物流公司：---------------------------------</span></p>'+
						'<p><span style="margin-right: 100px;">商品订单ID：'+data[i].orderID+'</span><span>支付宝交易ID：'+data[i].payID+'</span></p>'+
						'<p style="font-size: 19px;">订单状态：待发货</p>';
						}else{
							html +='<p><span style="margin-right: 100px;">物流ID：'+data[i].logisticsID+'</span><span>物流公司：'+data[i].logistics+'</span></p>'+
						'<p><span style="margin-right: 100px;">商品订单ID：'+data[i].orderID+'</span><span>支付宝交易ID：'+data[i].payID+'</span></p>'+
						'<p style="font-size: 19px;">订单状态：已发货</p>';
						}
						
					html +='</div>'+
				'</div>';
			}
			$(".shopping").html(html);
		})
	}
	//我的收件信息
	function MyMessage(){
		var html = "";
		html ='<p style="font-size: 24px;"><a href="" style="margin-right: 365px;">新增地址</a>我的地址</p>'+
				'<div style="width: 410px;float: left;height: 200px;">'+
					'<p>收件人姓名：<input type="text" class="newname" name="name" value="" placeholder="请输入收件人姓名"/></p>'+
					'<p>收件人电话：<input type="text" class="newphone" name="phone" value="" placeholder="请输入联系电话"/></p>'+
					'<p>收件人地址：<input type="text" class="newaddress" name="address" value="" placeholder="请输入收件地址"/></p>'+
					'<p style="margin-top: 30px;"><a href="JavaScript:NewAddress()" style="padding: 5px 189px;background: red;">确定</a></p>'+
				'</div>'+
				'<div class="MyMessageList" style="float: left;">'+						
				'</div>';
		$(".shopping").html(html);
		$.post("addressMessage",function(data){
			console.log(data);
			var ht = data.length;
			htmllist = "";
			for(var i=0;i<ht;i++){
				var name ="1"+i+"1";
				var phone = "2"+i+"2";
				var address = "3"+i+"3";
				htmllist +='<div style="width: 410px;margin-left: 50px;">'+
						'<p><span style="background: red; padding: 0 10px;border-radius: 50%;">'+(i+1)+'</span></p>'+
						'<p style="width: 600px;">收件人姓名：<input class="'+name+'" type="text" name="name" value="'+data[i].name+'" placeholder="请输入收件人姓名"/>'+
						'<a href="JavaScript:updata('+data[i].Aid+','+name+')" style="padding: 6px 25px 9px;background: rebeccapurple;margin-left: 10px;">修改</a></p>'+
						'<p style="width: 600px;">收件人电话：<input class="'+phone+'" type="text" name="phone" value="'+data[i].phone+'" placeholder="请输入联系电话"/>'+
						'<a href="JavaScript:updata('+data[i].Aid+','+phone+')" style="padding: 6px 25px 9px;background: rebeccapurple;margin-left: 10px;">修改</a></p>'+
						'<p style="width: 600px;">收件人地址：<input class="'+address+'" type="text" name="address" value="'+data[i].address+'" placeholder="请输入收件地址"/>'+
						'<a href="JavaScript:updata('+data[i].Aid+','+address+')" style="padding: 6px 25px 9px;background: rebeccapurple;margin-left: 10px;">修改</a></p>'+
					'</div>';
			}
			$(".MyMessageList").html(htmllist);
		})
	}
	//修改
	function updata(Aid,label){
		console.log(Aid);
		console.log(label);
		var up = $("."+label+"").val();
		console.log(up);
		$.post("MyupdataMessage",{Aid:Aid,label:label,data:up},function(message){
			console.log(message);
			MyMessage();
		})
		
	}
	//新增地址
	function NewAddress(){		
		$.post("NewAddress",{name:$(".newname").val(),phone:$(".newphone").val(),address:$(".newaddress").val()},function(data){
			console.log(data);
			MyMessage();
		})
	}
	//我的订单
	function MyOrder(){
		$.post("MyOrder",function(data){
			console.log(data);
			var html ='';
			for(var i=0;i<data.length;i++){
							if(data[i].label == '待支付' && data[i].tab !='200' && data[i].tab !='100'){
							html +='<div style="width: 1080px;height: 220px;background: gray;padding: 10px;margin-top: 5px;">'+
							'<div style="float: left;"><img alt="" src="'+data[i].imagesURL+'"width="340px" height="220px" style="float: left;"></div>'+
							'<div style="width: 730px;height: 220px;margin-left: 10px;float: left;">'+							
							'<p style="font-size: 19px;">'+data[i].title+'</p>';								
								html +='<P>订单状态：<span style="margin-right: 63px;">待付款<a href="MyRefund?Oid='+data[i].Oid+'" style="margin-left: 25px;">取消订单</a>';
								html +='</span>最后交易时间：<span>----------------</span></P>'+
							'<p><span style="margin-right: 100px;">处理器：'+data[i].processor+'</span><span>显卡：'+data[i].graphicscard+'</span></p>'+
							'<p>订单号：<span style="margin-right: 75px;">'+data[i].orderID+'</span>支付宝交易号：<span>-------------------------</span></p>'+
							'<p style="margin-top: 10px;"><span style="position: relative;margin-right: 150px;">'+
							'数量：x<span style="padding:0px 197px 0 5px;font-size: 35px;" class="data">'+data[i].data+'</span>'+												
							'<span>总价：<span style="font-size: 34px;">¥'+(data[i].price)*(data[i].data)+'.00</span></span>'+
						'</div>'+
					'</div>';
							}else if(data[i].label == '已支付' && data[i].tab !='200' && data[i].tab !='100'){
							html +='<div style="width: 1080px;height: 220px;background: gray;padding: 10px;margin-top: 5px;">'+
							'<div style="float: left;"><img alt="" src="'+data[i].imagesURL+'"width="340px" height="220px" style="float: left;"></div>'+
							'<div style="width: 730px;height: 220px;margin-left: 10px;float: left;">'+							
							'<p style="font-size: 19px;">'+data[i].title+'</p>';
								html +='<P>订单状态：<span style="margin-right: 63px;">已支付<a href="MyRefund?Oid='+data[i].Oid+'" style="margin-left: 25px;">申请退款</a>';
								html +='</span>最后交易时间：<span>'+data[i].payTime+'</span></P>'+
							'<p><span style="margin-right: 100px;">处理器：'+data[i].processor+'</span><span>显卡：'+data[i].graphicscard+'</span></p>'+
							'<p>订单号：<span style="margin-right: 75px;">'+data[i].orderID+'</span>支付宝交易号：<span>'+data[i].payID+'</span></p>'+
							'<p style="margin-top: 10px;"><span style="position: relative;margin-right: 150px;">'+
							'数量：x<span style="padding:0px 197px 0 5px;font-size: 35px;" class="data">'+data[i].data+'</span>'+												
							'<span>总价：<span style="font-size: 34px;">¥'+(data[i].price)*(data[i].data)+'.00</span></span>'+
						'</div>'+
					'</div>';
							}

									
				}
			$(".shopping").html(html);
		})
	}
	
	
	//我的购物车数据
	function MyShoppingCart(){
		$.post("shoppingCart",function(data){
		console.log(data);
		var html ='';
		for(var i=0;i<data.length;i++){
		
			if(data[i].data !=0 ){
				html +='<div style="width: 1080px;height: 220px;background: gray;padding: 10px;    margin-bottom: 10px;">'+
							'<div style="float: left;"><img alt="" src="'+data[i].imagesURL+'"width="340px" height="220px" style="float: left;"></div>'+
							'<div style="width: 730px;height: 220px;margin-left: 10px;float: left;">'+
							'<p style="font-size: 19px;">'+data[i].title+'</p>'+
							'<P>'+data[i].label+'</P>'+
							'<p><span style="margin-right: 100px;">处理器：'+data[i].processor+'</span><span>显卡：'+data[i].graphicscard+'</span></p>'+
							'<p style="margin-top: 30px;"><span style="position: relative;margin-right: 150px;">数量：<span style="padding:10px 25px;border: 1px solid;    font-size: 35px;" class="data'+data[i].SMid+'">'+data[i].data+'</span>'+
							'<a href="JavaScript:DataAdd('+data[i].SMid+')" style="position: absolute;position: absolute;border: 1px solid;padding: 2px 8px;top: -31px;margin-left: 2px;">+</a>'+
							'<a href="JavaScript:DataSub('+data[i].SMid+')" style="position: absolute;position: absolute;padding: 2px 10px;border: 1px solid;top: 10px;margin-left: 2px;">-</a></span>'+
							'<span>单价：<span style="font-size: 34px;">¥'+data[i].price+'.00</span></span><a id="buy'+data[i].SMid+'" href="buy?id='+data[i].SMid+'&data='+data[i].data+'" style="background: rebeccapurple;padding: 13px 41px;margin-left: 100px;position: absolute;">立即购买</a></p>'+
						'</div>'+
					'</div>';		
				}
				
						
			}
		$(".shopping").html(html);
		})
	}
	$.post("shoppingCart",function(data){
		console.log(data);
		var html ='';
		for(var i=0;i<data.length;i++){
		
			if(data[i].data !=0 ){			
				html +='<div style="width: 1080px;height: 220px;background: gray;padding: 10px;    margin-bottom: 10px;">'+
							'<div style="float: left;"><img alt="" src="'+data[i].imagesURL+'"width="340px" height="220px" style="float: left;"></div>'+
							'<div style="width: 730px;height: 220px;margin-left: 10px;float: left;">'+
							'<p style="font-size: 19px;">'+data[i].title+'</p>'+
							'<P>'+data[i].label+'</P>'+
							'<p><span style="margin-right: 100px;">处理器：'+data[i].processor+'</span><span>显卡：'+data[i].graphicscard+'</span></p>'+
							'<p style="margin-top: 30px;"><span style="position: relative;margin-right: 150px;">数量：<span style="padding:10px 25px;border: 1px solid;    font-size: 35px;" class="data'+data[i].SMid+'">'+data[i].data+'</span>'+
							'<a href="JavaScript:DataAdd('+data[i].SMid+')" style="position: absolute;position: absolute;border: 1px solid;padding: 2px 8px;top: -31px;margin-left: 2px;">+</a>'+
							'<a href="JavaScript:DataSub('+data[i].SMid+')" style="position: absolute;position: absolute;padding: 2px 10px;border: 1px solid;top: 10px;margin-left: 2px;">-</a></span>'+
							'<span>单价：<span style="font-size: 34px;">¥'+data[i].price+'.00</span></span><a id="buy'+data[i].SMid+'" href="buy?id='+data[i].SMid+'&data='+data[i].data+'" style="background: rebeccapurple;padding: 13px 41px;margin-left: 100px;position: absolute;">立即购买</a></p>'+
						'</div>'+
					'</div>';		
				}
				
			$(".shopping").html(html);
			
			}
	})
	//修改数量 + updata
	function DataAdd(id){
		console.log(id);
		var dt = ".data"+id;
		var data =parseFloat($(""+dt+"").text())+1;//数量 +1
		$(""+dt+"").text(data);
		console.log(data);
		var dts =$(""+dt+"").text();
		var lj = "buy"+id;
		var url = "buy"+"?id="+id+"&data="+dts;
		document.getElementById(lj).href=url;
		$.post("updata",{Sid:id,data:dts},function(data){
			
		})
	}
	//修改数量 - updata
	function DataSub(id){
		console.log(id);
		var dt = ".data"+id;
		var data =parseFloat($(""+dt+"").text())-1;//数量 +1
		if(data <= 0 ){
			$(""+dt+"").text('0');			
		}else{
			$(""+dt+"").text(data);
		
		}
		var dts =$(""+dt+"").text();
		var lj = "buy"+id;
		var url = "buy"+"?id="+id+"&data="+dts;
		document.getElementById(lj).href=url;
		$.post("updata",{Sid:id,data:dts},function(data){
			location.reload();
		})
	}
</script>

</html>