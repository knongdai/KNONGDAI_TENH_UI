var app = angular.module('headerApp', ['ui.bootstrap']);
app.controller('headerController', function($scope,$http,$location) {
	//get Main Category
		$http({
			method:'GET',
			url:URL_API+'main-category/get-sub-category-list/',
			headers:{'Authorization': KEYS}
		}).then(function(response){
			$scope.main=response.data.DATA;
			console.log(response.data);
		},function(response){
			console.log(response);
		});
	
});