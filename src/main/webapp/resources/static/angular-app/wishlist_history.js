

var app=angular.module('mywishlist_history',['ui.bootstrap']).controller('mywishlist_historyCtr',function($scope,$http){
	$scope.favs = null;
	$scope.title = null;
	//get Main Category
	$scope.getmainCategory=function(){
		$http({
			method:'GET',
			url:URL_API+'main-category/get-sub-category-list/',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		}).then(function(response){
			$scope.maincategory=response.data.DATA;
			console.log($scope.maincategory);
		},function(response){
			console.log(response);
		});
	}
	
	//FUNCTION SEARCH TITLE LINK To PRODUCT PAGE
	$scope.searchTitle=function(){
		if($scope.title!=null && typeof $scope.title === 'object'){
			$scope.title=$scope.title.TITLE;
		}
		if($scope.mcategoryId==null){
			$scope.mcategoryId=0;
		}
		if($scope.title!=null){
			location.href = '/home/product?category_id='+$scope.mcategoryId+'&title='+$scope.title.TITLE;
		}
		
	}
	
	//find product by title
	$scope.findProductByTitle=function(){
		if($scope.mcategoryId==null){
			$scope.mcateId=0;
		}
			$http({
			  		method:'GET',
			  		url:URL_API+'product/find-product-by-title?category_id='+$scope.mcateId+'&title='+$scope.title+'&page=1&limit=200',
			  		headers: {'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
			  }).then(function(response){
			  		$scope.proSearch=response.data.DATA;	
			  		console.log($scope.proSearch);
			  },function(response){
			  		console.log(response);
			  }); 
	}
	
	/*
	 *  ===========================================
	 *  Objective : get wishlist product from 
	 *  			specific user
	 *  Status    : true (100% Success)
	 *  Problem   : not yet dynamic user 
	 *  ============================================
	 */


	
	
	$scope.getwishlist = function(userid){
		
		$scope.hideRemoveHistory = true;
		$scope.hideunfav = false;
	
		$scope.title = "Favourit List ";
		$http({
			
			method:'GET',
			url:URL_API+'farvorite?usreid='+userid+'&page=1&limit=10000',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		
		}).then(function(response){
			
			$scope.favs=response.data.DATA;
			$scope.favlist=response.data.DATA;
			$scope.countFav = $scope.favs.length;
			
		});	
	}
	

	/*
	 *  ===========================================
	 *  Objective : get history from specific user
	 *  Status    : true (100% Success)
	 *  Problem   : not yet dynamic user
	 *  ============================================
	 */
	
	$scope.gethistory = function(userid){
		
		$scope.hideRemoveHistory = false;
		$scope.hideunfav = true;
		
		$scope.title = "History List ";
		
		$http({
			method:'GET',
			url:URL_API+'history/'+userid,
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		}).then(function(response){
			
			$scope.favs=response.data.DATA;
			//console.log($scope.favs);
			
		},function(res){
			//console.log(res);
		});	
		
	}
	
	
	/*
	 * ==================================
	 * Objective : Remove FAVOURITES
	 * Status    : True (100% Success)
	 * ================================== 
	 */
	$scope.unfavourit=function(fav){
		
		$http({
			
			method:'DELETE',
			url:URL_API+'farvorite/'+ fav.USER.ID + '/' + fav.ID,
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		
		}).then(function(response){
				$scope.getwishlist(fav.USER.ID);
			
		},function(res){
			//console.log(res);
		});	
	}
	
	/*
	 * ==================================
	 * Objective : Remove HIS
	 * Status    : True (100% Success)
	 * ================================== 
	 */
	$scope.removehistory = function(fav){
	
		$http({
			
			method:'DELETE',
			url:URL_API+'history/'+ fav.USER.ID + '/' + fav.ID,
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		
		}).then(function(response){
				$scope.gethistory(fav.USER.ID);
			
		},function(res){
			//console.log(res);
		});
	}
	
	
	
	/*
	 * =========================================
	 * On : Add FAV
	 * Status: true (100% work)
	 * =========================================
	 */
	$scope.addfavourit = function(userid, productid){
		alert(userid);
		alert(productid);		
		$http({
			method:'POST',
			data:
			{
				PRODUCT: { ID: productid },
				USER : {   ID: userid  }
					  
			},	
			url:URL_API+'farvorite/add-new',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		}).then(function(response){
			$scope.getwishlist(userid);
			console.log(response+"|weeoeo");	
		});	
	}

	
	
	/*
	 * =========================================
	 * Objective : Add HISTORY
	 * Status    : true (100%)
	 * Function  : add history when user clicked
	 * =========================================
	 */
	$scope.addhistory = function(userid, productid){
		$http({
			method:'POST',
			data:
			{
				PRODUCT: { ID: productid },
				USER : {   ID: userid }
				
			},	
			url:URL_API+'history/',
			headers:{'Authorization': 'Basic ZGV2OiFAI2FwaQ=='}
		}).then(function(response){
			console.log(response);	
		});	
	}
	
	//Get List MainCategory
	$scope.getmainCategory();
	//FIND PRODUCT BY TITLE
	$scope.findProductByTitle();
	//call search title
	$scope.searchTitle();   
		
	
});