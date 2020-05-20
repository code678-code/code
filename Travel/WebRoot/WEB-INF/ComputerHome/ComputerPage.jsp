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



<title>首页</title>

<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href="css/poposlides.css" rel="stylesheet">
<link rel="stylesheet" href="css/pageSwitch.min.css">
<style>
.s1 {
	position: fixed;
	z-index: 10;
	left: 50%;
	top: 50%;
	margin: -150px 0 0 -250px;
	width: 500px;
	height: 300px;
	background: rgba(255, 255, 255, .7);
	box-shadow: 0 0 15px rgba(0, 0, 0, .3);
}

.s1 p {
	margin: 0;
	padding: 50px 0 20px 0;
	font-family: Arial;
	font-size: 60px;
	font-weight: bold;
	text-align: center;
}

.s1 span {
	display: block;
	font-family: Arial;
	font-size: 25px;
	color: #666;
	text-align: center;
}

.s1 a {
	margin: 20px auto 0 auto;
	display: block;
	width: 220px;
	height: 50px;
	border-radius: 5px;
	text-align: center;
	line-height: 50px;
	color: #fff;
	text-decoration: none;
	font-family: Arial;
	font-size: 25px;
	background: #f88371;
}

.s1 a:hover {
	background: #ed6f5c;
}

@media ( max-width :480px) {
	.s1 {
		margin: -127px 0 0 0;
		width: 80%;
		height: 255px;
		left: 10%;
	}
	.s1 p {
		font-size: 36px;
	}
	.s1 span {
		font-size: 18px;
	}
}

.er {
	padding-top: 0px;
}

.er ul {
	margin: 0 auto;
	width: 930px;
}

.er ul li {
	border: solid 1px red;
	width: 150px;
	height: 80%;
	float: left;
	margin-right: 30px;
}

.yj ul li {
	float: left;
}
#container {
			width: 100%;
			height:350px;
			overflow: hidden;
	}
	.sections,.section {
		height:200px;
	}
	#container,.sections {
		position: relative;
	}
	.section {
		background-color: #000;
		background-size: cover;
		background-position: 50% 50%;
		text-align: center;
		color: white;
	}
.pagination{display: none;}
	.title{
	font-size: 18px;
    display: block;
    color: #333;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
	}
	.tn-item {
    line-height: 20px;
    font-size: 14px;
    overflow: hidden;
    color: #666;
}
a{text-decoration: none;}

.nav__menu a{color: #333;}

.img-responsive {
  display: inline-block;
  height: auto;
  max-width: 100%;
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
		
		<!-- 图片轮播 -->
		<div class="slides-box" style="position: relative;top: 2px;">
			<ul class="slides">
				<li style=""><a href="ComputerMessage?option=台式机"><img alt="" src="images/computer/台式机.jpg" class="img-responsive"></a></li>
				<li style=""><a href="ComputerMessage?option=笔记本"><img alt="" src="images/computer/华为笔记本.jpg"></a></li>
				<li style=""><a href="ComputerMessage?option=平板电脑"><img alt="" src="images/computer/平板.jpg"></a></li>
				<li style=""><a href="ComputerMessage?option=一体机"><img alt="" src="images/computer/一体机 (2).jpg"></a></li>
			</ul>

		</div>
	</div>
	
	<div style="width: 1400px;height:1071px;margin: 0 auto;margin-top: 30px;">
		<div class="div" style="width: 680px;height:1071px; float: left;margin: 10px 10px 0 10px;">
			<a href="ComputerMessage?option=平板电脑"><img alt="" src="images/computer/华为平板.jpg"></a>
		</div>
		<div style="width: 680px;height: 342px;background: gray;float: left;margin: 12px 10px 0 10px;">
			<a href="ComputerMessage?option=游戏本"><img alt="" src="images/computer/雷蛇游戏本.jpg" width="680px" height="342px"></a>
		</div>
		<div style="width: 680px;height: 342px;background: gray;float: left;margin: 20px 10px 0 10px;">
			<a href="ComputerMessage?option=轻薄本"><img alt="" src="images/computer/华为轻薄本.jpg" width="680px" height="342px"></a>
		</div>
		<div style="width: 680px;height: 342px;background: gray;float: left;margin: 22px 10px 0 10px;">
			<a href="ComputerMessage?option=商务本">	<img alt="" src="images/computer/商务本.jpg" width="680px" height="342px"></a>	
		</div>
	</div>
	
	<div style="    height: 80px;
    width: 80px;
    margin: 0 auto;
    background: #4e73df;
    position: relative;
    transform: rotate(45deg);border-radius: 4px;"></div>
	
	<div style="width: 1400px;height: 800px;margin: 0 auto;">
		<div style="width: 680px;height: 780px;margin: 10 0px;float: left;">
			<div style="width: 680px;height: 342px;margin: 0 10px;">
				<a href="ComputerMessage?option=家用台式机"><img alt="" src="images/computer/家用台式机.jpg"></a>
			</div>
			<div style="width: 680px;height: 342px;margin: 0 10px;margin: 20px 10px 0 10px;">
				<a href="ComputerMessage?option=游戏台式机"><img alt="" src="images/computer/游戏主机.jpg"></a>
			</div>
			<div style="width: 680px;height: 342px;margin: 0 10px;margin: 22px 10px 0 10px;">
				<a href="ComputerMessage?option=商用台式机"><img alt="" src="images/computer/商用电脑.jpg"></a>
			</div>		
		</div>
		<div style="width: 680px;height: 1070px;background: gray;margin: 0 10px;float: right;">
			<a href="ComputerMessage?option=一体机"><img alt="" src="images/computer/一体机1.jpg"></a>
		</div>		
	</div>

	
	<script>
		function PraiseAdd(id,data){
			alert(data);
			alert(id);
			$.get("PraiseAdd",{data:data,id:id},function(data){
				alert("ok");
			})
		}
	</script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/poposlides.js"></script>
	<script>
		$(".slides").poposlides();
	</script>
</body>
</html>