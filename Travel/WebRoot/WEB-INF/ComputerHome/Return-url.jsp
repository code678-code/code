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



<title>支付成功</title>

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
.ord li{
  		width: 170px;
  		height: 45px;
  		float: left;
  		position: relative;
  	}
  	.ord ul{
  		width: 520px;
  		margin: 0 auto;
  		margin-top: 50px;
  	}
  	.ord li em {
    font-style: normal;
    position: absolute;
    bottom: 0;
    font-size: 14px;
    width: 56px;
    height: 19px;
}
	.ord li{
	border-top: 4px solid #efefef;
	}
  	.ord li.step1 p{
  	position:absolute;
    left: 0;
    top: -19px;
    width: 22px;
    height: 22px;
    text-align: center;
    line-height: 22px;
    border-radius: 50%;
    background: #ff9d00;
  	}
  	.step1 em{
    color: #ff9d00;
  	}
  	.ord li.step2 p{
  	    position: absolute;
    left: 50%;
    margin-left: -11px;
    top: -19px;
    width: 22px;
    height: 22px;
    text-align: center;
    border: 1px solid #e8e8e8;
    line-height: 22px;
    border-radius: 50%;
   background: #ff9d00;
  	}
  	.ord li.step3 p{
  		    position: absolute;
    right: 0;
    top: -19px;
    width: 22px;
    height: 22px;
    text-align: center;
    line-height: 22px;
    border: 1px solid #e8e8e8;
    border-radius: 50%;
 background: #ff9d00;
  	}
  	.ord li{

    border-top: 4px solid #ff9d00;
  	}
  	.step1 em{
  		left: -16px;
  		color: #ff9d00;
  	}
  	.step2 em{
  		left: 60px;
  		color: #ff9d00;
  	}
  	.step3 em{
  		left: 130px;
  		color: #ff9d00;
  	}
  	
  	.ord li p i{
  	    width: 8px;
    	height: 8px;
    	display: inline-block;
    	background: #efefef;
    	border-radius: 50%;
   	 	vertical-align: top;
    	margin-top: 7px;
  	}

.s-menua {
    display: inline-block;
    height: 36px;
    padding: 0 17px;
    text-align: center;
    line-height: 36px;
    font-size: 16px;
    border-radius: 15px;
    color: #ff8a00;
    margin-top: 150px;
    border: 1px solid #ff8a00;  
}
.s-menua:hover {
	background: #ff8a00;
	color: #fff;
}
a{
	text-decoration: none;
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
		<div style="width: 1100px;margin: 0 auto;">
    		<div style="width: 690px;float: left;">
    			<div>
    				<div class="ord">
	    				<ul>
	    					<li class="step1"><p><i></i></p><em></em></li>
	    					<li class="step2"><p><i></i></p><em></em></li>
	    					<li class="step3"><p><i></i></p><em>完成购买</em></li>
	    				</ul>
    				</div>
    			</div>
    			
    			<a href="MyOrder" class="s-menua" style="margin-left: 195px;">查看订单</a><a href="Main" class="s-menua" style="margin-left: 100px;">返回首页</a>
    		</div>
    	</div>

  </body>
</html>
