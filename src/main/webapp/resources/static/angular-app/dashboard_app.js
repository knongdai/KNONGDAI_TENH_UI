/**
 * Dashboard 
 */
var app = angular.module('dashboard_app', []);
app.controller('dashboardController', function($scope, $http){
	
	alert(URL_CLIENT);
	/**
	 * Get products with status false
	 */
	$http({
		method 	: 'GET',
		url		: URL_API+'product-temperory/get-by-status/false',
		headers	:
			{
				'Authorization': KEYS
			}
	})
	.then(function(response){
		$scope.getPFalse = response.data.DATA.length;		
	});
	
	/**
	 * Get products with status true
	 */
	$http({
		method 	: 'GET',
		url		: URL_API+'product-temperory/get-by-status/true',
		headers	:
			{
				'Authorization': KEYS
			}
	})
	.then(function(response){
		$scope.getPTrue = response.data.DATA.length;		
	});
		
	
	/**
	 * Get all products in current local data-time
	 */
	$http. get(URL_CLIENT+"product/get-by-current-date")
		. then(function(respone){
	 		 $scope.getProducrtsCurrentDate = respone.data.DATA;	
	 	 });
	
	/**
	 * Get all products
	 */
	$http({
		method 	: 'GET',
		params	: 
			{
				page 	: 1,
				limit	: 1
			},
		url		: URL_API+'product/get-all-products',
		headers	:
			{
				'Authorization': KEYS
			}
	})
	.then(function(response){
		$scope.totalProducts = response.data.PAGING;		
	});
	
	/**
	 * Get Source Object contain source-cateogry
	 */
	$scope.dps = [];
	$http({
		method 	: 'GET',
		params	: 
			{
				page 	: 1,
				limit	: 1
			},
		url		: URL_API+'source/get-join-onetomany',
		headers	:
			{
				'Authorization': KEYS
			}
	})
	.then(function(response){
		$scope.getSource = response.data.DATA;	
		console.log($scope.getSource);
		var data = response.data.DATA;
		var domain = {};
		$scope.dps = [];
 		for(var i = 0; i < data.length; i++)
 		{
 			var total = 0;
 			for(var j = 0; j < data[i].SOURCE_CATEGORY.length; j++)
 			{
 				total +=  data[i].SOURCE_CATEGORY[j].LIST_PRODUCT.length;
 					
 			}
 			domain = 
 				{
 					label: String(data[i].DOMAIN), y : total
 				};
 			// initial values of dataPoints
 			$scope.dps.push(domain);
 		 }
 		
 		/**
 		 * Chart static
 		 */
 		var totalEmployees = "www.phsarnet.com";

 		var chart = new CanvasJS.Chart("chartContainer",{
 			theme: "theme2",
 			title:{ 
 				text: "Static product scrapping from Other Website..."
 			},
 			axisY: {				
 				title: "Number of item"
 			},					
 			legend:{
 				verticalAlign: "top",
 				horizontalAlign: "centre",
 				fontSize: 18

 			},
 			data : [{
 				type: "column",
 				showInLegend: true,
 				legendMarkerType: "none",				
 				legendText: totalEmployees,
 				indexLabel: "{y}",
 				dataPoints: $scope.dps
 			}]
 		});

 		// renders initial chart
 		chart.render();
	});
	
	/*$http. get("http://localhost:9999/rest/source/get-join-onetomany")
	 	 . then(function(respone){
	 		$scope.getSource = respone.data.DATA;	
	 		console.log($scope.getSource+"get source");
	 		var data = respone.data.DATA;
	 		for(var i = 0; i < data.length; i++)
	 		{
	 			for(var j = 0; j < data[i].SOURCE_CATEGORY.length; j++)
	 			{
	 				// initial values of dataPoints
	 					$scope.dps = 
	 						[
	 				 		  		{label: String(data[i].DOMAIN), y: data[i].SOURCE_CATEGORY[j].LIST_PRODUCT.length}
	 				 		];
	 			}
	 			
	 		 }
	 		
	 		*//**
	 		 * Chart static
	 		 *//*
	 		var totalEmployees = "total products 10002";

	 		var chart = new CanvasJS.Chart("chartContainer",{
	 			theme: "theme2",
	 			title:{ 
	 				text: "Chart show the product scrap from other website"
	 			},
	 			axisY: {				
	 				title: "Number of item"
	 			},					
	 			legend:{
	 				verticalAlign: "top",
	 				horizontalAlign: "centre",
	 				fontSize: 18

	 			},
	 			data : [{
	 				type: "column",
	 				showInLegend: true,
	 				legendMarkerType: "none",				
	 				legendText: totalEmployees,
	 				indexLabel: "{y}",
	 				dataPoints: $scope.dps
	 			}]
	 		});

	 		// renders initial chart
	 		chart.render();
	 		
	 	 });*/
	
	/**
	* Get main categories
	*/
	$http. get(URL_CLIENT+"main-category/get-main-category-object")
		 . then(function(respone){
			 $scope.getMainCategories = respone.data.DATA;	
		 });
	
	
	/**
	 * Delete products by status 
	 */
	$scope.deleteProductsByStatus = function()
	{
		conf = confirm("Products will clear all from temporary..! Delete?");
		if(conf)
		{
			$http({
				method 	: 'DELETE',
				url		: URL_API+'product-temperory/delete-by-status/false',
				headers	:
					{
						'Authorization': KEYS
					}
			})
			.then(function(response){
				$scope.getPFalse = 0;	
			});
		}
	}
	

});