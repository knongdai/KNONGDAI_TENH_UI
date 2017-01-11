<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>

			<i class="fa fa-user" aria-hidden="true"></i> <small>Change
				Password</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>
	<div class="container" style="width: 70%; margin-top: 50px;">
		<form role="form" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Old Password</label><input type="password"
					name="txtoldpassword" id="oldpassword" class="form-control"
					placeholder="Enter text" required />
			</div>
			<div class="form-group">
				<label>New Password</label><input name="txtnewpassword"
					type="password" id="newpassword" class="form-control"
					placeholder="Enter text" required />
			</div>
			<div class="form-group">
				<label>Comfrim Password</label><input name="txtcompassword"
					type="password" id="compassword" class="form-control"
					placeholder="Enter text" required />
			</div>
			<input type="submit" value="Save" name="btnsave"
				class="btn btn-primary " /> <input type="submit" value="Cancel"
				name="btncancel" class="btn btn-default" />
		</form>
	</div>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>
