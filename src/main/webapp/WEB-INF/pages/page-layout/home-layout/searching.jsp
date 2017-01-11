<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script type="text/ng-template" id="customTemplate.html">
  			<a>
      			<span bind-html-unsafe="match.label | typeaheadHighlight:query"></span>
      			<i>{{match.model.TITLE}}</i>
  			</a>
</script>

	
<!--SEARCH BOX-->
       <div class="line-navbar-two">
         <form class="navbar-form navbar-left lnt-search-form" role="search">
         <!--DROP RESULT BOX--> 
		 	<script type="text/ng-template" id="customTemplate.html">
	 		 <a>
	     		 <span bind-html-unsafe="match.label | typeaheadHighlight:query"></span>
	      		 
	 		 </a>
			</script>
            <div class="form-group">
              <div class="form-group">
              <div class="input-group">
                  
                  <select class="selectstyle pull-left" ng-model="mcategoryId" 
                  	ng-options="mcategory.ID as mcategory.CATEGORY for mcategory in maincategory">
                 	 <option value="" >ទាំងអស់</option>
                  </select>
                  
                	<input type="text" class="form-control lnt-search-input" aria-label="Search" ng-change="findProductByTitle()" placeholder="ស្វែងរកទំនិញ..." load-on-focus='false'  ng-model="title"  typeahead="c as c.TITLE for c in proSearch | filter:$viewValue | limitTo:15" typeahead-min-length='1'  typeahead-template-url="customTemplate.html" required/>
             
              </div><!-- /input-group -->
             
            </div>
            </div>
            <button type="submit" class="btn btn-search" ng-click="searchTitle()"><span class="fa fa-search"></span></button>
          </form> <!-- /.lnt-search-form -->
        </div>
        
       
          
