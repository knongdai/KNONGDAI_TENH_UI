/***
 * @Author: Rath Phearun 
 * @Email : rathphearun123@gmail.com
 */
var app = angular.module('productTypeApp', []);
app.controller('productTypeCtrl', function($scope, $http){
	
	$scope.isNoProduct = false;
	$scope.isAdd = true;
	$scope.productType = {};
	$scope.productTypeTitle = '';
	
	
	var PRODUCT_TYPE = {};
	
	$scope.removeProductType = function(pt){
		if(confirm('Are you sure you want to remove?'))
			PRODUCT_TYPE.remove(pt);
	};
	
	$scope.editProductType = function(self){
		$scope.productTypeTitle = "Update Product Type";
		$scope.isAdd = false;
		$scope.productType = self.pt;
	};
	
	$scope.saveProductType = function(){
		console.log($scope.productType);
		if($scope.isAdd){
			PRODUCT_TYPE.save($scope.productType, 'POST');
		}else{
			PRODUCT_TYPE.save($scope.productType, 'PUT');
		}
	};
	
	$scope.addProductType = function(){
		$scope.productTypeTitle = "Add Product Type";
		$scope.isAdd = true;
		$scope.productType = {};
	};
	
	$scope.onSearchKeyup = function(event){
		if(event.keyCode == 13){
			PRODUCT_TYPE.findAll();
		}
		
		if(event.keyCode == 8){
			if($scope.type == '' || $scope.type == null)
				PRODUCT_TYPE.findAll();
		}
	};
	
	//TODO:
	PRODUCT_TYPE.findAll = function(){
		$http({
			url: URL_API + '/product-type',
			method: 'GET',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
			params: {
				"type": $scope.type
			}
		}).then(function(success){			
			console.log(success);
			
			if(success.data.data.length == 0){
				$scope.isNoProduct = true;
			}else{
				$scope.isNoProduct = false;
				$scope.productTypes = success.data.data;
			}
		}, function(error){
			console.log(error);
		});
	};
	
	
	PRODUCT_TYPE.save = function(productType, method){
		$http({
			url: URL_API + '/product-type',
			method: method,
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
			data: productType
		}).then(function(success){			
			PRODUCT_TYPE.findAll();
		}, function(error){
			console.log(error);
		});
	};
	
	PRODUCT_TYPE.remove = function(id){
		$http({
			url: URL_API + '/product-type/' + id,
			method: 'DELETE',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='},
		}).then(function(success){			
			PRODUCT_TYPE.findAll();
		}, function(error){
			console.log(error);
		});
	};
	
	//TODO:
	PRODUCT_TYPE.findAll();
});