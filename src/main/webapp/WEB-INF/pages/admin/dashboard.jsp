
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>


<div id="container" ng-app="dashboard_app" ng-controller="dashboardController">
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-dashboard"></i>
			<small>Dashboard</small>
		</h1>
	</section>
	<!-- table -->
	<div class="panel-body" id="contain-dashboard">
		
			
		<div class="row">
			<div class="col-md-4" id="module">

				<h3>
					<i class="fa fa-desktop" aria-hidden="true"></i>
					Module
				</h3>
				<ul class="list-group" ng-repeat="list in getSource">
				  	<li class="list-group-item">
				  		<img src="{{list.LOGO}}" style="width: 15%; height: 15%;"/>
					    <span class="badge">{{list.SOURCE_CATEGORY.length}} URL</span>
					    <span ng-bind="list.DOMAIN"></span>
				  	</li>
				</ul>
				
			</div>
			<div class="col-md-4" id="category">
				<h3>
					<i class="fa fa-files-o" aria-hidden="true"></i>
					Categories
				</h3>
				<ul class="list-group" ng-repeat="list in getMainCategories">
				  	<li class="list-group-item">
					    <span class="badge" ng-mouseover="showCategory()">
					    	{{list.SUB_CATEGORY.length}} sub-category
					    </span>
					   <span ng-bind="list.CATEGORY"></span>
				  	</li>
				</ul>
			</div>
			<div class="col-md-4" id="green">
				<h3>
					<i class="fa fa-database" aria-hidden="true"></i>
					<!-- <i class="fa fa-pie-chart" aria-hidden="true"></i> -->
					Products
				</h3>
				<div class="row">
					<ul class="list-group">
						<li class="list-group-item">
						    <a href="#" class="badge" id="trigger" style="background-color: green;">{{getProducrtsCurrentDate.length}} item</a>
						    New Products
					  	</li>
					  	<li class="list-group-item">
						    <span class="badge">{{totalProducts.TOTAL_COUNT}} item</span>
						    Total Products
					  	</li>
					</ul>
				</div>
				<h3>
					<i class="fa fa-database" aria-hidden="true"></i>
					<!-- <i class="fa fa-pie-chart" aria-hidden="true"></i> -->
					Temporary Products
				</h3>
				<div class="row">
					<ul class="list-group">
						<li class="list-group-item">
						    <span class="badge">{{getPTrue + getPFalse}} item</span>
						    Total Products
					  	</li>
					  	<li class="list-group-item">
						    <span class="badge">{{getPTrue}} item</span>
						    Products not yet mapping
					  	</li>
					  	<li class="list-group-item">
						    <a href="" class="badge" ng-click="deleteProductsByStatus()">Clear now...!</a>
						    <span class="badge">{{getPFalse}} item</span> 
						    Products Mapped
					  	</li>
					  	
					</ul>
				</div>
			</div>
		</div>
		<section class="content-header">
			<h1>
				<i class="fa fa-bar-chart" aria-hidden="true"></i>
				<small><u><i>Statistic product</i></u></small>
			</h1>
		</section>

		<div class="row">
			<div id="chartContainer" style="height:350px; width:100%;">
			</div>
		</div>

	</div>
</aside>
</div>


<script src="${pageContext.request.contextPath}/resources/static/angular-app/dashboard_app.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/javascript/canvasjs.min.js"></script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>

