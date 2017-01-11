<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="source_app" ng-controller="sourceController">
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-clone" aria-hidden="true"></i><small>Category
				Sources</small>
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
												data-toggle="modal" data-target="#addleModal"
												data-whatever="@mdo">
												<i class="glyphicon glyphicon-plus"></i>New
											</button>
										</div>

										<div class="col-md-4 pull-right">
											<i class="fa fa-filter" aria-hidden="true"></i>
											<label>FilterBySourceCategory : </label>
											<select ng-model="source" ng-change="filterSourceCategory(source)" data-ng-options="list as list.DOMAIN for list in mainlists">
												<option value="" selected="selected">..Show All....</option>
											</select>
										</div>
									</tr>
								</thead>
						<thead>
							<tr style="background-color: #4682B4; color: white;">
								<th>ID</th>
								<th class="col-md-2">Source-Category</th>
								<th class="col-md-2">status</th>
								<th class="col-md-2">Domain</th>
								<th class="col-md-2">Sub-Category</th>
								<th class="col-md-2">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="list in lists">
								<td>{{list.ID}}</td>
								<td>{{list.SOURCE_CATEGORY}}</td>
								<td>{{list.STATUS}}</td>
								<th>{{list.SOURCE.DOMAIN}}</th>
								<th>{{list.SUB_CATEGORY.SUB_CATEGORY}}</th>
								<td>
									<button ng-click="sendDataToUpdate(list)" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModalEdit" data-whatever="@mdo">
										Edit
									</button>
								
									<button type="button" class="btn btn-danger btn-sm" ng-click="deleteByID(list.ID)">Delete</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="pagination">
						<!-- Display pagination here -->
					</div>
				</div>
			</div>
		</div>
	</div>

</aside>


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
			
						<div class="form-group">
							<label>Source-Category Name</label>
							<input value="{{nsource_category}}" name="nsource_category" ng-model="nsource_category" class="form-control" placeholder="Enter source category name" required />
						</div>
						<div class="form-group">
							<label>Status </label> <br/>
							<input type="radio" name="nstatus" ng-model="nstatus" value="true" ng-checked="nstatus == true" required>True |
							<input type="radio" name="nstatus" ng-model="nstatus" value="false" ng-checked="nstatus == false" required>False 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" name="btnSave" ng-click="updateCategory()">Save</button>
						</div>
				</form>
		</div>
	</div>
</div>
</div>

<!--Modal Add New-->
<div class="modal fade" id="addleModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">New</h4>
			</div>
			<div class="modal-body">
				<form>
						<div class="form-group">
							<label>Choose-Source</label> 
							<select class="form-control" name="main_source_id" ng-model="main_source_id" >
								<option ng-repeat="list in mainlists" value="{{list.ID}}">{{list.DOMAIN}}</option>
							</select>
						</div>
						
						<div class="form-group">
							<label>Choose Sub-Category</label>
							<select class="form-control" name="sub_category_id" ng-model="sub_category_id" >
								<option ng-repeat="list in categorylists" value="{{list.ID}}">{{list.SUB_CATEGORY}}</option>
							</select>
						</div>
						
						<div class="form-group">
							<label>Source-Category Name</label>
							<input name="source_category" ng-model="source_category" class="form-control" placeholder="Enter source category name" required />
						</div>

						<div class="form-group">
							<label>Status </label> <br/>
							<input type="radio" name="status" ng-model="status" value="true" required>True |
							<input type="radio" name="status" ng-model="status" value="false" required>False 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" name="btnSave" ng-click="addNew()">Save</button>
						</div>
				</form>
			</div>
			
		</div>
	</div>


	
	<script src="${pageContext.request.contextPath}/resources/static/angular-app/source_category_app.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>