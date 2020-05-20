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



<title>信息</title>

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

.ComputerList .message:hover {
	border: 1px solid;
}
.sp {
	margin: 0 13px;
}
.list-on:hover {
	border: 1px solid;
}
.btn-add {
    display: block;
    height: 25px;
    background-color: #ff9d00;
    color: #fff;
    text-align: center;
    border-radius: 4px;
    width: 95px;
    float: left;
    margin: 10px;
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
	<!-- 信息 -->
	<div style="width: 1100px;height: 50px;margin: 0 auto;margin-top: 20px;">
		<div class="" style="width: 150px;height: 100%;float: left;font-size: 35px;">
			${ComputerMessage[0].Primarygroup}
		</div>
		<div class="option" style="width: 950px;float: left;padding: 15px 0 5px 0;border-bottom: 1px solid;">
			<span class="one" class="sp"></span><span class="two" class="sp"></span><span class="three" class="sp"></span>
			<span class="four" class="sp"></span><span class="five" class="sp"></span><span class="six" class="sp"></span>
		</div>
	</div>
	
	<!-- 品牌选择 - -----单选框选择---后台获取数据----->
	<div style="width: 1100px;height: 50px;margin: 0 auto;margin-top: 20px;">
		<div style="width: 120px;height: 100%;float: left;">品牌：</div>
		<div style="width: 980px;float: left;border-bottom: 1px dashed;padding-bottom: 5px;">
			<ul class="BrandName" id = "list">				
			</ul>
		</div>
	</div>
	
	<!-- 价格区间选择 - -----单选框选择-------->
	<div style="width: 1100px;height: 50px;margin: 0 auto;">
		<div style="width: 120px;height: 100%;float: left;">价格：</div>
		<div style="border-bottom: 1px dashed;padding-bottom: 5px;width: 980px;float: left;">
			<ul class="" id = "list">
				<li><a href="JavaScript:section(0)">不限</a></li>
				<li><a href="JavaScript:section(3999)">0-3999</a></li>
				<li><a href="JavaScript:section(4999)">4000-4999</a></li>
				<li><a href="JavaScript:section(5999)">5000-5999</a></li>
				<li><a href="JavaScript:section(6999)">6000-6999</a></li>
				<li><a href="JavaScript:section(7000)">7000也上</a></li>
			</ul>
		</div>
	</div>
		<!-- 分类选择 - -----单选框选择---后台获取数据----->
	<div style="width: 1100px;height: 50px;margin: 0 auto;">
		<div style="width: 120px;height: 100%;float: left;">分类：</div>
		<div style="border-bottom: 1px dashed;padding-bottom: 5px;width: 980px;float: left;">
			<ul class="classify" id = "list">

			</ul>
		</div>
	</div>
	
	<!-- 屏幕大小选择 - -----单选框选择---后台获取数据----->
	<div style="width: 1100px;height: 50px;margin: 0 auto;">
		<div style="width: 120px;height: 100%;float: left;">屏幕尺寸：</div>
		<div style="border-bottom: 1px dashed;padding-bottom: 5px;width: 980px;float: left;">
			<ul class="size" id = "list">

			</ul>
		</div>
	</div>
	
	<!-- 处理器选择 - -----单选框选择---后台获取数据----->
	<div style="width: 1100px;height: 50px;margin: 0 auto;">
		<div style="width: 120px;height: 100%;float: left;">处理器：</div>
		<div style="border-bottom: 1px dashed;padding-bottom: 5px;width: 980px;float: left;">
			<ul class="processor" id = "list">

			</ul>
		</div>
	</div>
	<!-- 显卡选择 - -----单选框选择---后台获取数据----->
	<div style="width: 1100px;height: 50px;margin: 0 auto;">
		<div style="width: 120px;height: 100%;float: left;">显卡类别：</div>
		<div style="border-bottom: 1px dashed;padding-bottom: 5px;width: 980px;float: left;">
			<ul class="graphicscard" id = "list">

			</ul>
		</div>
	</div>
	<!------------------------------- 排序 - --------------->
	<div style="width: 1100px;height: 50px;margin: 0 auto;border-bottom: 1px solid;padding-bottom: 5px;">		
		<div style="height: 100%;width: 980px;">
			<ul class="" id = "list">
				<li><a href="JavaScript:SalesOrder()">销量</a></li>
				<li><a href="JavaScript:AscOrder()">价格升序</a></li>
				<li><a href="JavaScript:DescOrder()">价格降序</a></li>
			</ul>
		</div>
	</div>
	
	<!--  展现商品信息 -->
	<div class="computerMessage" style="width: 1100px;height: 600px;margin: 0 auto;margin-top: 10px;">
		

	</div>
</body>

<script type="text/javascript">
	//加入购物车
	function add_to_shopping_cart(data,dt){
		$.post("shoppingTrolley",{Mid:data,dt:dt},function(da){
			console.log(da);
		})
	}

	//价格降序
	function DescOrder(){
		$.post("DescOrder",{Primarygroup:'${ComputerMessage[0].Primarygroup}'},function(data){
			console.log(data);
			var ht = data.length;
			//显示商品信息
			var html = "";
			for(var i=0;i<ht;i++){				
				html +='<div style="width: 250px;height: 400px;margin: 12px;float: left;">'+
					'<div class="list-on" style="padding: 10px;">'+
						'<div style="width:230px;height:200px;"><img alt="" src="images/computer/3731075a73893a79c5e0b9652bdd078a_b250f8c13b114f50.jpg" width="230px;" height="200px;"/></div>'+
						'<div style="width: 230px;height: 180px;">'+
							'<p><span style="color: #e4393c;font-size: 20px;">¥'+data[i].price+'.00</span></p>'+
							'<div class="" style="width: 230px;height: 40px;font-size: 14px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].title+'</div>'+
							'<div class="" style="width: 230px;height: 18px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].label+'</div>'+
							'<div class="" style="width: 230px;height: 15px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].configuration+'</div>'+
							'<p>已售：'+data[i].sales+'</p>'+
							'<p><a href="buy_shopping?id='+data[i].id+'&Mid='+data[i].Mid+'" class="btn-add">立即选购</a><a href="JavaScript:add_to_shopping_cart('+data[i].Mid+')" class="btn-add">加入购物车</a></p>'+
						'</div>'+
					'</div>'+
				'</div>';
				
			}
			$(".computerMessage").html(html);
		})
	}

	//价格升序
	function AscOrder(){
		$.post("AscOrder",{Primarygroup:'${ComputerMessage[0].Primarygroup}'},function(data){
			console.log(data);
			var ht = data.length;
			//显示商品信息
			var html = "";
			for(var i=0;i<ht;i++){				
				html +='<div style="width: 250px;height: 400px;margin: 12px;float: left;">'+
					'<div class="list-on" style="padding: 10px;">'+
						'<div style="width:230px;height:200px;"><img alt="" src="images/computer/3731075a73893a79c5e0b9652bdd078a_b250f8c13b114f50.jpg" width="230px;" height="200px;"/></div>'+
						'<div style="width: 230px;height: 180px;">'+
							'<p><span style="color: #e4393c;font-size: 20px;">¥'+data[i].price+'.00</span></p>'+
							'<div class="" style="width: 230px;height: 40px;font-size: 14px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].title+'</div>'+
							'<div class="" style="width: 230px;height: 18px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].label+'</div>'+
							'<div class="" style="width: 230px;height: 15px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].configuration+'</div>'+
							'<p>已售：'+data[i].sales+'</p>'+
							'<p><a href="buy_shopping?id='+data[i].id+'&Mid='+data[i].Mid+'" class="btn-add">立即选购</a><a href="JavaScript:add_to_shopping_cart('+data[i].Mid+')" class="btn-add">加入购物车</a></p>'+
						'</div>'+
					'</div>'+
				'</div>';
				
			}
			$(".computerMessage").html(html);
		})
	}

	//销量排序
	function SalesOrder(){
		$.post("SalesOrder",{Primarygroup:'${ComputerMessage[0].Primarygroup}'},function(data){
			console.log(data);
			console.log(data);
			var ht = data.length;
			//显示商品信息
			var html = "";
			for(var i=0;i<ht;i++){				
				html +='<div style="width: 250px;height: 400px;margin: 12px;float: left;">'+
					'<div class="list-on" style="padding: 10px;">'+
						'<div style="width:230px;height:200px;"><img alt="" src="images/computer/3731075a73893a79c5e0b9652bdd078a_b250f8c13b114f50.jpg" width="230px;" height="200px;"/></div>'+
						'<div style="width: 230px;height: 180px;">'+
							'<p><span style="color: #e4393c;font-size: 20px;">¥'+data[i].price+'.00</span></p>'+
							'<div class="" style="width: 230px;height: 40px;font-size: 14px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].title+'</div>'+
							'<div class="" style="width: 230px;height: 18px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].label+'</div>'+
							'<div class="" style="width: 230px;height: 15px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].configuration+'</div>'+
							'<p>已售：'+data[i].sales+'</p>'+
							'<p><a href="buy_shopping?id='+data[i].id+'&Mid='+data[i].Mid+'" class="btn-add">立即选购</a><a href="JavaScript:add_to_shopping_cart('+data[i].Mid+')" class="btn-add">加入购物车</a></p>'+
						'</div>'+
					'</div>'+
				'</div>';
				
			}
			$(".computerMessage").html(html);
		})
		
	}
	
	console.log(${ComputerMessage});
	var ht = ${ComputerMessage}.length;
	console.log(ht);
	var BrandNameArr = new Array(ht);//品牌数组
	var classifyArr = new Array(ht);//分类数组
	var sizeArr = new Array(ht);//屏幕尺寸数组
	var processorArr = new Array(ht);//处理器数组
	var graphicscardArr = new Array(ht);//显卡数组
	
	//显示商品信息
	var html = "";
	for(var i=0;i<ht;i++){
		BrandNameArr[i] = ${ComputerMessage}[i].brand;
		classifyArr[i] = ${ComputerMessage}[i].Secondarygroup;
		sizeArr[i] = ${ComputerMessage}[i].size;
		processorArr[i] = ${ComputerMessage}[i].processor;
		graphicscardArr[i] = ${ComputerMessage}[i].graphicscard;
		
		html +='<div style="width: 250px;height: 400px;margin: 12px;float: left;">'+
			'<div class="list-on" style="padding: 10px;">'+
				'<div style="width:230px;height:200px;"><img alt="" src="'+${ComputerMessage}[i].imagesURL+'" width="230px;" height="200px;"/></div>'+
				'<div style="width: 230px;height: 180px;">'+
					'<p><span style="color: #e4393c;font-size: 20px;">¥'+${ComputerMessage}[i].price+'.00</span></p>'+
					'<div class="" style="width: 230px;height: 40px;font-size: 14px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+${ComputerMessage}[i].title+'</div>'+
					'<div class="" style="width: 230px;height: 18px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+${ComputerMessage}[i].label+'</div>'+
					'<div class="" style="width: 230px;height: 15px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+${ComputerMessage}[i].configuration+'</div>'+
					'<p>已售：'+${ComputerMessage}[i].sales+'</p>'+
					'<p><a href="buy_shopping?id='+${ComputerMessage}[i].id+'&Mid='+${ComputerMessage}[i].Mid+'" class="btn-add">立即选购</a><a href="JavaScript:add_to_shopping_cart('+${ComputerMessage}[i].Mid+')" class="btn-add">加入购物车</a></p>'+
				'</div>'+
			'</div>'+
		'</div>';
		
	}
	$(".computerMessage").html(html);
	var BrandName = unique(BrandNameArr);//品牌去重 后的数组
	var classify = unique(classifyArr);//分类去重 后的数组
	var size = unique(sizeArr);//屏幕尺寸去重 后的数组
	var processor = unique(processorArr);//处理器去重 后的数组
	var graphicscard = unique(graphicscardArr);//显卡去重 后的数组
	
	$(".BrandName").html(html);
	function unique (arr) {
  		return Array.from(new Set(arr))
	}
	//价格
	function section(data){
		var q ;
		if(data  == 0){
			q = '不限';
		}else if(data == 3999){
			q = '0-3999';
		}else if(data == 4999){
			q = '4000-4999';
		}else if(data == 5999){
			q = '5000-5999';
		}else if(data == 6999){
			q ='6000-6999'
		}else if(data == 7000){
			q ='7000也上';
		}
		html ='价格区间：<span id="two">'+q+'</span><a href="JavaScript:option(2)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".two").html(html);
		All();
	}
	
	//品牌
	var BrandNamehtml =  "";
	for(var i=0;i<BrandName.length;i++){
		BrandNamehtml +='<li><a href="JavaScript:Brand('+i+')">'+BrandName[i]+'</a></li>';
	}
	$(".BrandName").html(BrandNamehtml);
	function Brand(data){
		
		html ='品牌：<span id="one">'+BrandName[data]+'</span><a href="JavaScript:option(1)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".one").html(html);
		All();
	}
	//分类
	var classifyhtml =  "";
	for(var i=0;i<classify.length;i++){
		classifyhtml +='<li><a href="JavaScript:classifythree('+i+')">'+classify[i]+'</a></li>';
	}
	$(".classify").html(classifyhtml);
	function classifythree(data){
		html ='分类：<span id="three">'+classify[data]+'</span><a href="JavaScript:option(3)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".three").html(html);
		All();
	}
	//屏幕尺寸
	var sizehtml =  "";
	for(var i=0;i<size.length;i++){
		sizehtml +='<li><a href="JavaScript:sizefour('+i+')">'+size[i]+'</a></li>';
	}
	$(".size").html(sizehtml);
	function sizefour(data){
		html ='屏幕尺寸：<span id="four">'+size[data]+'</span><a href="JavaScript:option(4)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".four").html(html);
		All();
	}
	//处理器
	var processorhtml =  "";
	for(var i=0;i<processor.length;i++){
		processorhtml +='<li><a href="JavaScript:processorfive('+i+')">'+processor[i]+'</a></li>';
	}
	$(".processor").html(processorhtml);
	function processorfive(data){
		html ='处理器：<span id="five">'+processor[data]+'</span><a href="JavaScript:option(5)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".five").html(html);
		All();
	}
	//显卡
	var graphicscardhtml =  "";
	for(var i=0;i<graphicscard.length;i++){
		graphicscardhtml +='<li><a href="JavaScript:graphicscardsix('+i+')">'+graphicscard[i]+'</a></li>';
	}
	$(".graphicscard").html(graphicscardhtml);
	function graphicscardsix(data){
		html ='显卡：<span id="six">'+graphicscard[data]+'</span><a href="JavaScript:option(6)">&nbsp;&nbsp;&nbsp;X</a>';
		$(".six").html(html);
		All();
	}
	
	function option(data){
		var s ;
		if(data ==1 ){
			s= 'one';
		}else if(data == 2){
			s = 'two';
		}else if(data == 3){
			s = 'three';
		}else if(data == 4){
			s = 'four';
		}else if(data == 5){
			s = 'five';
		}else if(data == 6){
			s = 'six';
		}
		$("."+s+"").html('');
		All();
	}
	function All(){
		var one =$("#one").text();
		var two =$("#two").text();
		var three =$("#three").text();
		var four =$("#four").text();
		var five =$("#five").text();
		var six =$("#six").text();
		
		console.log(one);
		console.log(two);
		console.log(three);
		console.log(four);
		console.log(five);
		console.log(six);
		if(one == ''){
			one ="no";
		}
		if(two == ''){
			two ="no";
		}
		if(three == ''){
			three ="no";
		}
		if(four == ''){
			four ="no";
		}
		if(five == ''){
			five ="no";
		}
		if(six == ''){
			six ="no";
		}
		//post请求向后端获取数据
		$.post("MessageGroup",{one:one,two:two,three:three,four:four,five:five,six:six},function(data){
			console.log(data);
			var ht = data.length;
			//显示商品信息
			var html = "";
			for(var i=0;i<ht;i++){				
				html +='<div style="width: 250px;height: 400px;margin: 12px;float: left;">'+
					'<div class="list-on" style="padding: 10px;">'+
						'<div style="width:230px;height:200px;"><img alt="" src="images/computer/3731075a73893a79c5e0b9652bdd078a_b250f8c13b114f50.jpg" width="230px;" height="200px;"/></div>'+
						'<div style="width: 230px;height: 180px;">'+
							'<p><span style="color: #e4393c;font-size: 20px;">¥'+data[i].price+'.00</span></p>'+
							'<div class="" style="width: 230px;height: 40px;font-size: 14px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].title+'</div>'+
							'<div class="" style="width: 230px;height: 18px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].label+'</div>'+
							'<div class="" style="width: 230px;height: 15px; font-size: 12px;overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">'+data[i].configuration+'</div>'+
							'<p>已售：'+data[i].sales+'</p>'+
							'<p><a href="buy_shopping?id='+data[i].id+'&Mid='+data[i].Mid+'" class="btn-add">立即选购</a><a href="JavaScript:add_to_shopping_cart('+data[i].Mid+')" class="btn-add">加入购物车</a></p>'+
						'</div>'+
					'</div>'+
				'</div>';
				
			}
			$(".computerMessage").html(html);			
		})
	}
	
</script>
</html>