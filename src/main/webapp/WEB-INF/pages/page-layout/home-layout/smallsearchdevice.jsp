<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <!-- Collect the nav links, forms, and other content for toggling -->
     <div class="collapse navbar-collapse" id="line-navbar-collapse-1">
          <form class="navbar-form navbar-left lno-search-form visible-xs" role="search">
              <div class="form-group col-sm-12">
              	 <select class="selectstyle pull-left" ng-model="mcategoryId" 
                  	ng-options="mcategory.ID as mcategory.CATEGORY for mcategory in maincategory">
                 	 <option value="" >ទាំងអស់</option>
                  </select>
               <input type="text" class="form-control lnt-search-input" aria-label="Search" ng-change="findProductByTitle()" placeholder="ស្វែងរកទំនិញ..." load-on-focus='false'  ng-model="title"  typeahead="c as c.TITLE for c in proSearch | filter:$viewValue | limitTo:15" typeahead-min-length='1'  typeahead-template-url="customTemplate.html" required/>
              </div>
            <button type="submit" class="btn btn-search paddingo">
            	<span class="fa fa-search " style="padding-top:0px;"> </span>
            </button>
          </form>
