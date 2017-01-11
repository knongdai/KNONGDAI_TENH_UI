
var app = angular.module('map_category_app', []);

/**
*
	Category controller
*
*/
app.controller('mapCategoryController', function($scope, $http){
	
	
		/*var paging = {
			id:0,
			page:1,
			limit:3
	};
	
	var TempProduct = {};
	
	var PAGINATION = $('#pagination');
	
	PAGINATION.on("page", function(event, num){
		console.log(num);	
		paging.page = num;
		TempProduct.findAll();
	});
	
	TempProduct.findAll = function(){
		$http({
			url: 'http://localhost:9999/rest/product-temperory/get-product-by-id',
			method: 'GET',
			params: paging
		}).then(function(response){
			console.log(response);
			PAGINATION.bootpag({
			    total: response.data.PAGING.TOTAL_PAGES
			});
			 $scope.getTemProduct = response.data.DATA;	
			 console.log(response.data.DATA);
		});
	}
	$scope.getTemProductBySourceId = function(id)
	{
		paging.id = id;
		TempProduct.findAll();
	}
	*/
	
	$http({
		url: URL_API+'sub-two-category?page=0&limit=0',
		headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
		method: 'GET'
	}).then(function(response){
		 $scope.getAllSubTwoCategory = response.data.DATA;	
	});
		
	/**
	 * Call Source Object contain source-cateogry
	 */
	$http.get(URL_CLIENT+"source/get-object")
	 .then(function(respone){
		 $scope.getSource = respone.data.DATA;
		 console.log($scope.getSource);
	 });
		
	/**
	 * Get Data from temerory table by source id
	 */
	$scope.hideBtnSave = false;
	$scope.sourceid = 0;
	$scope.getTemProductBySourceId = function(id)
	{
		$scope.sourceid = id;
		$scope.hideBtnSave = true;
		$http. get(URL_CLIENT+'product-temperory/get-product-by-id?id='+id)
			 . then(function(response){
				 	$scope.getTemProduct = response.data.DATA;
			 })
	}
	
	/**
	 * Get Data from Main-Category as List
	 */
	$scope.mapOneByOne = function(){
		$http.get(URL_CLIENT+"main-category/get-main-category-object")
		 .then(function(respone){
			 $scope.getMainCategoryLists = respone.data.DATA;	
			 console.log(respone);
			 $scope.getSubCategory = [];
			 for(var i=0; i<respone.data.DATA.length; i++){
				 $scope.getSubCategory.push(respone.data.DATA[i].SUB_CATEGORY);
			 }
		});
	}
	
	/**
	 * Get sub one category in get 
	 */
	$scope.subOne = [];
	$scope.getSub = function(e){
		$scope.subOne = e.SUB_CATEGORY;
	}
	
	/**
	 * Get sub one category in get 
	 */
	$scope.subTwo = [];
	$scope.getSubOne = function(e){
		$scope.subTwo = e.SUB_TWO_CATEGORY; 
		cosole.log($scope.subTwo);
	}
	
	
	/**
	 * Select Sub-Two-Category-ID for add To Product
	 */
	$scope.productType = [];
	$scope.selectSubTwoID = function(e){
		$scope.getSubTwoID = e.ID;
		$scope.productType = e.LIST_PRODUCT_TYPE;
	}
	
	/**
	 * Get product type id
	 */
	$scope.getProductTypeid = 0;
	$scope.getProductTypeId = function(e){
		$scope.getProductTypeid = e.ID;
	}
	
	//////////////////////////////////
	$scope.listProducts = [];
	$scope.checkProducts = function(lists){	
		console.log(lists+"get list");
		$scope.productObject = lists;
		var index = $scope.listProducts.indexOf(lists);
		if(index > 0){
			$scope.listProducts.splice(index, 1);
		}else{
			$scope.listProducts.push(
					{
						ID			: $scope.productObject.ID,
						TITLE		: $scope.productObject.TITLE,
						PRICE		: $scope.productObject.PRICE,
						ADD_IMAGE	: $scope.productObject.IMAGE,
						URL			: $scope.productObject.URL,
						DESCRIPTION	: $scope.productObject.DESCRIPTION
					}
			);
		}		
	}
	
	/**
	 * Add Product after map to the rigth category
	 */
	$scope.addProductByMapOne = function(){
		conf = confirm("Are you sure this product have been mapped to the right category?");
		if(conf)
		{
			for(var i = 0; i < $scope.listProducts.length; i++){
				$scope.listProducts[i] = {
											ID 			: $scope.listProducts[i].ID,
											PRODUCT_TYPE_ID: {
												ID		: $scope.getProductTypeid
											},
											TITLE		: $scope.listProducts[i].TITLE,
											PRICE		: $scope.listProducts[i].PRICE,
											ADD_IMAGE	: $scope.listProducts[i].ADD_IMAGE,
											URL			: $scope.listProducts[i].URL,
											DESCRIPTION	: $scope.listProducts[i].DESCRIPTION,
											CATEGORY	:
											{
												ID		: $scope.getSubTwoID
											},
											SOURCE		: 
											{
												ID		: $scope.productObject.SOURCE.ID
											}
										};
			}
			
			$http({
				method:'POST',
				data: $scope.listProducts,
				url:URL_API+'product/',
				headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
			}).then(function(response){
				alert("success");
				$scope.getTemProductBySourceId($scope.sourceid);
				/*$http({
					method:'PUT',
					data: $scope.listProducts,
					url:URL_API+'product-temperory/update-by-source-id',
					headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
				}).then(function(res){
					console.log("success update products");
					for(var i = 0; i < $scope.listProducts.length; i++){
						var index = $scope.getTemProduct.indexOf($scope.listProducts[i]);
		 			 	$scope.getTemProduct.splice(index, 1);
					}
				});*/
			},function(response){
				console.log(response);
			});
		}
		
	}
	
	/**
	 * Add Product all products had mapped 
	 */
	$scope.addDataToProduct = function(list)
	{
		var conf = confirm("Are you sure, you had checked out of the products which not match in the right category?");
		if(conf)
		{
			console.log(list);
			
			$http. post(URL_CLIENT+"product/add", list)
			 	 . success(function(){
			 		 	alert("success"); 
 		 			 	$scope.getTemProduct = null;
			 		 	/**
 		 				 * Call Source Object contain source-cateogry
 		 				 */
 		 				$http.get(URL_CLIENT+"source/get-object")
 		 				 .then(function(respone){
 		 					 $scope.getSource = respone.data.DATA;	
 		 				});
			 	 	})
			 	 . error(function(response){
			 		 	console.log(response);
			 	 	});
		}
		
	}

	
});