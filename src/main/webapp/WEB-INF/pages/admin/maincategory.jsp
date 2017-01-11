<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="category_app" ng-controller="categoryController">

<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>

			<i class="fa fa-tasks" aria-hidden="true"></i><small>Category</small>
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
										<div class="col-md-3 pull-left">
											<button type="button" class="btn btn-info btn-sm pull-left"
												data-toggle="modal" data-target="#exampleModal"
												data-whatever="@mdo">
												<i class="glyphicon glyphicon-plus"></i>New
											</button>
										</div>

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
								</th>
							</tr>
							</div>
							<tr style="background-color: #4682B4; color: white;">
								<th>ID</th>
								<th class="col-md-2">Category Name</th>
								<th class="col-md-3">Date Create</th>
								<th class="col-md-2">Action</th>
							</tr>

						</thead>
						<tbody>
						
							<tr ng-repeat="list in lists">
								<td>{{list.ID}}</td>
								<td>{{list.CATEGORY}}</td>
								<td>{{list.DATE}}</td>
								
								<td>
									<button type="button" class="btn btn-info btn-sm"
										data-toggle="modal" data-target="#exampleModalEdit"
										data-whatever="@mdo" ng-click="sendDataToUpdate(list)">Edit</button>
									<button type="button" class="btn btn-danger btn-sm" ng-click="deleteByID(list.ID)">Delete</button>
								</td>
							</tr>


						</tbody>
					</table>
					
				</div>
			</div>
			<div class="row">
				<div class="row no-print">
					<div class="col-xs-12">
						<button class="btn btn-primary pull-right"
							onClick="window.print();">
							<i class="fa fa-print"></i> Print
						</button>
					</div>
				</div>

			</div>
		</div>
</aside>

<!-- AddNew Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<form>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">
					</i>New
				</h4>
				<div class="modal-body">
					<div class="form-group">
						<label>Main Category</label> <input type="text" name="mcategory"
							ng-model="mcategory" placeholder="Enter main category"
							class="form-control" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							name="btnSave" ng-click="addNew()">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
<!--Modal Edit-->
<div class="modal fade" id="exampleModalEdit" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">Edit</h4>
				
			</div>
			<div class="modal-body">
				<form>
					<div class="modal-body">
					<div class="form-group">
						<label>Main Category</label> 
						<input type="text" name="category" ng-model="category" value="{{category}}" placeholder="Enter main category" class="form-control" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							name="btnSave" ng-click="updateCategory()">Edit</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
	
	<script src="${pageContext.request.contextPath}/resources/static/angular-app/add_category_app.js"></script>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>