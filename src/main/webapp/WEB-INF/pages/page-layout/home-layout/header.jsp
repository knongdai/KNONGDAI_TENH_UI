<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="line, ecommerce bootstrap shop menu">
    <meta name="keywords" content="ecommerce, shop, shopping,navbar, side navabr, menu, HTML, CSS, JS, JavaScript, dashboard, bootstrap, front-end, frontend, web development, normal, side, navbar">
    <meta name="author" content="CodBits">
    <title>P-Collection</title>
  
     <!-- nara footer -->
   		 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/footer-makeup.css" />
   	 <!-- END -->
   	 <!-- Bootstrap -->
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" />
	 	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	 <!--PRODUCT LIST SEAK STYLE -->
	 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/grid-item.css" />
	 <!-- THEARA STYLE -->
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/line.css" />
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/mystyleshopping.css" />
	  <!--OWL.CAROUSEL -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/owl.carousel.css" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/owl.theme.css" />	
	  	
	 <!-- END -->
	 <!-- Jquery -->
   		<script src="${pageContext.request.contextPath}/resources/static/javascript/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <!-- Angularjs -->
  		 <script src="${pageContext.request.contextPath}/resources/static/javascript/angularjs.js"></script>
	<!--PRODUCT AngularJS -->
	 	<script src="${pageContext.request.contextPath}/resources/static/angular-app/product.js" ></script>
	 	<script src="${pageContext.request.contextPath}/resources/static/javascript/configuration.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/indexcategorystyle.css" />
 	<!-- Sweet Alert BOx -->
 	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/sweetalert.css" />
 	  <script src="${pageContext.request.contextPath}/resources/static/javascript/sweetalert.min.js"></script>
 	  
 	  <script src="http://login.knongdai.com/static/script/knongdai_login.js"></script>
 	  
 	   <script type="text/javascript"> var continueSite = "http://tenh.knongdai.com"</script>

		<sec:authorize access="isAnonymous()" > 
			<script type="text/javascript"> isAnonymous(continueSite);  </script> 
		</sec:authorize> 
 	  
 	  
	<script> 
    //get value from url
    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    </script>   
    
    <!-- AddNew Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">ចុះឈ្មោះប្រើប្រាស់</h4>
					<div class="modal-body">
						<form>
							
							<div class="form-group">
								<span>ឈ្មោះអ្នកប្រើប្រាស់</span>
								<input ng-model="username" type="text" class="form-control" placeholder="Enter username" required />
							</div>
							
							<div class="form-group">
								<span>លេខសម្ងាត់</span>
								<input ng-model="password" type="password" class="form-control" placeholder="Enter Password"
									required />
								<span id="pass"></span>
							</div>
							
							<div class="form-group">
								<span>បញ្ចូលលេខសម្ងាត់ម្តងទៀត</span>
								<input id="check" ng-model="cpassword" type="password"  class="form-control" placeholder="Enter Password"
									required />
									<span id="cpass"></span>
							</div>
							
							<div class="form-group">
								<label>ផ្សេងៗ</label>
								<textarea class="form-control" ng-model="description" class="form-control" id="editor1" rows="3"></textarea>
							</div>
							
							<div class="modal-footer">
								<a href="">
									<button type="button" class="btn btn-primary bu" data-dismiss="modal">បិទ</button>
								</a> <a href="">
									<button id="register" type="button" class="btn btn-primary" name="btnSave" ng-click="register()">ចុះឈ្មោះ</button>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    
    <script>
    	$(document).ready(function(){
    		
    		
    		/* var uname = $("#username").val();
    		var pass = $("#password").val();
    		var cpass = $("#cpassword").val();
    		var desc = $("#description").val();
    		
    		$("#register").click(function(){
    			alert(uname);
    			if(pass != cpass)
        		{
        			alert("Check Password");
        			return;
        		}else{
        			$.ajax({
            			url 	: URL_API+'user/register', 
            			method 	: 'post',
            			data 	: 
            			{
            				USERNAME	: uname,
            				PASSWORD	: cpass,
            				DESCRIPTION	: desc
            			},
            			headers : {'Authorization': KEYS},
            			success : function(response){
            				alert("Success");
            			}
            		});	
        		}
    		}) */
    		
    	});
    </script>
    <!-- scrolltop -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/scrolltop.jsp"></jsp:include>