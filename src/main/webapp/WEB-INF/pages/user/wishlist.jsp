<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="mywishlist_history">
<head>
	 <sec:authorize access="isAuthenticated()">
	 	<sec:authentication property="principal.userid" var="userid"/>
	 </sec:authorize>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Tos Tenh | Favorite</title>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/angular-app/wishlist_history.js"></script>
	 <!--WISHLIST LIST SEAK STYLE -->
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/wishliststyle.css" />
	<!-- JS Scroll bar -->
	<script>
	$(document).ready(function () {
          if (!$.browser.webkit) {
              $('.wrapper').html('<p>Sorry! Non webkit users. :(</p>');
          }
      });
      </script>
</head>
<body ng-controller="mywishlist_historyCtr"  class="scrollbarbody" id="style-5"	style="background-color: mintcream;"	>
   <nav class="navbar navbar-static-top" >
   <!-- INCLUDE WEB HEADER -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/webheader.jsp"></jsp:include>
    <!-- END -->
    <!-- Search For Small Device -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/smallsearchdevice.jsp"></jsp:include>
      <div class="container navbar navbar-static-top" >
        <div class="row" style="margin:0px;padding: 4px;">
	            <div class="col-md-12 profile" >
	                <div class="col-md-7" >
	               
		                <img class="col-sm-3" style="width: 19%;" src='<sec:authentication property="principal.user_image" />'    class="imgpro pull-left" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" alt="User"/>	 	
		                <h3 class="col-sm-4 " style="padding-top: 19px;">
		                	<sec:authentication property="principal.username"/> 
		                </h3>
		             </div>
		             
		             <div class="col-sm-5 " style="margin-top:20px;">
		                <button class="btn3d btn btn-white btn-lg margintop pull-right" ng-init="getwishlist(${userid})" ng-click="getwishlist(${userid });"><i class="fa fa-list" aria-hidden="true"></i>
		                	WishList
		                </button>

		                <button class="btn3d btn btn-white btn-lg margintop pull-right" ng-click="gethistory(${userid})"><i class="fa fa-history" aria-hidden="true"></i>
		                	History
		                </button>
	                </div>
	             </div>
	           
				<!-- Product List -->
		        <!-- Page Heading -->
		            <div class="col-md-12" >
		               
		                <br>
		            </div>
		        </div>
		        <!-- FAV -->
		        
			    <div class="col-sm-2" ng-repeat="fav in favs" style="padding: 3px;margin-top:-15px;">
			
			    <div>
			    	<span class="label label-danger" ng-hide="hideRemoveHistory" ng-click="removehistory(fav); "><i class="fa fa-times" aria-hidden="true"></i> Remove History</span>
			    </div>
			   	
			        <div class="thumbnail " style="height:303px;">
			            <div class="vender">
			              <a href="{{fav.PRODUCT.SOURCE.SOURCE.DOMAIN}}" target="_blank" >
			              <img src ="{{fav.PRODUCT.SOURCE.SOURCE.LOGO}}" alt="vendor alt" ></a>
			            </div>
			            <a href="{{fav.PRODUCT.URL}}" ng-click="addhistory(${userid}, fav.PRODUCT.ID)"  target="_blank"  >
			             <img src="{{fav.PRODUCT.IMAGE}}" alt="product alt"  class="images1" style="width: 80%;"/>
			             <div class="caption">
			                  <div class="title-des" style="white-space: nowrap;width: 100%;overflow: hidden;text-overflow: ellipsis;">
			                      <h3 style="font-size:17px" style="height:40px;">{{fav.PRODUCT.TITLE | limitTo : 30}}...</h3>
			                  </div>
			              </a>
				          <div class="btn-div" >
				          
				          			<span class="price">{{'$'+fav.PRODUCT.PRICE}}</span><hr>
				          
				               	
				                  	<button type="submit" class="btn btn-primary" ng-click="unfavourit(fav)" ng-hide="hideunfav">
				                  		<span class="fa fa-heart" >&nbsp;</span>Remove</a>
				                  	</button>
				                   	<button type="submit" class="btn btn-primary" ng-click="addfavourit(${userid}, fav.PRODUCT.ID)" ng-hide="hideRemoveHistory">
				                   		<span class="fa fa-heart" >&nbsp;</span>FAVOURIT</a>
				                   	</button>
				                   	
				           </div>	                
			             </div>
			           </div>
			       		
			          </div>
			         	
			      </div>
      			 <!--End Item-->
      			 
            </div>
        </div>
      </div>
   </nav>
   <!-- Menu For Small Devices -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/menusmalldevice.jsp"></jsp:include>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/footer.jsp"></jsp:include>
</body>
</html>