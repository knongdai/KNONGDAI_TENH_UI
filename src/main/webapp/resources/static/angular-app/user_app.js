
var app = angular.module('user_app', []);

/**
*
	Category controller
*
*/
app.controller('userController', function($scope, $http){
	
	/**
		Get main category 
	*/
	$scope.getUser = function(){
		$http.get(URL_CLIENT+"user/get-all")
		 .then(function(respone){
			
		 	$scope.lists = respone.data.DATA;	
		 	console.log(respone.data.DATA);
		 	
		});
		/*.error(function(status){
			console.log(status);
		});*/
	};
	
	/**
	 * Call Get main category function
	 * 
	 */
	$scope.getUser();
	
	/*public static void main(String[] args) {

		// Encrypt Password
		System.out.println(new BCryptPasswordEncoder().encode("12345"));
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}*/
	
	/**
	 * Function add new category
	 */
	$scope.addNew = function(){
		alert($scope.username);
		/**
		 * Get Data from view to post as json
		 */
		var post_data = 
		{
				
			USERNAME : $scope.username,
			PASSWORD : $scope.password,
			DESCRIPTION : $scope.description
		}
		alert(post_data);
		$http. post(URL_CLIENT+"user/add", post_data)
		 	 . success(function(respone){
		 		 	$scope.getUser();
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
			$http. delete(URL_CLIENT+"user/delete/"+ id)
			 	 . success(function(respone){
			 		 	$scope.getUser()();
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
		alert($scope.category);
		var conf = confirm("Are you sure want to update?");
		if(conf){
			var put_data = 
			{
				ID : $scope.id, 
				SUB_CATEGORY : $scope.category
			}
			$http. put(URL_CLIENT+"user/update", put_data)
			 	 . success(function(respone){
			 		 	$scope.getUser()();
			 	 	})
			 	 . error(function(status){
						console.log(status);
					});
		}
		
	}
	
	
});