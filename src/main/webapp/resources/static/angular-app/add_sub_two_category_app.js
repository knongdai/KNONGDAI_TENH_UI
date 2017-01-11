
var app = angular.module('category_app', []);

	/**
	*
		Category controller
	*
	*/
	app.controller('categoryController', function($scope, $http){

		var pagin = {
			page:1,
			limit:20
		};

		var PAGINATION = $('#pagination');

		PAGINATION.on("page", function(event, num){
			pagin.page = num;
			$scope.getCategory();
		});
	
	
	/**
		Get main category 
	*/
	$scope.getCategory = function(){
	
		$http({
			url: URL_API+'sub-two-category',
			method: 'GET',
			params: pagin,
			headers: {'Authorization': 'Basic ZGV2OiFAI2FwaQ=='} 
		}).then(function(response){
			console.log(response.data.DATA+"get data");
			PAGINATION.bootpag({
			    total: response.data.PAGING.TOTAL_PAGES
			});
			 $scope.lists = response.data.DATA;	
		});

	};
	
	
	
	/**
	 * Call Get main category function
	 * 
	 */
	$scope.getCategory();
	
	
	
	/**
	 * 
	 * Get main category lists
	 */
	
	/*$http.get(URL_CLIENT+"sub-one-category/get-all?page=1&limit=19")
	 .then(function(respone){
	 	$scope.mainlists = respone.data.DATA;	
	 	console.log($scope.mainlists+"heladskajdl");
	});*/
	
		
		$http({
			url: URL_API+'sub-one-category',
			method: 'GET',
			headers: {'Authorization': 'Basic ZGV2OiFAI2FwaQ=='} 
		}).then(function(response){
			 $scope.mainlists = response.data.DATA;	
		});

	
	
	/**
	 * Function add new category
	 */
	$scope.addNew = function(){
		
		/**
		 * Get Data from view to post as json
		 */
		var post_data = 
		{
			SUB_CATEGORY : $scope.sub_category,
			MAIN_CATEGORY : 
			{
				ID : $scope.main_category
			}
		}
		
		$http. post(URL_CLIENT+"sub-two-category/add", post_data)
		 	 . success(function(respone){
		 		 	$scope.getCategory();
		 	 	})
		 	 . error(function(status){
					console.log(status);
				});
	};
	
	/**
	 * Delete Data main category by id
	 */
	$scope.deleteByID = function(id){
		var conf = confirm("Are you sure want to delete?");
		if(conf){
			$http. delete(URL_CLIENT+"sub-two-category/delete/"+ id)
			 	 . success(function(respone){
			 		 	$scope.getCategory();
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
		$scope.id = list.ID;
		$scope.category = list.SUB_CATEGORY;
	}
	
	
	/**
	 * Update main category
	 */
	$scope.updateCategory = function(){
		var conf = confirm("Are you sure want to update?");
		if(conf){
			var put_data = 
			{
				ID : $scope.id, 
				SUB_CATEGORY : $scope.category
			}
			$http. put(URL_CLIENT+"sub-two-category/update", put_data)
			 	 . success(function(respone){
			 		 	$scope.getCategory();
			 	 	})
			 	 . error(function(status){
						console.log(status);
					});
		}
		
	}
	
	/**
	 * Get Data from Main-Category as List
	 */
	
	$http.get(URL_CLIENT+"main-category/get-main-category-object")
		.then(function(respone){
			
			$scope.getMainCategoryLists = [];
			var data = respone.data.DATA;
			for(var i=0; i<data.length; i++){
				
				//console.log(data[i].SUB_CATEGORY);
				
				if(data[i].SUB_CATEGORY.length!=0){
					for(var j=0; j<data[i].SUB_CATEGORY.length; j++){
						$scope.getMainCategoryLists.push(data[i].SUB_CATEGORY[j]);
					}
				}
				
			}
			
		});
	
	/**
	* Get sub one category in get 
	*/
	$scope.subOne = [];
	$scope.filterSubCategory = function(e){
		
		if(e != null)
		{
			PAGINATION.hide();
			$scope.subOne = e.SUB_TWO_CATEGORY;
			$scope.lists = $scope.subOne;
			return;
		}
		$scope.getCategory();
		PAGINATION.show();
	}
	
});