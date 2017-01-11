<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/static/javascript/angularjs.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/angular-app/testscrap.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#myBar{
		display: none;
	}
</style>
<div id="container" ng-app="testScrap" ng-controller="testScrapController">
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-refresh" aria-hidden="true"></i>
			<small>Test Scraping data...</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
		
		<!-- new update -->
		<label>
			Choose Website:
		</label>
		<select class="form-control" ng-model="list" ng-change="getStructure(list)">
			<option value="" selected>...choose...</option>
			<option ng-repeat="list in getSource" ng-bind="list.DOMAIN" value="{{list}}"></option>
		</select>
		
		<lable>Choose URL to Scrape from <i ng-bind="domain" style="color:blue"></i></lable>
		<select class="form-control" ng-model="url">
			<option value="" selected>...URL...</option>
			<option ng-repeat="list in sourceUrl" value="{{list.SOURCE_CATEGORY}}" ng-bind="list.SOURCE_CATEGORY"></option>
		</select>
		<!-- end new update -->
		
	</section>
	<!-- form start here -->
	<div class="testscrap-form" style="margin-left:20px;margin-top:20px;">
		<form class="form-inline">
		  <div class="form-group">
		    <label for="Url">Category-URL</label>
		    <br/>
		    <input type="text" value="{{url}}" class="form-control" id="test-url" name="url" placeholder="url...">
		  </div>
		  <div class="form-group">
		    <label for="Row">Row-Selector</label>
		    <br/>
		    <input type="text" value="{{rows}}" ng-model="rows" class="form-control" id="test-row" name="rowselector" placeholder="row selector">
		  </div>
		  <div class="form-group">
		    <label for="Image">Image-Selector</label>
		    <br/>
		    <input type="text" value="{{selectorImage}}" ng-model="selectorImage" class="form-control" id="test-image" name="imageselector" placeholder="image selector">
		  </div>
		  <div class="form-group">
		    <label for="Image-Attribute">Image-Attribute</label>
		    <br/>
		    <input type="text" value="{{selectorAttr}}" ng-model="selectorAttr" class="form-control" id="image-attribute" name="imageattribute" placeholder="image attribute">
		  </div>
		  <div class="form-group">
		    <label for="Link">Link-Selector</label>
		    <br/>
		    <input type="text" value="{{link}}" ng-model="link" class="form-control" id="test-link" name="linkselector" placeholder="link selector">
		  </div>
		  <div class="form-group">
		    <label for="Title">Title-Selector</label>
		    <br/>
		    <input type="text" value="{{title}}" ng-model="title" class="form-control" id="test-title" name="titleselector" placeholder="title selector">
		  </div>
		  <div class="form-group">
		    <label for="Price">Price-Select</label>
		    <br/>
		    <input type="text" value="{{price}}" ng-model="price" class="form-control" id="test-price" name="priceselector" placeholder="price selector">
		  </div>
		  <button type="submit" class="btn btn-primary" style="margin-top:25px;" ng-click="testScrape()">Scrape</button>
		</form>
	<!-- form end -->
	</div><!-- testscrap-form -->
	<!-- test scrap table -->
	<div class="panel-body">
		<div class="dataTable_wrapper">
			<div class="row">
				<div class="col-xs-12 table-responsive">
				<div class="progress" id="myBar">
				  <div class="progress-bar progress-bar-striped active" role="progressbar"
				  aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width:100%">
				    <label id="label">Loading data...</label>
				  </div>
				</div>
					<table class="table table-bordered  table-hover" id="table">
						<thead>
							<tr style="background-color: #4682B4; color: white;">
								<th>Title</th>
								<th>Image</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="list in getData | limitTo:10">
								<td ng-bind="list.TITLE"></td>
								<td>
									<a href="{{list.URL}}" target="_blank">
										<img src="{{list.IMAGE}}" style="width: 15%; height: 40%"/>
									</a>
									
								</td>
								<td ng-bind="list.PRICE"></td>
							</tr>
						 <%-- <c:forEach items="${model.productlist}" var="element">
							<tr>
								<td><c:out value="${element.title}" /></td>
								<td><c:out value="${element.image}" /></td>
								<td><c:out value="${element.price}" /></td>
								<td><c:out value="${element.url}" /></td>
							</tr>
						 </c:forEach> --%>	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end test scrap table -->
</aside>
</div>


	<script src="${pageContext.request.contextPath}/resources/static/angular-app/map_category.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>