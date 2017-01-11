var app = angular.module('myProductApp', ['ui.bootstrap']);
app.controller('myProductCtr', function($scope,$http) {
    $scope.maper = [];
    $scope.tempproduct={};
    $scope.websiteId=0;
    $scope.stratPrice=0;
    $scope.endPrice=0;
    //$scope.subId1='';
    $scope.webname;
    var Product = {};
    var PAGING = {};
    var paging = {};
 
    var userid = document.getElementById("getUserId").value;
    
    //get id from url
    $http.defaults.headers.common.Authorization = KEYS ;
    $scope.sub1Id=getParameterByName('sub1Id');
    $scope.categoryId = eval(getParameterByName('id'));
    $scope.mcategoryId=getParameterByName('category_id') ;
    $scope.title=getParameterByName('title') ;
    
    if($scope.webname==null){
    	 $scope.webname="គេហទំព័រ";
    }
   
  //PAGINATION 
    var PAGINATION=$('#pagination-here');
    
    Product.loadPagination = function(){
    	PAGINATION.bootpag({
    	    total: PAGING.totalPages,          // total pages 
    	    page: PAGING.currentPage,  // default page 
    	    maxVisible: 5,     // visible pagination 
    	    leaps: true         // next/prev leaps through maxVisible 
    	});
    }
    
    PAGINATION.on("page", function(event, num){
		paging.page = num;
		$scope.getProSub2();
		
	});
    
    

    PAGINATION.on("page", function(event, numpage){
		paging.page = numpage;
		$scope.searchTitle();	
	});
    paging = {
    		userid:userid,
    		mainid:$scope.mcategoryId,
    		title:$scope.title,
    		subid: $scope.categoryId,
        	sourceid: $scope.websiteId,
        	start_price: $scope.stratPrice,
        	price: $scope.endPrice,
    		page:1,
    		limit:16
	 };
	//get Product From SubCategory2
	$scope.getProSub2 = function(){
		
		$http({
	    	method:'GET',
	    	params: paging,
	    	url:URL_API+'product/find-product-by-filter'
	        }).then(function(response){
	        	var product = response.data.DATA;
	        	console.log(paging.limit+"get params");
	    		console.log(paging.page+"e");
	        	
		    	if(product == null)
		    	{	$scope.noresult = 'គ្មានទំនិញ';
		    		$scope.product = null;
		    		PAGING.totalPages=0;
		    		PAGING.currentPage=1;
		    		Product.loadPagination();
		    		
		    	}else{
		    		$scope.product = product;
		    		$scope.noresult = '';
	    			PAGING.totalPages = response.data.PAGING.TOTAL_PAGES;
			    	PAGING.currentPage = response.data.PAGING.PAGE;
			    	Product.loadPagination();
		    	}
		     // console.log(getdata);
	    	
	    },function(err){
	    	console.log(err+"cvvdddd");
	    });
		
	}
	//SEARCH PRODUCT BY WEBSITE
	   $scope.searchProByWeb = function(e){
		   $scope.websiteId = eval(e.target.attributes[3].value);
		   $scope.webname= e.target.attributes[4].value;
		   paging.sourceid =  $scope.websiteId;
		   paging.start_price=$scope.stratPrice;
		   paging.price=$scope.endPrice;
		   $scope.getProSub2();
		}
	
	//get Main Category
	$scope.getmainCategory=function(){
		$http({
			method:'GET',
			url:URL_API+'main-category/get-sub-category-list/'
		}).then(function(response){
			$scope.maincategory=response.data.DATA;
			 
		},function(response){
			console.log(response);
		});
	}
	//Get Source website
	$scope.getSource=function(){
		$http({
			method:'GET',
			url:URL_API+'source/'
		}).then(function(response){
			$scope.source=response.data.DATA;
			
		},function(res){
			console.log(res);
		});	
		
	}
	
	
	//FUNCTION SEARCH TITLE
	
	$scope.searchTitle = function(){
	    if($scope.title!=null && typeof $scope.title === 'object'){
			$scope.title=$scope.title.TITLE;
	    }
	   
		paging.title=$scope.title;
		paging.mainid=$scope.mcategoryId;
		paging.sourceid=0;
		
		
	   if(paging.title!=null){
		   $scope.getProSub2();
		  
	   }
		
	}
	

	//SEARCH PRODUCT BY PRICE
	$scope.searchProByPrice = function(){
		paging.sourceid = $scope.websiteId;
		paging.start_price=eval($scope.stratPrice);
		paging.price=eval($scope.endPrice);
		$scope.getProSub2();
	}
	$scope.getSub2Id = function(e) {
		$scope.categoryId = e.target.attributes[1].value;
		$scope.getProSub2();
	}
	//get sub2 by sub1id
	$scope.getsub2Bysub1=function(){
		
		$http({
			method:'GET',
			url:URL_API+'sub-two-category/get-by-main-id/'+$scope.sub1Id
		}).then(function(response){
			$scope.subcategory2=response.data.DATA;
			$scope.sub1name=$scope.subcategory2[0].MAIN_CATEGORY.SUB_CATEGORY;
		
			
		},function(err){
			console.log(err);
		});
	}
	
	//get all sub2 without sub1Id
	
	$scope.getAllSub2=function(){
		$http({
			method:'GET',
			url:URL_API+'sub-two-category/'
		}).then(function(response){
			$scope.subcategory2=response.data.DATA;
			console.log($scope.allSub2);
		},function(err){
			console.log(err);
		});
	}
	
  //find product by title
	$scope.findProductByTitle=function(){
		if($scope.mcategoryId==null){
			$scope.mcategoryId=0;
		}
		$http({
		  		method:'GET',
		  		url:URL_API+'product/find-product-by-title?category_id='+$scope.mcategoryId+'&title='+$scope.title+'&page=1&limit=16'
		  }).then(function(response){
		  		$scope.proSearch=response.data.DATA;	
		  		console.log($scope.proSearch);
		  },function(response){
		  		console.log(response);
		  });
		 
		}
	/*
	 Add Favorite
	 */
	$scope.addfavourit = function(userid, productid){
		$http({
			method:'POST',
			data:
			{
				PRODUCT: { ID: productid },
				USER : {   ID: userid  }
					  
			},	
			url: URL_API+'farvorite/add-new'
		}).then(function(response){
			console.log(response);
					
		});	
	}
	
	/*
	 * Get Fav
	 */

	
	/* =======================================
	 * For Display in List Favorite 5 Product
	 * =======================================
	 */
	$scope.getwishlistlist = function(userid){
		$http({
		
			method:'GET',
			url:URL_API+'farvorite?usreid='+userid+'&page=1&limit=10000'
		
		}).then(function(response){
			
			$scope.favlist = response.data.DATA;
			$scope.countFav = response.data.DATA.length;
			
		},function(res){
			//console.log(res);
		});	
	}
	
	/**
	 * User Register
	 */
	$scope.register = function(){
		
			$http({
				method:'POST',
				data:
				{
        			USERNAME	: $scope.username,
        			PASSWORD	: $scope.cpassword,
        			DESCRIPTION	: $scope.description	
				},	
				url:URL_API+'user/register'
			}).then(function(response){
				
				location.href = "/login";
						
			});
	}
	
	/*
	 * ==================================
	 * Objective : Remove FAVOURITES
	 * ================================== 
	 */
	$scope.unfavourit = function(fav){
		
		$http({
			
			method:'DELETE',
			url: URL_API+'farvorite/'+ fav.USER.ID + '/' + fav.ID
		
		}).then(function(response){
			angular.element('#remove' + fav.ID).removeClass('disabled');	
			$scope.getwishlist(fav.USER.ID);
				
			
		},function(res){
			//console.log(res);
		});	
	}

	
	
	
	/*
	 * =======================================
	 * for total number of favorites
	 * =======================================
	 */
	
	$scope.getwishlist = function(userid){
		
		$http({
		
			method:'GET',
			url:URL_API+'farvorite?usreid='+userid+'&page=1&limit=10000'
		
		}).then(function(response){
			
			$scope.favs=response.data.DATA;
			console.log($scope.favs);
			$scope.getwishlistlist(userid);
			
		},function(res){
			//console.log(res);
		});	
	}

	
	
	/*
		Add history
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
		}).then(function(response){
			console.log(response);	
		});	
	}
	
	
	/*
	 * =========================================
	 * On : Add FAV
	 * Status: true (100% work)
	 * =========================================
	 */
	$scope.addfavourit = function(userid, productid){		
		
		$http({
			method:'POST',
			data:
			{
				PRODUCT: { ID: productid },
				USER : {   ID: userid  }
					  
			},	
			url: URL_API+'farvorite/add-new'
		}).then(function(response){
			$scope.getwishlist(userid);
			angular.element('#fav' + productid).addClass('disabled');
		});	
	}
	
	//sugesstion request logic
	
	$scope.requestLogin=function(){
		swal({
			  title: "Please Login!!!",
			  type: "info",
			  showCancelButton: true,
			  closeOnConfirm: true,
			  showLoaderOnConfirm: true
			}, function () {
			 location.href = 'http://localhost:2016/login?continue-site=http://localhost:8080';
		});
	}
	
	
	//function input only number
	
	$scope.filterValue = function(t){
		 
		 console.log(t.keyCode);
        if(isNaN(String.fromCharCode(t.keyCode))){
        	t.preventDefault();
        }
	}
	
	// Clear price value to 000
	$scope.clearValue = function(){
		$('#open').show();
    	$('#hide').css('display','none');
    	$('#s_price').val(null);
    	$('#e_price').val(null);
    	$scope.stratPrice = 0;
    	$scope.endPrice = 0;
	};
	
//	//random result 
//	function getRandomSpan(){
//	    return Math.floor((Math.random()*6)+1);
//	}
	  
	 if($scope.sub1Id==null || $scope.sub1Id==''){
	    	$scope.sub1name='ប្រភេទទំនិញ';
	    	$scope.getAllSub2();
	  }
	 
	 //get syb2 by sub1
	 $scope.getsub2Bysub1();
	//Get Product from sub2category
	$scope.getProSub2();
	//Get List MainCategory
	$scope.getmainCategory();
	//Get Source Website
	$scope.getSource();
	//FIND PRODUCT BY TITLE
	$scope.findProductByTitle();
	//call search title
	$scope.searchTitle();   
});