<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <!-- Event menu for small device  -->
    <script type="text/javascript">
        
            
  </script>
  <style>
  		.sub1{
  			display:none;
  		}
  		.menuBackground {
			background: #fff;
			
		}
.dropDownMenu a {
	color: #FFF;
}
.dropDownMenu,
.dropDownMenu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
.dropDownMenu li {
	position: relative;
	width: 233px;

}
.dropDownMenu a {
	padding: 10px 20px;
	display: block;
	color:black;
	text-decoration: none;
}
.dropDownMenu a:hover {
	background: #fff;
    color: #007abf;
}

/* Level 1 Drop Down Menu */
.dropDownMenu > li {
	display: block;
	vertical-align: top;
	margin-left: -4px; /* solve the 4 pixels spacing between list-items */
}
.dropDownMenu > li:first-child {
	margin-left: 0;
}
.dropDownMenu > li > a {
	width:215px;
	border-bottom: 1px solid #eee;
}
.dropDownMenu > li > a:hover {
	color: red;
	background-color:#fff;

}
.dropDownMenu > li > ul >li > a{
	color:white;
}


/* Level 2 */
.dropDownMenu > li > ul {
	text-align: left;
	width: auto; /* change auto value with 200px if you want a bigger menu */
	display: none;
	background: #007abf;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 9999999; /* if you have YouTube iframes, is good to have a bigger z-index so the video can appear above the video */
}
.dropDownMenu > li:hover > ul {
	display: block;
}
.dropDownMenu ul li a {}
.dropDownMenu ul li a:hover {

}



/* Level 3 */
.dropDownMenu > li > ul > li > ul {
	text-align: left;
	display: none;

	position: absolute;
	left: 100%;
	top: 0;
	z-index: 9999999;
}
.dropDownMenu > li > ul > li:hover > ul {
	display: block;
}
.dropDownMenu ul ul li {}
.dropDownMenu ul ul li a {
	position: relative;
    background-color: #F0FFF0;
    right: 233px;
    border-bottom: 1px solid #eee;
    top: 38px;
    
}
.dropDownMenu ul ul li a:hover {}
  </style>
<!-- Line left navbar for secondary navbar on small devices -->
    <div class="line-navbar-left"  >
	   <div class="menuBackground">
		<ul class="dropDownMenu">
			<li ng-repeat="maincate in maincategory" ng-init="test = $index">
				<a href="">{{maincate.CATEGORY}}<i class="fa fa-caret-down pull-right" aria-hidden="true"></i></a>
				
				<ul  >
					<li ng-repeat="sub1 in maincategory[test].SUB_CATEGORY ">
						<a href="">{{sub1.SUB_CATEGORY}}<i style="margin-right:20px;" class="fa fa-caret-down pull-right" aria-hidden="true"></i></a>
					
						<ul class="subtwo">
							<li ng-repeat="sub2 in sub1.SUB_TWO_CATEGORY" ng-click="getSub2Id($event)" >
							<a ${pageContext.request.contextPath}/home/product?id={{sub2.ID}}&sub1Id={{sub1.ID}}"" data-value="{{sub2.ID}}">{{sub2.SUB_CATEGORY}}</a></li>
							
						</ul>
					</li>
					
				</ul>
			</li>
			
			
		</ul>
</div>
		
			
		
    </div> 
    <!-- /.line-navbar-left -->