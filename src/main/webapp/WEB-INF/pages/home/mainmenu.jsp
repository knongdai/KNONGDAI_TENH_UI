
 	<ul class="nav navbar-nav lnt-nav-mega  navbar navbar-static-top line-navbar-two" id="line-navbar-collapse-2" style="z-index:999999999999;">
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                <span class="fa fa-bars"></span>
           </a>
           <div class="dropdown-menu dropstyle" role="menu">
               <div class="lnt-dropdown-mega-menu" >
				<!-- List of Main categories -->
                 <ul class="mn-vnavigation" id="mn-vnavigation" ng-repeat="maincate in maincategory" ng-init="test = $index">
                          <li class="dropdown-submenu">
                            <a tabindex="-1" href="#" >{{maincate.CATEGORY}}</a>
                            <ul class="dropdown-menu  remove-after-before" style="background-color:white;height: 571px;width: 250px;margin-top: 1px;">
                              <li class="dropdown-submenu" ng-repeat="sub1 in maincategory[test].SUB_CATEGORY ">
                                <a href="#">{{sub1.SUB_CATEGORY}}</a>
                                <ul class=" remove-after-before dropdown-menu parent" style="background-color:white;height: 571px;">
                                  <li ng-repeat="sub2 in sub1.SUB_TWO_CATEGORY" ng-click="getSub2Id($event)"  >
                                  	<a href="${pageContext.request.contextPath}/home/product?id={{sub2.ID}}&sub1Id={{sub1.ID}}"" data-value="{{sub2.ID}}">{{sub2.SUB_CATEGORY}}</a>
                                  </li>
                                </ul>
                              </li>
                            </ul>
                          </li><!-- dropdown-submenu -->
                 </ul>
               </div>
            </div>
         </li>
     </ul>
 