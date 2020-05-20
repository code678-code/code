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
td{margin: 0px;padding: 0px;font-size: 12px;padding-bottom: 10px;}
p{margin: 0px;padding: 0px;}
.id{width: 50px;}
.pp{width: 50px;}
.lx{width: 50px;}
.fl{width: 50px;}
.pm{width: 80px;}
.cl{width: 120px;}
.xk{width: 100px;}
.ms p{width: 410px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
.bq p{width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
.pz{width: 200px;padding-left: 10px;}
.sj{width: 70px;}
.xl{padding-right: 10px;text-align: center;}
#sj{color: #ff9d00;}
#dl{padding: 2px 20px;background: #ff9d00;    border-radius: 4px;color: #fff;}
#js{padding: 2px 20px;background: red;    border-radius: 4px;color: #fff;}
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
            <h1 class="h3 mb-0 text-gray-800">商品管理页</h1>          
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4" style="    width: 1630px;height: 700px;">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">商品信息</h6>                
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<table class="AdminCommodity">

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
	console.log(${AdminCommodity})
	html ="<tr><td class='id'>商品ID</td>"+
							"<td class='pp'>品牌</td>"+
							"<td class='lx'>类型</td>"+
							"<td class='fl'>分类</td>"+
							"<td class='pm'>屏幕尺寸</td>"+
							"<td class='cl'>处理器</td>"+
							"<td class='xk'>显卡</td>"+
							"<td class='ms'>商品描述</td>"+
							"<td class='bq'>商品标签</td>"+
							"<td class='pz'>配置信息</td>"+
							"<td class='sj'>商品售价</td>"+
							"<td class='xl'>商品销量</td>"+
							"<td class='xl'>商品下架</td>"+
							"<td class='xl'>商品补货</td>"+
					"</tr>";
	for(var i=0;i<${AdminCommodity}.length;i++){
		if(${AdminCommodity}[i].tab == 0 ){
			html +="<tr><td class='id'>"+${AdminCommodity}[i].Mid+"</td>"+
								"<td class='pp'>"+${AdminCommodity}[i].brand+"</td>"+
								"<td class='lx'>"+${AdminCommodity}[i].Primarygroup+"</td>"+
								"<td class='fl'>"+${AdminCommodity}[i].Secondarygroup+"</td>"+
								"<td class='pm'>"+${AdminCommodity}[i].size+"</td>"+
								"<td class='cl'>"+${AdminCommodity}[i].processor+"</td>"+
								"<td class='xk'>"+${AdminCommodity}[i].graphicscard+"</td>"+
								"<td class='ms'><p>"+${AdminCommodity}[i].title+"</p></td>"+
								"<td class='bq'><p>"+${AdminCommodity}[i].label+"</p></td>"+
								"<td class='pz'>"+${AdminCommodity}[i].configuration+"</td>"+
								"<td class='sj' id='sj'>¥"+${AdminCommodity}[i].price+".00</td>"+
								"<td class='xl'>"+${AdminCommodity}[i].sales+"</td>"+
								"<td class='xl'><a href='JavaScript:Del("+${AdminCommodity}[i].Mid+")' id='dl'>X</a></td>"+
								"<td class='xl'><a href='putaway' id='js'>+</a></td>"+
						"</tr>";		
		}
	}
	$(".AdminCommodity").html(html);
	//下架
	function Del(id){
		$.get("Del",{Mid:id},function(data){
			setTimeout('myrefresh()',100); //指定100毫秒刷新一次
		})
	}
	
	function myrefresh()
	{
	   window.location.reload();
	}
</script>

</html>

