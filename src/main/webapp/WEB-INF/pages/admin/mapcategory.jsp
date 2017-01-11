<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>



<div id="container" ng-app="map_category_app" ng-controller="mapCategoryController">
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
				<h4 class="modal-title" id="exampleModalLabel">Add</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label>Main Category</label> 
						<select class="form-control" name="mcategory" ng-model="mcategory" ng-change="getSub(mcategory)" data-ng-options="main as main.CATEGORY for main in getMainCategoryLists">
						</select>
					</div>
					<div class="form-group">
						<label>Sub One Category</label> 
						<select class="form-control" data-ng-options="one as one.SUB_CATEGORY for one in subOne"  name="onecategory" ng-model="onecategory" ng-change="getSubOne(onecategory)">
							
						</select>
					</div>
					<div class="form-group">
						<label>Sub Two Category</label> 
						<select class="form-control" name="twocategory" ng-model="twocategory" data-ng-options="two as two.SUB_CATEGORY for two in subTwo" ng-change="selectSubTwoID(twocategory)">
							
						</select>
					</div>
					<div class="form-group">
						<label>Choose Product Type </label> 
						<select class="form-control" name="producttype" ng-model="producttype" data-ng-options="product as product.PRODUCT_TYPE for product in productType" ng-change="getProductTypeId(producttype)">
							
						</select>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="addProductByMapOne(twocategory)">Save</button>
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
			<i class="fa fa-bars" aria-hidden="true"></i> 
			<small>Mapping Category</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- table -->
	
	<!-- old -->
<!-- 	<div class="panel-body">
		<div class="row">
			<div class="col-lg-3">
				<div class="dataTable_wrapper">
					<h3>Website</h3>
					<ul class="list-group" ng-repeat="list in getSource">
					  <li class="list-group-item">
					  		<img src="{{list.LOGO}}"/>
							<label>{{list.DOMAIN}}</label> 
							<ul ng-repeat="listsub in list.SOURCE_CATEGORY">
								<li>
									<a href="#" ng-click="getTemProductBySourceId(listsub.ID)">{{listsub.SUB_CATEGORY.SUB_CATEGORY}}</a>
									<span class="badge bg-green">{{listsub.LIST_PRODUCT_TMP.length}}</span>
								</li>
							</ul>
					  </li>
					</ul>
					
				</div>
			</div>
			<div class="col-lg-9 jumbo">
				<div class="dataTable_wrapper">
					<h3>Temperory Data...</h3>
					<div class="row" style="background-color:white; border-radius: 5px;">
						<div class="col-xs-12">
							<form>
								<table class="table">
									<thead>
										<tr>
											<th>Title</th>
											<th>Image</th>
											<th class="col-md-3">Check Products</th>
										</tr>
									</thead>
									<tbody>
										
										<tr style="border-button: 2px solid gray;" ng-hide="hide" ng-repeat="listP in getTemProduct">
											<td>{{listP.TITLE}}</td>
											<td>
												<a href="{{listP.URL}}" target="_blank">
													<img src="{{listP.IMAGE}}" style="width: 25%; height: 25%;"/>
												</a>
											</td>
											
											<td> 
												<input type="checkbox">
											</td>

										</tr>
										<tr>
											<td>
												<button ng-show="hideBtnSave" type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalEdit"
														data-whatever="@mdo" data-toggle="tooltip" data-placement="top" title="Mapping" ng-click="mapOneByOne(listP)">
													Map Product
												</button>
											</td>											
											
											<td>
												<button ng-show="hideBtnSave" type="button" class="btn btn-primary form-control">Delete</button>
											</td>
											<td>
												<button type="button" class="btn btn-primary form-control"
													  ng-show="hideBtnSave" ng-click="addDataToProduct(getTemProduct)">Save All
												</button>
											</td>	
										</tr> 
										<tr>
											<td colspan="3">
												<button type="button" class="btn btn-primary form-control"
													  ng-show="hideBtnSave" ng-click="addDataToProduct(getTemProduct)">Save All
												</button>
											</td>											
										</tr> 
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- old -->
	
	<!-- new -->
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-3">
				<div class="dataTable_wrapper">
					<h3>All Sub Two Category</h3>
					<ul class="list-group" ng-repeat="list in getAllSubTwoCategory">
					  <li class="list-group-item">
							<a href="" ng-click="getTemProductBySourceId(list.ID)" ng-bind="list.SUB_CATEGORY"></a> 
					  </li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 jumbo">
				<div class="dataTable_wrapper">					
					<div class="row">
						<div class="col-lg-6">
							<h3>Temperory Data...</h3>
						</div>
						<div class="col-lg-3" style="margin-top:20px;">
							Filter: 
							<select>
								<option>Select</option>
								<option>Khbuy</option>
								<option>shope168</option>
							</select>		
						</div>
						<div class="col-lg-3" style="margin-top:20px;">
							<input type="text" class="form-controll" placeholder="Search by title">
						</div>
					</div>
					<div class="row" style="background-color:white; border-radius: 5px;">
						<div class="col-xs-12">
							<form>
								<table class="table">
									<thead>
										<tr>
											<th>Title</th>
											<th>Image</th>
											<th>Source</th>
											<th class="col-md-3">Check Products</th>
										</tr>
									</thead>
									<tbody>
										
										<tr style="border-button: 2px solid gray;" ng-hide="hide" ng-repeat="listP in getTemProduct">
											<td>
												{{listP.TITLE}}
											</td>
											<td>
												<a href="{{listP.URL}}" target="_blank">
													<img src="{{listP.IMAGE}}" style="width: 25%; height: 25%;"/>
												</a>
											</td>
											<td>
												<img src="{{listP.SOURCE.SOURCE.LOGO}}" style="width: 50%; height: 50%;"/>
											</td>
											
											<td> 
												<input type="checkbox" ng-click="checkProducts(listP)">
											</td>

										</tr>
										<tr>
											<td>
												<button ng-show="hideBtnSave" type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#exampleModalEdit"
														data-whatever="@mdo" data-toggle="tooltip" data-placement="top" title="Mapping" ng-click="mapOneByOne()">
													Map Product
												</button>
											</td>											
											
											<td>
												<button ng-show="hideBtnSave" type="button" class="btn btn-primary form-control">Delete</button>
											</td>
											<td colspan="2">
												<button type="button" class="btn btn-primary form-control"
													  ng-show="hideBtnSave" ng-click="addDataToProduct(getTemProduct)">Save All
												</button>
											</td>	
										</tr> 
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- new -->	
</aside>
</div>

	<script src="${pageContext.request.contextPath}/resources/static/angular-app/map_category.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>
	
