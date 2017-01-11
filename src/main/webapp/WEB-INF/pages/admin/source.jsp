<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="source_app" ng-controller="sourceController">
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-clone" aria-hidden="true"></i>
			<small>Sources</small>
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
						<thead>
							<tr style="background-color: #4682B4; color: white;">
								<th class="col-md-1">Domain</th>
								<th class="col-md-1">Logo</th>
								<th class="col-md-1">Rows</th>
								<th class="col-md-1">Image-Selector</th>
								<th class="col-md-1">Image-Attribute</th>
								<th class="col-md-1">Link</th>
								<th class="col-md-1">Title</th>
								<th class="col-md-1">Price</th>
								<th class="col-md-1">Link-Prefix</th>
								<th class="col-md-1">Img-Prefix</th>
								<th class="col-md-1">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="list in lists">
								<td>{{list.DOMAIN}}</td>
								<td>{{list.LOGO | limitTo:5}}...</td>
								<td>{{list.ROWS | limitTo:5}}...</td>
								<td>{{list.SELECTOR_IMAGE | limitTo: 5}}...</td>
								<td>{{list.IMAGE_ATTRIBUTE | limitTo: 5}}...</td>
								<td>{{list.LINK | limitTo: 5}}...</td>
								<td>{{list.TITLE | limitTo: 5}}...</td>
								<td>{{list.PRICE | limitTo: 5}}...</td>
								<td>{{list.PREFIX_LINK | limitTo: 5}}...</td>
								<td>{{list.PREFIX_IMAGE | limitTo: 5}}...</td>
								<td>
									<button ng-click="sendDataToUpdate(list)" type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModalEdit" data-whatever="@mdo">
										Edit
									</button>
								
									<button type="button" class="btn btn-danger btn-sm" ng-click="deleteByID(list.ID)">Delete</button>
								</td>
							</tr>
						</tbody>
					</table>
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
						<label>Domain</label>
						<input type="text" value="{{ndomain}}" ng-model="ndomain"  class="form-control" placeholder="Enter domain" required />
					</div>
					<div class="form-group">
						<label>Logo</label>
						<input type="text" value="{{nlogo}}" ng-model="nlogo" type="text"  class="form-control" placeholder="Enter logo" required />
					</div>
					<div class="form-group">
						<label>Rows</label>
						<input value="{{nrows}}" ng-model="nrows" class="form-control" placeholder="Enter rows" required />
					</div>
					<div class="form-group">
						<label>Image-Selector</label>
						<input value="{{nimg_selector}}" ng-model="nimg_selector" type="text" class="form-control" placeholder="Enter image selector" required />
					</div>
					<div class="form-group">
						<label>Image-Atribute</label>
						<input value="{{nimg_attribute}}" ng-model="nimg_attribute" type="text" class="form-control" placeholder="Enter image attribute" required />
					</div>
					
					<div class="form-group">
						<label>Link</label>
						<input value="{{nlink}}" ng-model="nlink" type="text" class="form-control" placeholder="Enter link" required />
					</div>
					
					<div class="form-group">
						<label>Title</label>
						<input value="{{ntitle}}" ng-model="ntitle" type="text" class="form-control" placeholder="Enter title" required />
					</div>
					
					<div class="form-group">
						<label>Price</label>
						<input value="{{nprice}}" ng-model="nprice" type="text" class="form-control" placeholder="Enter price" required />
					</div>
					
					<div class="form-group">
						<label>Link Prefix</label>
						<input value="{{nlinkprefix}}" ng-model="nlinkprefix" type="text" class="form-control" placeholder="Enter link prefix" />
					</div>
					
					<div class="form-group">
						<label>Image Prefix</label>
						<input value="{{nimgprefix}}" ng-model="nimgprefix" type="text" class="form-control" placeholder="Enter image prefix" />
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="updateCategory()">Update</button>
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
				<h4 class="modal-title" id="exampleModalLabel">Edit</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label>Domain</label>
						<input type="text" name="domain" ng-model="domain"  class="form-control" placeholder="Enter domain" required />
					</div>
					<div class="form-group">
						<label>Logo</label>
						<input type="text" name="logo" ng-model="logo" type="text"  class="form-control" placeholder="Enter logo" required />
					</div>
					<div class="form-group">
						<label>Rows</label>
						<input name="rows" ng-model="rows" class="form-control" placeholder="Enter rows" required />
					</div>
					<div class="form-group">
						<label>Image-Selector</label>
						<input name="img_selector" ng-model="img_selector" type="text" class="form-control" placeholder="Enter image selector" required />
					</div>
					<div class="form-group">
						<label>Image-Atribute</label>
						<input name="img_attribute" ng-model="img_attribute" type="text" class="form-control" placeholder="Enter image attribute" required />
					</div>
					
					<div class="form-group">
						<label>Link</label>
						<input name="link" ng-model="link" type="text" class="form-control" placeholder="Enter link" required />
					</div>
					
					<div class="form-group">
						<label>Title</label>
						<input name="title" ng-model="title" type="text" class="form-control" placeholder="Enter title" required />
					</div>
					
					<div class="form-group">
						<label>Price</label>
						<input name="price" ng-model="price" type="text" class="form-control" placeholder="Enter price" required />
					</div>
					
					<div class="form-group">
						<label>Link Prefix</label>
						<input name="prefixlink" ng-model="prefixlink" type="text" class="form-control" placeholder="Enter Link Prefix" />
					</div>
					
					<div class="form-group">
						<label>Image Prefix</label>
						<input name="prefiximage" ng-model="prefiximage" type="text" class="form-control" placeholder="Enter Image Prefix" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="addNew()">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/static/angular-app/source_app.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>