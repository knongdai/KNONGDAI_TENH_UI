
var app = angular.module('source_app', []);

/**
*
	Category controller
*
*/
app.controller('sourceController', function($scope, $http){
	
	/**
	 * Call main source api
	 */
	$http({
		method 	: 'GET',
		url		: URL_API+'source/get-join-onetomany',
		headers	:
			{
				'Authorization': KEYS
			}
	})
	 .then(function(respone){
		
	 	$scope.mainlists = respone.data.DATA;
	 	console.log($scope.mainlists+"MAIN LIST");
	 	
	});
	
	/**
	 * Call main source api
	 */
	$http({
		url		:	URL_API+'sub-two-category',
		method	:	'get',
		headers	:	{ 'Authorization': KEYS }
	}).then(function(response){
		$scope.categorylists = response.data.DATA;	
	});

	
	var pagin = {
			page:1,
			limit:20
		};

		var PAGINATION = $('#pagination');

		PAGINATION.on("page", function(event, num){
			pagin.page = num;
			$scope.getSource();
		});
	
	/**-
		Get Source 
	*/
	$scope.getSource = function(){
		$http({
			url		:	URL_API+'source-category',
			method	:	'get',
			params	:	pagin,
			headers	:	{ 'Authorization': KEYS }
		}).then(function(response){
			PAGINATION.bootpag({
			    total: response.data.PAGING.TOTAL_PAGES
			});
			$scope.lists = response.data.DATA;	
		});
	};
	/**
	 * Call get source function
	 * 
	 */
	$scope.getSource();
	
	
	/**
	 * Filter source category by website
	 */
	$scope.sourcecategory = [];
	$scope.filterSourceCategory = function(source){
		if(source != null)
		{
			PAGINATION.hide();
			$scope.sourcecategory = source.SOURCE_CATEGORY;
			$scope.lists = $scope.sourcecategory;
			return;
		}
		$scope.getSource();
		PAGINATION.show();
	}
	
	/**
	 * Function add source
	 */
	$scope.addNew = function(){
		
		/**
		 * Get Data from view to post as json
		 */
		var post_data = 
		{
			SOURCE_CATEGORY : $scope.source_category,
			STATUS 			: $scope.status,
			SOURCE			: 
			{
				ID			: $scope.main_source_id
			},
			SUB_CATEGORY	:
			{
				ID			: $scope.sub_category_id
			}
		}
		$http. post(URL_CLIENT+"source-category/add", post_data)
		 	 . success(function(respone){
		 		 	$scope.getSource();
		 	 	})
		 	 . error(function(status){
					console.log(status);
				});
	};
	
	/**
	 * Delete Data source by id
	 */
	$scope.deleteByID = function(id){
		
		var conf = confirm("Are you sure want to delete?");
		if(conf){
			$http. delete(URL_CLIENT+"source-category/delete/"+ id)
			 	 . success(function(respone){
			 		 	$scope.getSource()();
			 	 	})
			 	 . error(function(status){
						console.log(status);
					});
		}
		
	}
	
	/**
	 * Get data from view to update
	 */
	$scope.sendDataToUpdate = function(list){
		
		$scope.nid = list.ID;
		$scope.nsource_category = list.SOURCE_CATEGORY,
		$scope.nstatus = list.STATUS;

		
	}
	
	/**
	 * Update source
	 */
	$scope.updateCategory = function(){
		
		var conf = confirm("Are you sure want to update?");
		if(conf){
			var put_data = 
			{
				ID 					: $scope.nid,
				SOURCE_CATEGORY		: $scope.nsource_category,
				STATUS				: $scope.nstatus
					
			}
			$http. put(URL_CLIENT+"source-category/update", put_data)
			 	 . success(function(respone){
			 		 	$scope.getSource()();
			 	 	})
			 	 . error(function(status){
						console.log(status);
					});
		}
		
	}
	
	
});