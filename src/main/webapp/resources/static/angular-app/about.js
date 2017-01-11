var app = angular.module('myAboutApp', ['ui.bootstrap']);
app.controller('myAboutCtr', function($scope,$http){
	
	
	//get Main Category
	$scope.getmainCategory=function(){
		$http({
			method:'GET',
			url:'http://192.168.178.141:8080/api/main-category/get-sub-category-list/',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		}).then(function(response){
			$scope.maincategory=response.data.DATA;
			console.log($scope.maincategory);
		},function(response){
			console.log(response);
		});
	}
	
	//FUNCTION SEARCH TITLE LINK To PRODUCT PAGE
	$scope.searchTitle=function(){
		if($scope.title!=null && typeof $scope.title === 'object'){
			$scope.title=$scope.title.TITLE;
		}
		if($scope.mcategoryId==null){
			$scope.mcategoryId=0;
		}
		if($scope.title!=null){
			location.href = '/home/product?category_id='+$scope.mcategoryId+'&title='+$scope.title.TITLE;
		}
		
	}
	
	//find product by title
	$scope.findProductByTitle=function(){
		if($scope.mcategoryId==null){
			$scope.mcateId=0;
		}
			$http({
			  		method:'GET',
			  		url:URL_API+'product/find-product-by-title?category_id='+$scope.mcateId+'&title='+$scope.title+'&page=1&limit=200',
			  		headers: {'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
			  }).then(function(response){
			  		$scope.proSearch=response.data.DATA;	
			  		console.log($scope.proSearch);
			  },function(response){
			  		console.log(response);
			  }); 
	}

	//Get List MainCategory
	$scope.getmainCategory();
	//FIND PRODUCT BY TITLE
	$scope.findProductByTitle();
	//call search title
	$scope.searchTitle();   
});