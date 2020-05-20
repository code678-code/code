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
	p{margin: 0px;padding: 0px;}
	td{padding: 5px 0;}
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
          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>搜索
                </button>
              </div>
            </div>
          </form>
        </nav>
        
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">销量管理页</h1>          
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4" style="    width: 1630px;height: 700px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">销量信息<span style="margin-left: 1185px;">合计：￥<span class="je"></span>.00<span class="xl" style="margin-left: 10px;"></span><span class="kc" style="margin-left: 25px;"></span></span></h6>                
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<table class="cards" style="    font-size: 14px;">
						
					</table>
                </div>
              </div>
            </div>
     	 </div>
    	</div>  
	</div>
 </div>
</body>
<script type="text/javascript">
	console.log(${AdminSalesVolume});
	var html ='<tr>'+
							'<td>ID</td>'+
							'<td>品牌</td>'+
							'<td>分类</td>'+
							'<td>描述</td>'+
							'<td>型号</td>'+
							'<td>售价</td>'+
							'<td>销量</td>'+
							'<td>库存</td>'+
						'</tr>';
	var sum = 0;
	var xl = 0;
	var kc = 0;
	for(var i=0;i<${AdminSalesVolume}.length;i++){
		html +='<tr>'+
							'<td style="width: 60px;">'+(i+1)+'</td>'+
							'<td style="width: 60px;">'+${AdminSalesVolume}[i].brand+'</td>'+
							'<td style="width: 70px;">'+${AdminSalesVolume}[i].Secondarygroup+'</td>'+
							'<td style="width: 710px;"><p style="width: 690px;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">'+${AdminSalesVolume}[i].title+'</p></td>'+
							'<td style="width: 400px;">'+${AdminSalesVolume}[i].processor+'-'+${AdminSalesVolume}[i].graphicscard+'-'+${AdminSalesVolume}[i].configuration+'</td>'+
							'<td style="width: 140px;color: #ff8a00;">￥'+${AdminSalesVolume}[i].price+'.00</td>'+
							'<td style="width: 60px;">'+${AdminSalesVolume}[i].sales+'</td>'+
							'<td style="width: 60px;">'+(500-${AdminSalesVolume}[i].sales)+'</td>'+
						'</tr>';
				sum +=	${AdminSalesVolume}[i].price;
				xl +=	${AdminSalesVolume}[i].sales;
				kc +=(500-${AdminSalesVolume}[i].sales);
	}
	console.log(sum);
	$(".kc").text("库存："+kc);
	$(".xl").text("销量："+xl);
	$(".je").text(sum);
	$(".cards").html(html);
</script>
</html>

