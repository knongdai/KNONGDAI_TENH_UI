/***
 * @Author: Rath Phearun 
 * @Email : rathphearun123@gmail.com
 */
var app = angular.module('mapApp', []);
app.controller('mapCtrl', function($scope, $http){
	
	$scope.isNoProduct = false;
	
	var DASHBOARD_MAP = {};
	var PRODUCT = {};
	var CATEGORY = {};
	var PRODUCT_TYPE = {};
	
	$scope.products = [];
	var productsUpdate = [];
	var productUpdate = [];
	
	//TODO: 
	var $PAGINATION = $('#PAGINATION');
	
	// TODO: Default filter
	$scope.filter = {
		page: 1, 
		limit: 5, 
		categoryId: null,
		title: null
	};
	
	$scope.rows = [
	      {"id": 5, value: 5},
	      {"id": 15, value: 15},
	      {"id": 30, value: 30},
	      {"id": 50, value: 50}
	];
	
	//TODO:
	DASHBOARD_MAP.findAll = function(){
		$.LoadingOverlay("show");
		$http({
			url: URL_API + '/v1/tenh/temp/dashboard',
			method: 'GET',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
			params: $scope.filter
		}).then(function(success){			
			console.log(success);
			$scope.categories = success.data.categories;
			if(success.data.data.length == 0){
				$scope.isNoProduct = true;
			}else{
				$scope.isNoProduct = false;
				$scope.products = success.data.data;
				$scope.productTypes = success.data.productTypes;
				PRODUCT.loadPagination(success.data);
			}
			$.LoadingOverlay("hide");
		}, function(error){
			console.log(error);
			$.LoadingOverlay("show");
		});
	};
	
	//TODO: Define method for load all records
	PRODUCT.findAllTemp = function(){
		$.LoadingOverlay("show");
		$http({
			url: URL_API + '/v1/tenh/temp',
			method: 'GET',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
			params: $scope.filter
		}).then(function(success){			
			console.log(success);
			if(success.data.data.length == 0){
				$scope.isNoProduct = true;
			}else{
				$scope.isNoProduct = false;
				$scope.products = success.data.data;
				PRODUCT.loadPagination(success.data);
			}
			$.LoadingOverlay("hide");
		}, function(error){
			console.log(error);
			$.LoadingOverlay("hide");
		});
	};
	
	//TODO: 
	PRODUCT.publishAll = function(products){
		$.LoadingOverlay("show");
		$http({
			url: URL_API + '/v1/tenh/temp',
			method: 'PUT',
			headers: {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json',
				'Authorization': 'Basic ZGV2OiFAI2FwaQ=='
			},
			data: products
		}).then(function(success){
			console.log(success);
			PRODUCT.findAllTemp();
			$.LoadingOverlay("hide");
		},function(error){
			console.log(error);
			$.LoadingOverlay("hide");
		});
	};
	
	//TODO: Load Pagination
	PRODUCT.loadPagination = function(response){
		$PAGINATION.bootpag({
	        total: response.pagination.TOTAL_PAGES,
	        page: response.pagination.PAGE,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 5
	    });
	};
	
	//TODO: Add listener to page click
	$PAGINATION.on("page", function(event, pageNumber){
		console.log(pageNumber);
		$scope.filter.page = pageNumber;
		PRODUCT.findAllTemp();
	});
	
	$scope.categoryChange = function(category){
		$scope.filter.categoryId = category;
		PRODUCT.findAllTemp();
	};
	
	$scope.udateCategoryChange = function(category, PID){
		console.log(category);
		for(var i=0; i<$scope.products.length; i++){
			if($scope.products[i].ID == PID ){
				$scope.products[i].CATEGORY.ID = category;
				break;
			}
		}
	};
	
	$scope.productTypeChange = function(productTypeSeleted, PID){
		console.log(productTypeSeleted);
		for(var i=0; i<$scope.products.length; i++){
			if($scope.products[i].ID == PID ){
				$scope.products[i].PRODUCT_TYPE_ID = { "ID" : productTypeSeleted };
				break;
			}
		}
	};
	
	$scope.publishPost = function(PID){
		console.log(PID);
		productUpdate = [];
		for(var i=0; i<$scope.products.length; i++){
			if($scope.products[i].ID == PID ){
				if($scope.products[i].CATEGORY.ID == null || $scope.products[i].PRODUCT_TYPE_ID == null){
					continue;
				}
				productUpdate.push($scope.products[i]);
				if(confirm("Are you sure to publish these products?"))
					PRODUCT.publishAll(productUpdate);
				break;
			}
		}
	};
	
	$scope.publishAllPost = function(){
		console.log($scope.products);
		productsUpdate = [];
		angular.forEach($scope.products, function(product){
			if(product.CATEGORY.ID != null && product.PRODUCT_TYPE_ID != null){
				productsUpdate.push(product);
			}
		});
		
		if(productsUpdate.length == 0){
			alert('Please choose at least one product to map!');
			return;
		}
		
		if(confirm("Are you sure to publish these products?"))
			PRODUCT.publishAll(productsUpdate);
	};
	
	$scope.limitChange = function(limit){
		$scope.filter.limit = limit;
		PRODUCT.findAllTemp();
	};
	
	$scope.searchByTitle = function(event){
		if(event.keyCode == 13){
			PRODUCT.findAllTemp();
		}
		if(event.keyCode == 8){
			if($scope.filter.title == '' || $scope.filter.title == null)
				PRODUCT.findAllTemp();
		}
		console.log($scope.filter);
	};
	//TODO:
	DASHBOARD_MAP.findAll();
});