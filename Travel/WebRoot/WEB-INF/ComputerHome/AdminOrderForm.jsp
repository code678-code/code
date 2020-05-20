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
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
<script src="js/Main/jquery.min.js"></script>
</head>
<style>
	#id{width: 50px;}
	#pp{width: 50px;}
	#lx{width: 80px;}
	#xh{width: 280px;}
	#dd{width: 160px;}
	#zfb{width: 280px;}
	#sj{width: 180px;}
	#je{width: 100px;color: #ff9d00;}
	#wl input{margin: 5px 10px 5px 0;}
	#tj a{    padding: 5px 40px;background: #ff9d00;margin: 5px 0;color: #fff;border-radius: 4px;}
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
            <h1 class="h3 mb-0 text-gray-800">订单管理页 </h1>         
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4" style="    width: 1630px;height: 700px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">订单信息  
                  <a href="" style="margin-left: 100px;font-size: 12px;"></a>
                  <a href="" style="margin-left: 1300px;font-size: 12px;">历史订单</a></h6>                
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<table class="cards">						
					</table>				
				
                </div>
              </div>
            </div>
     	 </div>
    	</div>  
	</div>
 </div>
<script type="text/javascript">
	console.log(${AdminOrderForm});
	var html ='<tr><td id="id">ID</td><td id="pp">品牌</td><td id="lx">类型</td><td id="xh">电脑型号</td><td id="dd">订单ID</td><td id="zfb">收件地址</td><td id="sj">交易时间</td><td id="je">交易金额</td><td id="wl">物流公司</td></tr>'
	for(var i=0;i<${AdminOrderForm}.length;i++){
		html +='<tr>'+
							'<td id="id">'+(i+1)+'</td>'+
							'<td id="pp">'+${AdminOrderForm}[i].brand+'</td>'+
							'<td id="lx">'+${AdminOrderForm}[i].Primarygroup+'</td>'+
							'<td id="xh">'+${AdminOrderForm}[i].configuration+'</td>'+
							'<td id="dd">'+${AdminOrderForm}[i].orderID+'</td>'+
							'<td id="zfb">'+${AdminOrderForm}[i].address+'</td>'+
							'<td id="sj">'+${AdminOrderForm}[i].payTime+'</td>'+
							'<td id="je">¥'+${AdminOrderForm}[i].total+'</td>'+
							'<td id="wl"><input type="text" id="l'+i+'" placeholder="请选择物流公司"/></td>'+
							'<td id="tj"><a href="JavaScript:sub('+i+')">提交</a></td>'+
						'</tr>'	
	}
	$(".cards").html(html);
	//提交
	function sub(i){
	console.log(i);
		var logistics = $("#l"+i+"").val();
		console.log(logistics);
		$.post("upOrder",{Oid:${AdminOrderForm}[i].Oid,logistics:logistics},function(data){
			setTimeout('myrefresh()',100); //指定100毫秒刷新一次
		})
	}
</script>
</body>
<script>
function myrefresh()
{
   window.location.reload();
}
</script>
</html>

