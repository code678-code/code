<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
<script src="js/Main/jquery.min.js"></script>

<script type="text/javascript"src="js/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript"src="js/jquery/ajaxfileupload.js"></script>
</head>
<style>
td{padding-bottom: 10px;}
</style>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3"> ${adminname} <sup>SB</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="AdminIndex">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>指示板</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        接口控件
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-cog"></i>
          <span>账号设置</span>
        </a>       
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="AdminDomesticConsumer" >
          <i class="fas fa-fw fa-wrench"></i>
          <span>普通用户管理</span>
        </a>       
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        	菜单管理
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="AdminCommodity">
          <i class="fas fa-fw fa-folder"></i>
          <span>商品管理</span>
        </a>        
      </li>
      <li class="nav-item">
        <a class="nav-link" href="putaway">
          <i class="fas fa-fw fa-folder"></i>
          <span>商品上架</span>
        </a>        
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="AdminOrderForm">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>订单管理</span>
        </a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="AdminSalesVolume">
          <i class="fas fa-fw fa-table"></i>
          <span>销量统计</span>
        </a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

    </ul>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
        </nav>
        
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">商品上架管理页</h1>          
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4" style="    width: 1630px;height: 700px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">商品上架 & 补货</h6>                
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<table class="message" style="float: left;">
						<tr>
							<td>品牌：</td>
							<td><input type="text" class="pp" placeholder="请输入品牌" list="list"style="width: 250px;"/>
								<datalist id="list">
                							<option>联想</option>
                							<option>惠普</option>
                							<option>戴尔</option>
                							<option>华为</option>
                							<option>小米</option>
                							<option>弘基</option>
            					</datalist>
							</td>
						</tr>
						<tr>
							<td>类型：</td>
							<td><input type="text" class="lx" placeholder="请输入类型" list="lx"style="width: 300px;"/>
								<datalist id = "lx">
									<option>平板电脑</option>
									<option>一体机</option>
									<option>笔记本</option>
									<option>台式机</option>							
								</datalist>
							</td>
						</tr>
						<tr>
							<td>分类：</td>
							<td><input type="text" class="fl" placeholder="请输入分类" list="fl" style="width: 350px;"/>
								<datalist id = "fl">
									<option>平板</option>
									<option>一体机</option>
									<option>轻薄本</option>
									<option>游戏本</option>
									<option>商务本</option>
									<option>家用台式机</option>
									<option>商用台式机</option>
									<option>游戏台式机</option>								
								</datalist>
							</td>
						</tr>
						<tr>
							<td>屏幕尺寸：</td>
							<td><input type="text" class="pm" placeholder="请输入屏幕尺寸" list="pm" style="width: 400px;"/>
								<datalist id = "pm">
									<option>9.0英寸</option>
									<option>10.0英寸</option>
									<option>12.0英寸</option>
									<option>13.0英寸</option>
									<option>14.1英寸</option>
									<option>15.0英寸</option>
									<option>16.0英寸</option>
									<option>17.0英寸</option>
									<option>21.0英寸</option>
									<option>24.0英寸</option>
									<option>27.0英寸</option>								
								</datalist>
							</td>
						</tr>
						<tr>
							<td>处理器：</td>
							<td><input type="text" class="clq" placeholder="请输入处理器" style="width: 450px;"/></td>							
						</tr>
						<tr>
							<td>显卡：</td>
							<td><input type="text" class="xk" placeholder="请输入显卡"style="width: 500px;"/></td>
						</tr>
						<tr>
							<td>描述：</td>
							<td><input type="text" class="ms" placeholder="请输入电脑描述" style="width: 550px;"/></td>
						</tr>
						<tr>
							<td>标签：</td>
							<td><input type="text" class="bq" placeholder="请输入电脑标签" style="width: 500px;"/></td>
						</tr>
						<tr>
							<td>配置信息：</td>
							<td><input type="text" class="pz" placeholder="请输入电脑配置信息" style="width: 450px;"/></td>
						</tr>
						<tr>
							<td>电脑售价：</td>
							<td><input type="text" class="sj" placeholder="请输入电脑售价"/></td>
						</tr>
						<tr>
							<td>图片：</td>
							<td style="width: 300px;"><input type="file"  name="img" id="fileToUpload" class="input-file"/></td>
							<td><a href="javascript:ajaxFileUpload()" style="background: red;padding: 5px 41px;border-radius: 4px;margin-left: -155px;color: #fff;">确定/上传</a></td>
						</tr>
						<tr >
							<td colspan="2"><a href="JavaScript:upDate()" style="padding: 5px 60px;background: #4e73df;color: #fff;border-radius: 4px;margin-left: 80px;">确定/上架</a></td>							
						</tr>
					</table>
					<div  style="float: left;margin-left: 80px;"><img class="photo"  alt="" src="" width="640px" height="400px"></div>				
                </div>
              </div>
            </div>
     	 </div>
    	</div>  
	</div>
 </div>

</body>
<script type="text/javascript">
 //图片上传
	function ajaxFileUpload() {
		$.ajaxFileUpload({
			url : 'fileClass',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'json',
			data : {
				name : $('#fileToUpload').val()
			},
			success : function(data, status) {
				console.log(data);
				var message = data['message'];
				console.log(message);
				var code = data['code'];
				if (code==200) {
					$(".photo").attr("src","images/Uploadingimg/"+data.message);
					$("#Upimg").css("display","none");
					hide();
				}else{
					alert("上传异常！");
				}
			},
			error : function(data, status, e) {
				alert("上传发生异常！");
			}		
		})

		return false;
	}
</script>
<script type="text/javascript">
	function upDate(){
		var pp = $(".pp").val();
		var lx = $(".lx").val();
		var fl = $(".fl").val();
		var pm = $(".pm").val();
		var clq = $(".clq").val();
		var xk = $(".xk").val();
		var ms = $(".ms").val();
		var bq = $(".bq").val();
		var pz = $(".pz").val();
		var sj = $(".sj").val();
		var img = $(".photo")[0].src;
		console.log(img);
		$.post("Putaway",{pp:pp,lx:lx,fl:fl,pm:pm,clq:clq,xk:xk,ms:ms,bq:bq,pz:pz,sj:sj,img:img},function(data){
			setTimeout('myrefresh()',100); //指定100毫秒刷新一次			
		})
	}	
	function myrefresh()
	{
	   window.location.reload();
	}
</script>



</html>

