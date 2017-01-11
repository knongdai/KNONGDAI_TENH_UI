<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<script src="${pageContext.request.contextPath}/resources/static/javascript/configuration.js"></script>
	
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userid" var="userid" />
</sec:authorize>

<script type="text/javascript"> var continueSite = "http://login.knongdai.com/login?continue-site=http://tenh.knongdai.com"</script>
<script src="http://login.knongdai.com/static/script/knongdai_login.js"></script>

<sec:authorize access="isAnonymous()" >
 	<script type="text/javascript"> isAnonymous(continueSite);  </script>
</sec:authorize>

<!-- Line top navbar -->
<style>
.navbar-static-top {
	border: none;
}

</style>


<nav class="navbar navbar-static-top line-navbar-one">
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 divtop">
					<sec:authorize access="isAnonymous()">
						<a href="http://login.knongdai.com/login?continue-site=http://tenh.knongdai.com">
								<i class="fa fa-sign-in" aria-hidden="true"></i> 
								<label>ចូលប្រើគណនី</label>
						</a>
							    		
						<a href="http://login.knongdai.com/register?continue-site=http://tenh.knongdai.com">
							<i class="fa fa-users" aria-hidden="true"></i>
							<label>ចុះឈ្មោះ</label>
						</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<a href="#${pageContext.request.contextPath}/logout" id="kd_logout">
							<i class="fa fa-sign-out"></i>
							<label>ចាកចេញ</label>
						</a>	
						
							<script type="text/javascript">
			                           			 $(function() {
			                           	        	
			                           	        	$("#kd_logout").click(function(e){
			                           	        		deleteCookie();
			                           	        		location.href="/logout";
			                           	        	});
			                           	        	
			                           	        });
	                        </script>
                           			 	
						<a href="${pageContext.request.contextPath}/user/wishlist">
							<label><i class="fa fa-user" aria-hidden="true"></i>&nbsp;<sec:authentication property="principal.username" /></label>
						</a>
						<label>សូមស្វាគមន៍មកកាន់​ តោះទិញ</label>
					</sec:authorize>
				</div>
				
			</div>
		</div>
	</div>

	<div class="container">
		<!-- MAIN MENU CATEGORY -->
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/pages/home/mainmenu.jsp"></jsp:include>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<!-- Top navbar button -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#line-navbar-collapse-1">
				<span class="sr-only">Toggle</span> <span class="fa fa-search"></span>
			</button>
			<!-- left navbar button -->
			<button class="lno-btn-toggle">
				<span class="fa fa-bars"></span>
			</button>
			<!-- Brand image -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/home"> <img alt="Brand"
				src="${pageContext.request.contextPath}/resources/static/images/home/tostenh500.png"
				class="divimg">
			</a>
		</div>
		<!--SEARCH PRODUCT-->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/searching.jsp"></jsp:include>
		<!-- Search For Small Device -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/smallsearchdevice.jsp"></jsp:include>	
		
			<sec:authorize access="isAuthenticated()">
			<!-- Display when logined -->
			<ul class="nav navbar-nav navbar-right lno-socials"  >
				<li>
					<!--Favorite -->
				
					<ul class="nav navbar-nav navbar-right lnt-shopping-cart">
						<li class="dropdown">
							<div class="btn-group" role="group" aria-label="...">
								<div class="" role="">
									<!-- Edit Seak -->
									<button type="button" class="mybtn lnt-cart dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false">
										<span class="fa fa-heart-o " style="color: #de6161;"></span> 
										<sup><span class="badge" style="margin-left:-40px;margin-left: -66px; z-index:-10px margin-top:-20px; background-color:red">{{countFav}}</span></sup>
									</button>
									<!-- SEAK SECTION0N -->
									<ul class="dropdown-menu " role="menu">
										<li>
											<div class="lnt-cart-products">
												<p>Product List<p>
											</div>
										</li>
										<!-- SEAK SECTION -->
				                            <li ng-repeat="fav in favlist | limitTo:5">
				                              <div class="lnt-cart-products">
				                               <a href="{{fav.PRODUCT.URL}}"> <img src="{{fav.PRODUCT.IMAGE}}" class="sm-img"  alt="Product title" target="_blank"></a>
				                                <span class="lnt-product-info"  style="color: black">
				                                  <span class="lnt-product-name"></span>
				                                  <span class="lnt-product-price"> &rarr; {{fav.PRODUCT.PRICE}}</span>
				                                  <button type="button" class="lnt-product-remove btn-link" id="remove{{fav.ID}}" ng-click="unfavourit(fav)">Remove?</button>
				                                </span>
				                              </div>
				                            </li>
				                            <li class="lnt-cart-actions see">
				                             	<a href="${pageContext.request.contextPath}/user/wishlist" class="lnt-view-cart-btn ">See All </a>
				                            </li>
				                            <!-- END SEAK SECTION -->
									</ul>
								</div>
							</div>
						</li>
					</ul> <!-- /.lnt-shopping-cart -->
				</li>
			
				<li>
					<!-- SEAK SECTION -->
					<!--History -->
					<ul class="nav navbar-nav navbar-right lnt-shopping-cart">
						<li>
						<a href="${pageContext.request.contextPath}/user/wishlist"><span class="fa fa-history"></span></a>
						</li>
					</ul>
				</li>
				</a>
			</ul>
	
			<!-- end display when logout -->
		</sec:authorize>
		
			<ul class="nav navbar-nav navbar-right lno-socials" style="margin-top: 20px;">
				<li>
					<div id="fb-root"></div>
					<script>(function(d, s, id) {
					  var js, fjs = d.getElementsByTagName(s)[0];
					  if (d.getElementById(id)) return;
					  js = d.createElement(s); js.id = id;
					  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
					  fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));</script>
					
					
					<div class="fb-share-button" data-href="https://phsarnet.khmeracadymic.org/home/product" data-layout="button_count" data-size="large" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fphsarnet.khmeracadymic.org%2Fhome%2Fproduct&amp;src=sdkpreparse">Share</a></div>            
				</li>
			</ul>
	
		
		
			
	</div>
	<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>