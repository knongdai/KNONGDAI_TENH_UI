<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="user_app" ng-controller="userController">
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-user-plus" aria-hidden="true"></i><small>User</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>
	<!-- table -->
	<div class="panel-body">
		<div class="dataTable_wrapper">
			<div class="row">
				<div class="col-xs-12 table-responsive">
					<table class="table table-bordered  table-hover">
						<thead>
							<tr>
								<th colspan="12">
									<div class="row">
										<!-- <div class="col-md-3 pull-left">
											<button type="button" class="btn btn-info btn-sm pull-left"
												data-toggle="modal" data-target="#exampleModal"
												data-whatever="@mdo">
												<i class="glyphicon glyphicon-plus"></i>New
											</button>
										</div> -->

										<div class="col-md-4 pull-right">
											<form class="navbar-form" role="search">
												<div class="pull-right" style="margin-top: -8px;">
													<div class="input-group">
														<div class="input-group-btn">
															<input type="text" class="form-control"
																placeholder="Search" name="srch-normal" id="search">
														</div>
														<div class="input-group-btn">
															<button class="btn btn-default search"
																style="height: 34px;" type="submit" name="btnSearch">
																<span class="fa fa-search"></span>
															</button>
														</div>
													</div>
												</div>
											</form>
										</div>
							</tr>
						</thead>
						</div>
						<thead>
							<tr style="background-color: #4682B4; color: white;">
								<th>ID</th>
								<th class="col-md-3">UserName</th>
								<th class="col-md-3">Description</th>
								<th class="col-md-3">Role</th>
								<th class="col-md-2">Action</th>
							</tr>

						</thead>
						<tbody>
							<tr ng-repeat="list in lists">
								
								<td>{{list.ID}}</td>
								<td>{{list.USERNAME}}</td>
								<td>{{list.DESCRIPTION}}</td>
								<td>{{list.ROLE}}</td>
								<td>
									<button type="button" class="btn btn-danger btn-sm" ng-click="deleteByID(list.ID)">Delete</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
</aside>

	

	<script src="${pageContext.request.contextPath}/resources/static/angular-app/user_app.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>