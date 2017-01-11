<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login page</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/AdminLTE.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/skin/_all-skins.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/mystyle.css" />
<!-- AngualarJS -->
<script
	src="${pageContext.request.contextPath}/resources/static/javascript/angularjs.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/javascript/scriptdata.js"></script>

</head>
<body style="background-color: #eee;">
	<form id="frmLogin" action="${pageContext.request.contextPath}/phsarnet/login"
		method="post">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Sign In</h3>
			</div>
			<br>
			<div class="panel-body">
				<input type="text" name="username" class="form-control"
					placeholder="User Name" />
			</div>
			<div class="panel-body">
				<input type="password" name="password" class="form-control"
					placeholder="Password" />
			</div>
			<span id="remenber"></span>
			<div class="panel-body">
				<input type="checkbox" name="remember_me" /> Remember me
			</div>
			<button type="submit" class="btn btn-primary form-control">Login</button>

		</div>
	</form>
	<script
		src="${pageContext.request.contextPath}/resources/static/javascript/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/static/javascript/custom-script/ajax-login.js"></script>

</body>
</html>