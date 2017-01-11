
var app = angular.module('source_app', []);

/**
*
	Category controller
*
*/
app.controller('sourceController', function($scope, $http){
	
	/**
		Get Source 
	*/
	$scope.getSource = function(){
		$http.get(URL_CLIENT+"source/get-all")
		 .then(function(respone){
			
		 	$scope.lists = respone.data.DATA;	
		 	
		});
	};
	
	/**
	 * Call source function
	 * 
	 */
	$scope.getSource();
	
	/*public static void main(String[] args) {

		// Encrypt Password
		System.out.println(new BCryptPasswordEncoder().encode("12345"));
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}*/
	
	/**
	 * Function add source
	 */
	$scope.addNew = function(){
		/**
		 * Get Data from view to post as json
		 */
		var post_data = 
		{
			
			DOMAIN : $scope.domain,
		    LOGO : $scope.logo,
		    ROWS : $scope.rows,
		    SELECTOR_IMAGE : $scope.img_selector,
		    IMAGE_ATTRIBUTE : $scope.img_attribute,
		    LINK : $scope.link,
		    TITLE : $scope.title,
		    PRICE : $scope.price,
		    PREFIX_LINK : $scope.prefixlink,
		    PREFIX_IMAGE : $scope.prefiximage
		}
		alert(post_data);
		$http. post(URL_CLIENT+"source/add", post_data)
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
			$http. delete(URL_CLIENT+"source/delete/"+ id)
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
		
		$scope.id = list.ID;
		$scope.ndomain = list.DOMAIN;
		$scope.nlogo = list.LOGO;
		$scope.nrows = list.ROWS;
		$scope.nimg_selector = list.SELECTOR_IMAGE;
		$scope.nimg_attribute = list.IMAGE_ATTRIBUTE;
		$scope.nlink = list.LINK;
		$scope.ntitle = list.TITLE;
		$scope.nprice = list.PRICE;
		$scope.nlinkprefix = list.PREFIX_LINK;
		$scope.nimgprefix = list.PREFIX_IMAGE;
		
	}
	
	/**
	 * Update source
	 */
	$scope.updateCategory = function(){
		
		var conf = confirm("Are you sure want to update?");
		if(conf){
			var put_data = 
			{
					ID 				: $scope.id,
					DOMAIN 			: $scope.ndomain,
					LOGO 			: $scope.nlogo,
					ROWS 			: $scope.nrows,
					SELECTOR_IMAGE 	: $scope.nimg_selector ,
					IMAGE_ATTRIBUTE : $scope.nimg_attribute,
					LINK 			: $scope.nlink,
					TITLE 			: $scope.ntitle, 
					PRICE 			: $scope.nprice,
					PREFIX_LINK		: $scope.nlinkprefix,
					PREFIX_IMAGE	: $scope.nimgprefix
					
			}
			$http. put(URL_CLIENT+"source/update", put_data)
			 	 . success(function(respone){
			 		 	$scope.getSource()();
			 	 	})
			 	 . error(function(status){
						console.log(status);
					});
		}
		
	}
	
	
});