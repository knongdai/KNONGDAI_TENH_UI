<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<div id="container" ng-app="mapApp"
	ng-controller="mapCtrl">

	<aside class="right-side">
		<section class="content-header">
			<h1>
				<i class="fa fa-bars" aria-hidden="true"></i> <small>Mapping Category</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</section>
		
		<div class="col-sm-12">
			<div class="col-sm-2" style="margin-top:20px; padding-left:0px !important">
				<select class="form-control" 
						ng-model="rowSelected" 
						ng-change="limitChange(rowSelected)" 
					    data-ng-options="row.id as row.value for row in rows">
					    <option value="">ITEMS PER PAGE</option>
				</select>
			</div>
			<div class="col-sm-4" style="margin-top:20px; padding-left:0px !important">
				<select class="form-control" 
						ng-model="categorySelected" 
						ng-change="categoryChange(categorySelected)" 
					    data-ng-options="category.ID as category.MAIN_CATEGORY.SUB_CATEGORY + ' > ' + category.SUB_CATEGORY for category in categories">
					    <option value="">ALL CATEGORIES</option>
				</select>
			</div>
			
			<div class="col-sm-2" style="margin-top:20px; padding-left:0px !important">
				<input class="form-control" type="text" placeholder="Search by title..." ng-keyup="searchByTitle($event)" ng-model="filter.title">
			</div>
			<div class="col-sm-4">
				<div id="PAGINATION" class="pull-right"></div>
			</div>
		</div>
		
		<div class="col-sm-12">
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>Thumbnail</th>
			        <th>Title</th>
			        <th>Price</th>
			        <th>Category</th>
			        <th>Type</th>
			        <th>Action</th>
			      </tr>
			    </thead>
			    <tbody id="noProduct" ng-show="isNoProduct">
			    	<tr><td colspan="6">No product to map anymore!!!</td></tr>
			    </tbody>
			    
			    <tbody id="products" ng-show="!isNoProduct">
			      <tr ng-repeat="p in products">
			        <td><a href="{{p.URL}}" target="_blank"><img class="thumbnail" data-zoom-image="{{p.IMAGE}}" ng-src="{{p.IMAGE}}" width="100px" height="100px"></a></td>
			        <td ng-bind="p.TITLE"></td>
			        <td ng-bind="p.PRICE | currency:$:2"></td>
			        <td><select class="form-control" 
								ng-model="updateCategorySeleted" 
								ng-change="udateCategoryChange(updateCategorySeleted, p.ID)" 
						    	data-ng-options="category.ID as category.MAIN_CATEGORY.SUB_CATEGORY + ' > ' + category.SUB_CATEGORY for category in categories">
					    	<option ng-value="{{p.CATEGORY.ID}}" ng-bind="p.MAIN_CATEGORY.SUB_CATEGORY + ' > ' + p.CATEGORY.SUB_CATEGORY"></option>
						</select>
					</td>
			        <td><select class="form-control"
								ng-model="productTypeSeleted" 
								ng-change="productTypeChange(productTypeSeleted, p.ID)" 
						    	data-ng-options="productType.ID as productType.PRODUCT_TYPE for productType in productTypes">
						    	<option value="">Choose Product's Brand</option>
						</select>
					</td>
			        <td>
			        	<button ng-click="publishPost(p.ID)" class="btn btn-primary pull-right"><i title="Publish" class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
			        	<a target="_blank" href="{{p.URL}}" class="btn btn-info pull-right"><i title="Original Post" class="fa fa-external-link" aria-hidden="true"></i></a>
			        </td>
			      </tr>
			    </tbody>
		  </table>
		</div>
		<div class="col-sm-12">
			<div class="col-sm-5"></div>
			<div class="col-sm-2">
				<button ng-show="!isNoProduct" style="width:100%;margin-bottom:20px;" ng-click="publishAllPost()" id="btnSaveAll" class="btn btn-primary pull-right"><i title="Publish" class="fa fa-save" aria-hidden="true"></i> <span> SAVE ALL</span></button>
			</div>
			<div class="col-sm-5"></div>
		</div>
		<div style="clear:both;"></div>
	</aside>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/static/js/jquery.bootpag.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/angular-app/map_category2.js"></script>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/resources/static/js/jquery.elevateZoom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/loadingoverlay.min.js"></script> 



