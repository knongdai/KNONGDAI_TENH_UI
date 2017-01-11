<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>
	<%
		String title = (String)request.getAttribute("title");
		if(title != null){
			out.print(title);
		}
		else
		{
			out.print("PHSARNET | Admin-Page");	
		}
	%>
</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/AdminLTE.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/skin/_all-skins.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/mystyle.css" />
<!-- AngualarJS -->
<script src="${pageContext.request.contextPath}/resources/static/javascript/configuration.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/javascript/angularjs.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/javascript/scriptdata.js"></script>
</head>
<body class="skin-blue">
	<div class="wrapper">
		<!--navbar-->
		<header class="main-header"> <a href="${pageContext.request.contextPath}/admin/dashboard"
			class="logo"> <span class="logo-mini"><b>A</b>LT</span> <span
			class="logo-lg"><b>Tos Tenh</b></span>
		</a> <nav class="navbar navbar-static-top">
		<!-- <ul class="dropdown list-unstyled msg_list">
			<li role="presentation" class="dropdown pull-left">
				<a href="javascript:;" class="dropdown-toggle info-number pull-left"
					data-toggle="dropdown" aria-expanded="false"
					style="color: white; margin-top: 15px;"> 
					<i class="fa fa-envelope-o fa-2x"></i> 
					<span class="badge bg-green">1</span>
				</a> 
				
				<ul id="menu1" class="dropdown-menu list-unstyled msg_list " role="menu">
					<li class="pull-left">
						<a> 
							<span> 
								<span>khbuy.com</span> 
								<span class="time">3 mins ago</span>
							</span> 
							<span class="message"> have been changed structure...! </span>
						</a>
					</li>
				</ul>
			</li>
		</ul> -->
		<div class="navbar-custom-menu">
			<%-- <ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="${pageContext.request.contextPath}/resources/static/images/avatar3.png" class="user-image"
						alt="User Image"> <span class="hidden-xs">Admin</span>
				</a>
					<ul class="dropdown-menu">
						<li class="user-header"><img
							src="resources/static/images/avatar3.png" class="img-circle"
							alt="User Image">
							<p>
								Admin <small>Member since Nov. 2012</small>
							</p></li>
						<li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</div>
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/logout?success" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul> --%>
		</div>
		</nav> 
		</header>
		<!---->
		<!--main menu-->
		<aside class="main-sidebar"> <section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/resources/static/images/avatar3.png" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Hello,Admin</p>
				<a href="#" style="color: #f9fafc;"><i
					class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!--menu-->
		<ul class="sidebar-menu">
			<!-- Sitting -->
			<li class="treeview">
				<a href="#"> <i class="fa fa-cog"></i>
					<span>Setting</span> 
					<i class="fa fa-chevron-circle-right pull-right"></i>
				</a>
				
				<ul class="treeview-menu">
					<li class="treeview">
						<a href="#"> 
							<i class="fa fa-files-o" aria-hidden="true"></i>
							<span>Manage Category</span> 
							<i class="fa fa-chevron-circle-right pull-right"></i>
						</a>
						
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath}/admin/maincategory">
								<i class="fa fa-check-circle-o"></i>Main Category</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/admin/subonecategory">
								<i class="fa fa-check-circle-o"></i>Sub One Category</a>
							</li>
							
							<li>
								<a href="${pageContext.request.contextPath}/admin/subtwocategory">
								<i class="fa fa-check-circle-o"></i>Sub two Category</a>
							</li>
						</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/admin/addmodule"><i class="fa fa-check-circle-o"></i>
							Module</a></li>
					
					<li> --%>
					<li>
						<a href="#">
							<i class="fa fa-file-word-o" aria-hidden="true"></i>
							<span>Manage Website</span>
							<i class="fa fa-chevron-circle-right pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath}/admin/source">
								<i class="fa fa-check-circle-o"></i>Source</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/admin/sourcecategory">
								<i class="fa fa-check-circle-o"></i>Source-Category</a>
							</li>
						</ul>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/admin/mapcategory">
							<i class="fa fa-puzzle-piece" aria-hidden="true"></i>
							Mapping Category
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/admin/testscrap">
							<i class="fa fa-refresh" aria-hidden="true"></i>
							Test Scrap Data
						</a>
					</li>
					
				</ul></li>
			<!-- User -->
			<li class="treeview">
				<a href="#"> <i class="fa fa-user-plus"></i>
					<span>User</span> 
					<i class="fa fa-chevron-circle-right pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li><a href="${pageContext.request.contextPath}/admin/user"><i class="fa fa-check-circle-o"></i>
							User Detials</a></li>
					
					<li><a href="${pageContext.request.contextPath}/logout?success"><i class="fa fa-check-circle-o"></i>Sign
							Out</a></li>
				</ul>
			</li>
		</ul>
		</section> 
	</aside>