
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myCompareApp">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/header.jsp"></jsp:include>
	<title>Shopping Mall</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/comparestyle.css" />
	 <!--About Angular  -->
	 	<script src="${pageContext.request.contextPath}/resources/static/angular-app/compare.js" ></script>
	  <!--DROP RESULT BOX--> 
	<script type="text/ng-template" id="customTemp.html">
	 	<a>
	     	<span bind-html-unsafe="match.label | typeaheadHighlight:query"></span>
	      		 
	    </a>
	</script>
</head>
<body ng-controller="myCompareCtr" >
		<!-- Line top navbar -->
	    <nav class="navbar navbar-static-top line-navbar-one">
	      <div class="header"> 
	            <div class="container">
	              <div class="row">
	                <div class="col-sm-6 divtop" >
	                  <a href="#" class="login"  data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Login</a>
	                  <a href="http://www.khmeracademy.org/register" class="login"  target="new" ><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Register</a>
	                  <a href="#"> </a>
	                  <span>Hi,Welcome{{name}}</span>
	                </div>
	                <div class="col-sm-6 divtop">
	                    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/images/home/cam.gif" class="lan pull-right" /></a>
	                    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/images/home/eng.gif" class="lan pull-right"  /></a>
	                </div>
	              </div>
	            </div>
	      </div>
	      
	      <div class="container">
	        <!-- MAIN MENU CATEGORY -->
	        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/home/mainmenu.jsp"></jsp:include>
	        <!-- Brand and toggle get grouped for better mobile display -->
	        <div class="navbar-header">
	          <!-- Top navbar button -->
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#line-navbar-collapse-1">
	            <span class="sr-only">Toggle</span>
	            <span class="fa fa-search"></span>
	          </button>
	          <!-- left navbar button -->
	          <button class="lno-btn-toggle">
	            <span class="fa fa-bars"></span>
	          </button>
	          <!-- Brand image -->
	          <a class="navbar-brand" href="#">
	            <img alt="Brand" src="${pageContext.request.contextPath}/resources/static/images/home/logo.png">
	          </a>
	        </div>
	    <!--SEARCH PRODUCT-->
	    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/searching.jsp"></jsp:include>  
	     	  <ul class="nav navbar-nav navbar-right lno-socials">
	            <li><a href="#" class="facebook"><i class="fa fa-facebook-square facebook" aria-hidden="true"></i></a></li>
	            <li><a href="#" class="twitter"><i class="fa fa-google-plus-square google" aria-hidden="true"></i></a></li>
	          </ul>
	        </div><!-- /.navbar-collapse -->
	      </div><!-- /.container -->
	   <!-- START COMPARE PRICE PRODCUT -->
	   <div class="container">
	   	  <div class="row">
		   	   	<div class="col-sm-12">
		   	   	<h2>Compare Product</h2>
		   	   	<hr>
		   	   	<!-- Div compare -->
		   	   	<div class="col-sm-4 nonepadding">
		   	   		<h4 class="compareheader">Compare Items</h4>
		   	   		<div >
		   	   			<form class="form-inline" style="text-align:center;">
						  <div class="form-group">
						     <select  class="source" ng-model="mainCateId">
						     	
						     	<option ng-repeat="src in source"  value="{{src.ID}}">{{src.DOMAIN}}</option>
						     </select>
						  </div>
						  <div class="form-group">
						     <input type="text" class="searchbox" ng-change="findProductByTitle()" placeholder="Search product..." load-on-focus='false' ng-model="proname"  typeahead="c as c.TITLE for c in proData | filter:$viewValue | limitTo:10" typeahead-min-length='1'  typeahead-template-url="customTemp.html"  / >
						     <button type="submit" class="btn-sm btn btnsearch" ><i class="fa fa-search" aria-hidden="true"></i></button>
						  </div>
						 
						</form>
		   	   		</div>
		   	   		<div>
		   	   			<div class="row">
							 <div class="col-sm-6 img" >
							 	 <img src="${pageContext.request.contextPath}/resources/static/images/home/map.png" alt="Trolltunga Norway" width="100%" height="100%">
							  </div>
							 <div  class="col-sm-6"  >
							  	<div class="desc">
						  			Price:<span class="red">20$</span>
						  			<p>Product Name:ddf</p>
						  			<p>Website:kh</p>
						  			<button class="btn btn-danger btn-sm">Add Favorite</button>
							  	</div>
							 </div>
		   	   			</div>
		   	   			
		   	   		</div>
		   	   	
		   	   	</div>
		   	   	<div class="col-sm-4 nonepadding">
		   	   		<h4 class="compareheader">Compare Items</h4>
		   	   		<div >
		   	   			<form class="form-inline" style="text-align:center;">
						  <div class="form-group">
						     <select  class="source">
						     		<option ng-repeat="src in source"  value="{{src.ID}}">{{src.DOMAIN}}</option>
						     </select>
						  </div>
						  <div class="form-group">
						      <input type="text" class="searchbox" ng-change="findProductByTitle()" placeholder="Search product..." load-on-focus='false' ng-model="proname"  typeahead="c as c.TITLE for c in proData | filter:$viewValue | limitTo:10" typeahead-min-length='1'  typeahead-template-url="customTemp.html"  / >
						     <button type="submit" class="btn-sm btn btnsearch"><i class="fa fa-search" aria-hidden="true"></i></button>
						  </div>
						 
						</form>
		   	   		</div>
		   	   		<div>
		   	   			<div class="row">
							 <div class="col-sm-6 img" >
							 	 <img src="${pageContext.request.contextPath}/resources/static/images/home/map.png" alt="Trolltunga Norway" width="100%" height="100%">
							  </div>
							 <div  class="col-sm-6"  >
							  	<div class="desc">
						  			Price:<span class="red">20$</span>
						  			<p>Product Name:ddf</p>
						  			<p>Website:kh</p>
						  			<button class="btn btn-danger btn-sm">Add Favorite</button>
							  	</div>
							 </div>
		   	   			</div>
		   	   			
		   	   		</div>
		   	   	</div>
		   	   	<div class="col-sm-4 nonepadding" >
		   	   		<h4 class="compareheader">Compare Items</h4>
		   	   		<div >
		   	   			<form class="form-inline" style="text-align:center;">
						  <div class="form-group">
						      <select  class="source">
						     		<option ng-repeat="src in source"  value="{{src.ID}}">{{src.DOMAIN}}</option>
						      </select>
						  </div>
						  <div class="form-group">
						      <input type="text" class="searchbox" ng-change="findProductByTitle()" placeholder="Search product..." load-on-focus='false' ng-model="proname"  typeahead="c as c.TITLE for c in proData | filter:$viewValue | limitTo:10" typeahead-min-length='1'  typeahead-template-url="customTemp.html"  / >
						     <button type="submit" class="btn-sm  btnsearch" ><i class="fa fa-search" aria-hidden="true"></i></button>
						  </div>
						 
						</form>
		   	   		</div>
		   	   		<div>
		   	   			<div class="row">
							 <div class="col-sm-6 img" >
							 	 <img src="${pageContext.request.contextPath}/resources/static/images/home/map.png" alt="Trolltunga Norway" width="100%" height="100%">
							  </div>
							 <div  class="col-sm-6"  >
							  	<div class="desc">
						  			Price:<span class="red">20$</span>
						  			<p>Product Name:ddf</p>
						  			<p>Website:kh</p>
						  			<button class="btn btn-danger btn-sm">Add Favorite</button>
							  	</div>
							 </div>
		   	   			</div>
		   	   			
		   	   		</div>
		   	   	</div>
		   	   	
	   	   	</div>
	   	  </div>
	   </div>
	      
	      
	      <!-- Footer -->
		   <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/menusmalldevice.jsp"></jsp:include>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/footer.jsp"></jsp:include>
</body>
</html>