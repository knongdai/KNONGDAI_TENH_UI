<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="productTypeApp" ng-controller="productTypeCtrl">

	<aside class="right-side">
		<section class="content-header">
			<h1>
				<i class="fa fa-bars" aria-hidden="true"></i> <small>Product Type</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</section>
		
		<div class="col-sm-12">
		
			<button ng-click="addProductType()" data-toggle="modal" data-target="#addleModal" class="btn btn-primary">Add Product Type</button>
			
			<input style="margin-top:10px;" type="text" class="form-control" ng-keyup="onSearchKeyup($event)" ng-model="type" placeholder="Search by type...">
		
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>Product Type</th>
			        <th>Tags</th>
			        <th>Action</th>
			      </tr>
			    </thead>
			    <tbody>
			      	<tr ng-repeat="pt in productTypes">
			      		<td><span ng-bind="pt.PRODUCT_TYPE"></span></td>
			      		<td><span ng-bind="pt.TAG"></span></td>
			      		<td>
			        		<button ng-click="removeProductType(pt.ID)" class="btn btn-primary pull-right"><i title="remove" class="fa fa-trash" aria-hidden="true"></i></button>
			        		<button ng-click="editProductType(this)" data-toggle="modal" data-target="#addleModal" class="btn btn-primary pull-right"><i title="edit" class="fa fa-pencil" aria-hidden="true"></i></button>
			        	</td>
			      	</tr>
			    </tbody>
		  </table>
		</div>
		<div style="clear:both;"></div>
		
		<div class="modal fade" id="addleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="exampleModalLabel"><span ng-bind="productTypeTitle"></span></h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label>Product Type</label>
								<input type="text" class="form-control" ng-model="productType.PRODUCT_TYPE" placeholder="product type name" />
							</div>
							<div class="form-group">
								<label>Tags</label>
								<input type="text" class="form-control" ng-model="productType.TAG" placeholder="tags, separate each tags by comma..." />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								<button type="button" data-dismiss="modal" ng-click="saveProductType()" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</aside>
</div>

<script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/angular-app/productType.js"></script>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/resources/static/js/loadingoverlay.min.js"></script> 
	

