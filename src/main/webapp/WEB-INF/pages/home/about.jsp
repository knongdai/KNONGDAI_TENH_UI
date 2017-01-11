<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myAboutApp">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/header.jsp"></jsp:include>
	<title>Tos Tenh | About</title>
	 <sec:authorize access="isAuthenticated()">
	 	<sec:authentication property="principal.userid" var="userid"/>
	 </sec:authorize>
	<!--PRODUCT AngularJS -->
	 	<script src="${pageContext.request.contextPath}/resources/static/angular-app/about.js" ></script>
</head>
<body ng-controller="myAboutCtr"  ng-init="getwishlist(${userid});" >
	<!-- INCLUDE WEB HEADER -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/webheader.jsp"></jsp:include>
	<!-- END -->
   <!--Filter Product-->
	<div class="container">
			<div class="col-sm-12 about" >		
				<h3 >About Us</h3>
					<hr>
				<div class="col-sm-12 about">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3908.6661823004756!2d104.88697831490742!3d11.57577124709508!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3109519cfc0bdfb1%3A0x2c2974b77cdaff4b!2sKorea+Software+HRD+Center!5e0!3m2!1sen!2skh!4v1472177126470" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div><!-- end of col-sm-12 about -->
				<div class="col-sm-12 about">
					<div class="col-sm-6" >
						<div>
							&emsp;<b>តោះទិញ</b> គឺជាអនឡាញវេបសាយមួយដែលបានប្រមូលផ្តុំនូវផលិតផលជាច្រើនប្រភេទពីបណ្តាគេហទំព័រលក់ទំនិញអនឡាញដែលពេញនិយមនៅក្នុងប្រទេសកម្ពុជា។
							គ្រប់ផលិតផលទាំងអស់នៅក្នុងវេបសាយ តោះទិញ ធានាថានឹងស្ថិតក្នុងប្រភេទទំនិញច្បាស់លាស់ ដែលអាចផ្តល់ភាពងាយស្រូលដល់អតិថជនក្នុងការស្វែងរកទំនិញ
							បានរហ័ស និង ងាយស្រូលចំណេញពេលវេលា និង អាចធ្វើការប្រៀបធៀបតម្លៃនិង​គុណភាពរបស់ផលិតផលរវាងបណ្តាវេបសាយទាំងឡាយដែលមានដាក់លក់នូវ
							ទំនិញដូចគ្នា។
						</div>
						<div>
							<h4 class="content"><b>ដំណើរការក្នុងការចូលប្រើប្រាស់  តោះទិញ អនឡាញវេបសាយ</b></h4>
							<p>
							 &emsp;គ្រប់អ្នកប្រើប្រាស់ទាំងអស់អាចចូលមកកាន់អនឡាញវេបសាយល្បីដើម្បីស្វែងរកនូវទំនិញដែលចង់ទិញទោះបីជាមិនបានធ្វើការចុះឈ្មោះជាអតិថជនរបស់វេបសាយ
							 យើងក៏ដោយ។ប៉ុន្តែចំពោះអ្នកប្រើប្រាស់ណាដែលបានចុះឈ្មោះជាអតិថជនរបស់អនឡាញវេបសាយ តោះទិញ នោះអ្នកប្រើប្រាស់អាចនិងមានសិទ្ធក្នុងការយកទំនិញ  Add ចូល
							 ទៅក្នុង Favorite ទំនិញដើម្បីធ្វើការទិញនៅពេលណាក៏បាន។លើសពីនេះទៀត អនឡាញវេបសាយ តោះទិញ ក៏មានបន្ថែមនូវ History របស់អតិថជន  សំរាប់ឲ្យ អតិថជន
							 អាចចូលទៅមើលឡើងវិញនូវទំនិញដែលគេធ្លាប់បានចូលទៅមើល។
							</p>
						</div>
					</div><!-- end of col-sm-6 -->
					<div class="col-sm-6" style="border:1px solid black">
						<img src="${pageContext.request.contextPath}/resources/static/images/home/tostenhfooter.png" class="lan pull-right aboutlogo" />
					</div><!-- end of col-sm-6 -->
				</div><!-- end of col-sm-12 about -->
				</div>
				
			</div>
		<script type="text/javascript"></script>
 	<!-- Menu For Small Devices -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/menusmalldevice.jsp"></jsp:include>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/home-layout/footer.jsp"></jsp:include>
	  
	
</body>
</html>