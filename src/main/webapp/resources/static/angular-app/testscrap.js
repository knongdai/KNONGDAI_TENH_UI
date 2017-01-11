/**
 * Test Scrap Controller
 */

var app = angular.module('testScrap', []);

app.controller('testScrapController', function($scope, $http){
	$http({
		url		:	URL_API+'source/',
		method 	: 	'get',
		headers	:	{ 'Authorization': KEYS }
	
	}).then(function(response){
		$scope.getSource = response.data.DATA;
	});
	
	/**
	 * Get Structure when select website
	 */
	$scope.url = null;
	$scope.getStructure = function(list){	
		
		$http({
			url		:	URL_API+'source-category/get-by-id/'+eval('('+list+')').ID,
			method 	: 	'get',
			headers	:	{ 'Authorization': KEYS }
		
		}).then(function(response){
			$scope.sourceUrl = response.data.DATA;
		});
		$scope.url = null;
		$scope.domain = eval('('+list+')').DOMAIN;
		$scope.rows = eval('('+list+')').ROWS;
		$scope.selectorImage = eval('('+list+')').SELECTOR_IMAGE;
		$scope.selectorAttr = eval('('+list+')').IMAGE_ATTRIBUTE;
		$scope.link = eval('('+list+')').LINK;
		$scope.title = eval('('+list+')').TITLE;
		$scope.price = eval('('+list+')').PRICE;
	}
	
	/**
	 * Test Scrape data
	 */
	$scope.testScrape = function(){		
		
		var post_structure = 
		{
				ROWS			:	$scope.rows,
				SELECTOR_IMAGE	: 	$scope.selectorImage,
				IMAGE_ATTRIBUTE :	$scope.selectorAttr,
				LINK			:	$scope.link,
				TITLE			:	$scope.title,
				PRICE			:	$scope.price,
				SOURCE_CATEGORY	: 	$scope.url
		}		

		document.getElementById("myBar").style.display = "block";
		$http({
			url		:	URL_CLIENT+'source/testscrape',
			method 	: 	'post',
			data	:	post_structure
		}).then(function(r){
			$scope.getData = r.data.DATA;
			document.getElementById("myBar").style.display = "none";
		});
	}
});