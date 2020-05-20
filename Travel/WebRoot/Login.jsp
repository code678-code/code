<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html;">
<title>电脑销售网站</title>
<script src="js/Main/jquery.min.js"></script>
<style>
body{
	margin: 0px;
	padding: 0px;
}
.het{
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 3px 3px rgba(0,0,0,.4);
    width: 780px;height:430px;margin: auto;margin-top: 200px;
    background-color:rgba(0,0,0,0.1);
    padding: 10px;

}

.left{
	width: 755px;
	height: 350px;
	float: left;
}
.regth{
	width: 298px;
    height: 291px;
    float: left;
    margin-top: 50px;
	
}


.head{
	width: 330px;
	margin: 0 auto;
	margin-top: 70px;	
}
input {
	border-color: #f6f7f9;
    background: #f6f7f9;
    border-radius: 6px;
    font-family: PingFangSC-Medium,PingFang SC;
    width: 320px;

    border: 1px solid #d8d8d8;
    border-radius: 4px;
    font-size: 14px;
    color: #666;
    line-height: 28px;
    padding: 6px 0 6px 12px;
    box-shadow: 0 0 5px #fff;
    outline: 0;
    transition: box-shadow .25s linear 0s;
    -webkit-transition: box-shadow .25s linear 0s;
}
._j_login_form{
	position: relative;
    padding-top: 70px;
}
 .submit-btn {
    padding: 17px 0 0;
}


 .submit-btn {
    width: 320px;
    padding: 12px 0 0;
}
 .submit-btn button {

    border-radius: 6px;
    font-size: 20px;
    font-weight: 500;
    width: 320px;
    height: 42px;
    border: 0;
    background-color: #4e73df;
    border-radius: 5px;
    text-align: center;
    line-height: 40px;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
}
 .form-link {
    clear: both;
    width: 310px;
    margin: 0 auto;
    padding: 8px 0 0;
    text-align: right;
}
.form-link a {
    color: #717376;
    text-decoration: none;
    font-size: 14px;
}
.form-field {
    
}
.err-tip{
	height: 15px;
	width: 308px;
	border-radius: 4px;
	font-size: 10px;
	padding-left: 12px;
	
	
}
.dd{
    border-radius: 50%;
    width: 40px;
    height: 40;
    position: absolute;
    top: -20px;
    left: 80px;
}
</style>
<body style="background: url('images/Main/a7cd9094cd772363d37e4f6d96b356b8_Razer-Blade-Stealth-V4-usp8-2019-update-new.jpg') no-repeat;background-size: 100%;">
<script type="text/javascript">
	function reg(){
		var head = document.getElementById("heads");
		head.style.display="none";
		var reg = document.getElementById("reg");
		reg.style.display="block";
	}
</script>
<script type="text/javascript">

		
		function register(){
			if($("#ps2").val().length<12 && $("#ps1").val().length<12){
				$("#r-ps1").html("密码长度最低12位！");
				$("#r-ps2").html("密码长度最低12位！");
				document.getElementById("r-ps1").style.background="red";
				document.getElementById("r-ps2").style.background="red";
			}else if($("#ps2").val()==$("#ps1").val()){
				$.get("register",{name:$("#name").val(),password:$("#ps2").val()},function(data){
						if(data !=1){
							alert("注册失败");
							
						}else{
							var head = document.getElementById("heads");
							head.style.display="block";
							var reg = document.getElementById("reg");
							reg.style.display="none";
						}
						
				})				
			}else{
				$("#r-ps2").html("密码不一致！");
				document.getElementById("r-ps2").style.background="red";
			}
		}
				

</script>
<div>
	<div class="het">		
		<div class="left">
			<div class='head' style="display:none;" id="reg">
					<div id="_j_login_form" >
						<div class="form-field">
							<input name="name" type="text" class="id_username" placeholder="您的邮箱/手机号" id="name"/>
							<div class="err-tip" id="r-na"></div>
						</div>
						<div class="form-field">
							<input name="password1" type="password" placeholder="请您输入密码" id="ps1"/>
							<div class="err-tip" id="r-ps1"></div>
						</div>
						<div class="form-field">
							<input name="password2" type="password" placeholder="请您确认密码" id="ps2"/>
							<div class="err-tip" id="r-ps2"></div>
						</div>
						<div class="submit-btn">
							<a href="JavaScript:void(0)" style="padding: 10px 141px;background: #4e73df;border-radius: 5px;color: #fff;" id="commitbtn" class="enroll" >注 册</a>
						</div>
					</div>
			</div>
			<div class='head' style="display:block;" id="heads">
					<form action="Login" method="post" id="_j_login_form">
						<div class="form-field">
							<input name="name" type="text" value="" placeholder="您的邮箱/手机号" id="h-na"/>
							<div class="err-tip" id="h-name">${msg}</div>
						</div>
						<div class="form-field">
							<input name="password" type="password" value="" placeholder="您的密码" id="h-ps"/>
							<div class="err-tip" id="h-password"></div>
						</div>
						<div class="form-link">
							<a href=""></a>
						</div>
						<div class="submit-btn">
							<button id="_js_loginBtn">登 录</button>
						</div>
					</form>
			</div>
		</div>
		<div style="border-radius: 8px;height: 78px;width: 100%;margin-top: 350px;background: linear-gradient(270deg,rgba(246,247,249,0.3) 0,rgba(246,247,249,1) 100%);padding-top: 2px;">						
		</div>		
	</div>
	<div style="width: 146px;height:20px;padding-top:4px;margin: 10px auto;background-color: #000;border-radius: 15px;background-color: rgba(0,0,0,.4);text-align: center;font-size: 12px;color: #fff;text-shadow: 1px 1px 1px rgba(0,0,0,.4);">还没账号?
	<a href="javascript:reg()" style="color:#ffa800;margin-left:6px;">马上注册</a></div>
</div>

<script>
$(".id_username").blur(function(){
	var name = $(".id_username").val();
	$.get("nameVerification",{name:name},function(data){
		console.log(data);
		if(data == 1){
			$("#r-na").text("该用户也被注册");
						
           	
		}else{
			$("#r-na").text("");
			document.getElementById("commitbtn").href="JavaScript:register()";
		}
	})
})

</script>
</body>
</html>
