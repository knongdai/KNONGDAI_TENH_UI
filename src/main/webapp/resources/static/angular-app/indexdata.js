var app = angular.module('myindexApp', [ 'ui.bootstrap']);

		app.controller(
				'myindexCtr',
				function($scope, $http,$rootScope) {
					
					$scope.pro1 = [];
					$scope.pro2 = [];
					$scope.proWebsitelength=[];
					$scope.lastProductLength = [];
					$scope.ProHisLength=[];
					$scope.websiteId='';
					$scope.sourceId;
					$scope.mcategoryId=0;

					
					var userid = document.getElementById("getUserId").value;
					
					
					$http.defaults.headers.common.Authorization = 'Basic ZGV2OiFAI2FwaQ==' ;
					$scope.articles = [];
					/*
					 * For Display in List Favorite 5 Product
					 * =======================================
					 */
					$scope.getwishlistlist = function(userid){
						$http({
							method:'GET',
							url:URL_API+'farvorite?usreid='+userid+'&page=1&limit=5',
							headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
						
						}).then(function(response){
							
							$scope.favlist=response.data.DATA;
							
						},function(res){
							//console.log(res);
						});	
					}
					//Get Source website
					$scope.getSource=function(){
						$http({
							method:'GET',
							url:URL_API+'source/'
						}).then(function(response){
							
							$scope.source=response.data.DATA;
							$scope.sourceId=$scope.source[0].ID;
							
							$scope.getProbyWebsite();
						},function(res){
							console.log(res);
						});			
					}
					
					// get lastest product all
					$scope.getLastPro = function() {
						
						$http({
									method : 'GET',
									url : URL_API+'product/get-all-products?userid='+userid+'&page=1&limit=40'
								}).then(function(response) {
								$scope.lastpro = response.data.DATA;
								for(var i=0; i<($scope.lastpro.length)/2; i++)
									$scope.lastProductLength.push(i);
							}, function(response) {
								console.log('response', response);
							});
					}
					
					//get all product from history
					$scope.getProHis = function(){
						$http({
							method:'GET',
							url: URL_API+'product/get-by-history?userid='+userid+'&page=1&limit=40'
						}).then(function(response){
							$scope.getProByHistory = response.data.DATA;
							console.log($scope.getProByHistory );
							for(var i=0; i<($scope.getProByHistory.length)/2; i++)
								$scope.ProHisLength.push(i);
							console.log($scope.ProHisLength+"get hisgory");
						},function(err){
							console.log(err);
						});
					}
					
					//get lastest product by website		
					$scope.getProbyWebsite = function(){
						$http({
							method:'GET',
							url:URL_API+'product/find-product-by-website?userid='+userid+'&sourceid='+$scope.sourceId+'&page=1&limit=40'
						}).then(function(response){
							
							$scope.proWebsite=response.data.DATA;
							
							if($scope.proWebsite!=null){
								for(var i=0; i<($scope.proWebsite.length)/2; i++)
									$scope.proWebsitelength.push(i);
							}
							else{
								//$scope.proWebsitelength=[];
								$scope.proWebsite=null;
							}
						},function(response){
							console.log(response);
						});
					}
					
					// FILTER LASTEST PRODUCT BY WEBSITE 
					$scope.getSourceId = function(e) {
						$scope.sourceId=e.target.attributes[2].value;
						$scope.getProbyWebsite($scope.sourceId);
						
					}
					
					// get Main Category
					$scope.getmainCategory = function() {
						$http(
								{
									method : 'GET',
									url : URL_API+'main-category/get-sub-category-list/'
								}).then(function(response) {
									$scope.maincategory = response.data.DATA;
								}, function() {
									console.log(response);
								});
					}

					// find product by title
					$scope.findProductByTitle = function() {
						$http(
								{
									method : 'GET',
									url:URL_API+'product/find-product-by-title?userid='+userid+'&category_id='+$scope.mcategoryId+'&title='+$scope.title+'&page=1&limit=200'
								}).then(function(response) {
									$scope.proSearch = response.data.DATA;
									console.log($scope.proSearch+'ffff');
								}, function(response) {
									console.log(response);
								});

					}
					
				
					
					//FUNCTION SEARCH TITLE LINK To PRODUCT PAGE
					$scope.searchTitle=function(){
						if($scope.title!=null && typeof $scope.title === 'object'){
								$scope.title=$scope.title.TITLE;
						}
						if($scope.title!=null){
							location.href = '/home/product?category_id='+$scope.mcategoryId+'&title='+$scope.title;
						}
						
					}
					
					 
						
						
						/*
						 * =======================================
						 * for total number of favorites
						 * =======================================
						 */
						
						$scope.getwishlist = function(userid){
							
							$http({
							
								method:'GET',
								url:URL_API+'farvorite?usreid='+userid+'&page=1&limit=10000',
								headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
							
							}).then(function(response){
								
								$scope.favs=response.data.DATA;
								$scope.getwishlistlist(userid);
								
							},function(res){
								//console.log(res);
							});	
						}
						
						/*
						 * ==================================
						 * Objective : Remove FAVOURITES
						 * ================================== 
						 */
						$scope.unfavourit=function(fav){
							
							$http({
								
								method:'DELETE',
								url:URL_API+'farvorite/'+ fav.USER.ID + '/' + fav.ID,
								headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
							
							}).then(function(response){
									$scope.getwishlist(fav.USER.ID);
								
							},function(res){
								//console.log(res);
							});	
						}
					
					
					/*
					 * -------------------------------------------------------------------------------------
					 */
					
					
					
					/*
					 * =========================================
					 * On : Add FAV
					 * Status: true (100% work)
					 * =========================================
					 */
					$scope.addfavourit = function(userid, productid){
							
							$http({
							method:'POST',
							data:
							{
								PRODUCT: { ID: productid },
								USER : {   ID: userid  }
									  
							},	
							url:URL_API+'farvorite/add-new',
							
						}).then(function(response){
							$scope.getwishlist(userid);
							angular.element('#fav' + productid).addClass('disabled');
							
						});	
					}

					
					
					/*
					 * =========================================
					 * Objective : Add HISTORY
					 * Status    : true (100%)
					 * Function  : add history when user clicked
					 * =========================================
					 */
					$scope.addhistory = function(userid, productid){
						$http({
							method:'POST',
							data:
							{
								PRODUCT: { ID: productid },
								USER : {   ID: userid }
								
							},	
							url:URL_API+'history/',
						}).then(function(response){
							
							console.log(response);
									
						});	
					}
					
					
					/**
					 * User Register
					 */
					$scope.register = function(){
						
							$http({
								method:'POST',
								data:
								{
			            			USERNAME	: $scope.username,
			            			PASSWORD	: $scope.cpassword,
			            			DESCRIPTION	: $scope.description	
								},	
								url:URL_API+'user/register'
							}).then(function(response){
								
								location.href = "/login";
										
							});
					}	
					
					
					//sugesstion request logic
					
					$scope.requestLogin=function(){
						swal({
							  title: "Please Login!!!",
							  type: "info",
							  showCancelButton: true,
							  closeOnConfirm: true,
							  showLoaderOnConfirm: true
							}, function () {
							 location.href = 'http://login.khmeracademy.org/login?continue-site=http://localhost:8080';
						});
					}
					$scope.getSource();
					// call get lastest product'
					$scope.getLastPro();
					// call get main category
					$scope.getmainCategory();
					//call get product by website
					$scope.getProbyWebsite();
					//call find product by title
					$scope.findProductByTitle();
					
					$scope.getProHis();
					
					

				}).directive(
					"owlCarousel",
					function() {
						return {
							restrict : 'E',
							transclude : false,
							link : function(scope) {
								scope.initCarousel = function(element) {
									// provide any default options you want
									var defaultOptions = {};
									var customOptions = scope.$eval($(element)
											.attr('data-options'));
									// combine the two options objects
									for ( var key in customOptions) {
										defaultOptions[key] = customOptions[key];
									}
									// init carousel
									$(element).owlCarousel(defaultOptions);
								};
							}
						};
					}).directive('owlCarouselItem', [ function() {
				return {
					restrict : 'A',
					transclude : false,
					link : function(scope, element) {
						// wait for the last item in the ng-repeat then call init
						if (scope.$last) {
							scope.initCarousel(element.parent());
						}
					}
				};
		}]
	);
	
