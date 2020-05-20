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
</head>
<style>
	.id{width: 80px;text-align: center;}
	.name{width: 150px;}
	.password{width: 150px;}
	.phone{width: 150px;}
	.address{width: 500px;}
	.delete{width: 100px;text-align: center;}
	td{padding: 8px 0;}
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
            <h1 class="h3 mb-0 text-gray-800">用户管理页面</h1>          
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4" style="    width: 1630px;height: 700px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">用户信息</h6>                
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<table class="message" style="float:left;">
						
						
					</table>
				
					<div  style="width: 770px;height: 600px;float: left;margin-left: 40px;">
						<table class="user">							
						</table>
					</div>
                </div>
              </div>
            </div>
     	 </div>
    	</div>  
	</div>
 </div>

</body>
<script type="text/javascript">
	console.log(${UserMessage});
	var html = "<tr><td class='id'>ID</td><td class='name'>用户名</td><td class='password'>用户密码</td></tr>";
	for(var i=0;i<${UserMessage}.length;i++){
		html +='<tr><td class="id">'+${UserMessage}[i].id+'</td><td class="name">'+${UserMessage}[i].name+'</td><td class="passowrd">'+${UserMessage}[i].password+'</td>'+

					'<td class=""><a href="JavaScript:detailedInformation('+${UserMessage}[i].name+')" style="color: #fff;background: red; padding: 5px 45px;border-radius: 6px;margin-right: 70px;">详细信息</a></td>'+
					'<td class="delete"><a href="JavaScript:remove('+${UserMessage}[i].id+')" style="color: #fff;background: red; padding: 5px 45px;border-radius: 6px">X</a></td></tr>';
					
	}
	$(".message").html(html);
	//用户详细信息查询
	function detailedInformation(data){
		console.log(data);
		$.get("detailedInformation",{name:data},function(data){
			console.log(data);
			var html ="<tr><td>收件人姓名</td><td>收件人电话</td><td>收件人地址</td></tr>"
			for(var i=0;i<data.length;i++){
				html +='<tr>'+
								'<td style="width: 100px;">'+data[i].name+'</td>'+
								'<td style="width: 150px;">'+data[i].phone+'</td>'+
								'<td>'+data[i].address+'</td>'+
							'</tr>';
			
			}
			$(".user").html(html);
		})
	}
	//删除用户
	function remove(data){
		console.log(data);
		$.get("remove",{id:data},function(data){
			console.log(data);
			setTimeout('myrefresh()',100); //指定100毫秒刷新一次
		})
	}
		function myrefresh()
		{
		   window.location.reload();
		}
</script>

</html>

