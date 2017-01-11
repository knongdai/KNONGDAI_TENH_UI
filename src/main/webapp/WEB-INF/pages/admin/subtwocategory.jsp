<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>



<div id="container" ng-app="category_app" ng-controller="categoryController">

<!-- AddNew Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
					<form>
						<div class="form-group">
							<label>Choose Main Category</label> 
							<select class="form-control" name="main_category" ng-model="main_category" >
								<option ng-repeat="list in mainlists" value="{{list.ID}}">{{list.SUB_CATEGORY}}</option>
							</select>
						</div>
						<div class="form-group">
							<label>Sub Category Name</label>
							<input name="sub_category" ng-model="sub_category" class="form-control" placeholder="Enter sub category" required />
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" name="btnSave" ng-click="addNew()">Save</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
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
						<div class="form-group">
							<label>Sub Category Name</label>
							<input value="{{category}}" name="category" ng-model="category" class="form-control" placeholder="Enter sub category" required />
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" name="btnSave" ng-click=updateCategory()>Update</button>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>

<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>

			<i class="fa fa-tasks" aria-hidden="true"></i><small>Sub Two Category</small>
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
											<i class="fa fa-filter" aria-hidden="true"></i>
											<label>FilterBySubOneCategory : </label>
											<select name="mcategory" ng-model="mcategory" 
												ng-change="filterSubCategory(mcategory)" 
												data-ng-options="main as main.SUB_CATEGORY for main in getMainCategoryLists">
												<option value="" selected="selected">..Show All.....</option>
											</select>
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
								<td>{{list.SUB_CATEGORY}}</td>
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
					<div id="pagination">
						<!-- Display pagination here -->
					</div>
				</div>
			</div>
			
		</div>
</aside>



<script src="${pageContext.request.contextPath}/resources/static/angular-app/add_sub_two_category_app.js"></script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>


