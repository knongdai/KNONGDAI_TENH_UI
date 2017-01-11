<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myProductApp">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/header.jsp"></jsp:include>
	<title>Shopping Mall</title>
	<meta property="og:url"           content="http://phsarnet.khmeracadymic.org/home/product" />
	<meta property="og:type"          content="phsarnet.khmeracadymic.org" />
	<meta property="og:title"         content="PhsarNet" />
	<meta property="og:description"   content="Fashion Collection" />
	<meta property="og:image"         content="http://phsarnet.khmeracadymic.org/home/product" />
	 <sec:authorize access="isAuthenticated()">
	 	<sec:authentication property="principal.userid" var="userid"/>
	 </sec:authorize>
	 <style>
	 	.height-sm{
	 		height: 248px;
	 	}
	 	#owl-demo .item{
		  margin: 3px;
		}
		#owl-demo .item img{
		  display: block;
		  width: 100%;
		  height: auto;
		}
	 </style>
</head>
<body ng-controller="myProductCtr"  ng-init="getwishlist(${userid});" >
	<!-- INCLUDE WEB HEADER -->
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/webheader.jsp"></jsp:include>
	<!-- END -->
   <!--Filter Product-->
   <nav class="navbar navbar-static-top" style="background-color:#fff;border-bottom: 1px solid #eee;">
      <div class="container" >
          <div class="row">
            <div class="col-sm-12">
                <div class="dropdown ">
                 <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                 	{{sub1name | limitTo : 15}}...
                     <span class="caret"></span></button>
                     <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                       <li role="presentation" ng-repeat="sub2 in subcategory2 | limitTo:15" ng-click="getSub2Id($event)">
	                       	<a role="menuitem" data-value="{{sub2.ID}}" tabindex="-1" href="${pageContext.request.contextPath}/home/{{'product?id='+sub2.ID+'&sub1Id='+sub1Id}}" ng-bind="sub2.SUB_CATEGORY"></a>
                       </li>
                     </ul>
                </div>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu2" data-toggle="dropdown" ng-bind="webname">
                     <span class="caret"></span></button>
                     <ul class="dropdown-menu" role="menu" aria-labelledby="menu2" ng-model="sourceId">
                       <li role="presentation" >
	                       <a href="" role="menuitem" tabindex="-1"  data-value='0' >
	                        	គេហទំព័រទាំងអស់
	                       </a>
                       </li>
                       <li role="presentation" ng-repeat="src in source" ng-click="searchProByWeb($event)">
	                       <a href="" role="menuitem" tabindex="-1"  data-value={{src.ID}} data-name={{src.DOMAIN}} ng-bind="src.DOMAIN"></a>
                       </li>
                     </ul>
                </div>
               
              <!-- Compare Price -->
                <button class="btn btn-default  test" id="open" type="button"  style="margin-left:0px;">តម្លៃ<span class="caret"></span></button>
                <div  id="searchprice" class="dropdiv">
	                 <form>    
		                 <label>$</label><input type="text" name="startprice" id="s_price" class="txtprice" placeholder="0" ng-model="stratPrice" ng-keypress="filterValue($event)" requried/>
		                 <label>-</label><input type="text" name="endprice" id="e_price" class="txtprice" placeholder="0" ng-model="endPrice" ng-keypress="filterValue($event)" />      
		                 <input  type="submit"  ng-click="searchProByPrice()" name="btnsubmit" id="search"  class="btn btn-primary btn-sm" value="Go!">  
	                 </from>
                </div>
                <span class="hidediv" id="hide" ng-click="clearValue()">
                	{{'$'+stratPrice}}&emsp;-&emsp;{{'$'+endPrice}}
               		 <sup><i id="close" class="fa fa-times" aria-hidden="true"></i></sup>
               	 </span>
               <!--Sort Product  -->
               <select class="sort">
               		<option style="display:none;">តម្រៀបដោយ</option>
               		<option value='0'>ថ្មីៗ</option>
               		<option value='1'>ចុចច្រើន</option>
               </select> 
            
               
               
   </nav>
   <!-- End nav -->
   
   
   <!-- Product -->
      <div class="container" style="margin-top:-37px;">
       <div class="row">
        <div class="page-header">
          <h3>ទំនិញស្វែងរក</h3>
          <div class="col-sm-2" style="border:1px solid black">
         	 <p>Khmer24</p>
         	 <img src="${pageContext.request.contextPath}/resources/static/images/home/kh24.gif" alt="logo" style="width: 100%;"/>
          </div>
          <div class="col-sm-10"  >
          		<div id="owl-demo">
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				  <div class="item"><img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" alt="Owl Image"></div>
				 
				 
				</div>
  
          </div>
          
        </div><!-- Row -->
        
      
 		 <div>
 	  </div>
 
 
 <script>
	            $(document).ready(function(){
	            		
	                    $("#open").click(function(){
	                    	$('#searchprice').toggle();
	                    });
	                    $("#search").click(function(){
	                    	var sPrice=$('#s_price').val();
		            		var ePrice=$('#e_price').val();
	                    
	                    	$('#searchprice').toggle();
	                    	if(sPrice!=0 || ePrice!=0){
		                    	$('#hide').css('display','inline');
		                    	$('#open').hide();
	                    	}else{
	                    		
	                    		$('#hide').css('display','none');
	                    		$('#open').show();
	                    	}
	                    	
	                    }); 
	                    $("#owl-demo").owlCarousel({     
	                        items : 4,
	                        itemsDesktop : [1199,3],
	                        itemsDesktopSmall : [979,3]
	                   
	                    });
	                    
	                }); 
     </script>
 	<!-- Menu For Small Devices -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/menusmalldevice.jsp"></jsp:include>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/footer.jsp"></jsp:include>
	  
	
</body>
</html>