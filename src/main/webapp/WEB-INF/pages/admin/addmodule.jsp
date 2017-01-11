<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/header.jsp"></jsp:include>

<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-th" aria-hidden="true"></i><small>Module
				Website</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>
	<!-- table -->
	<div class="panel-body">
		<div class="dataTable_wrapper">
			<div class="row">
				<div class="col-xs-12 table-responsive">
					<table class="table table-bordered  table-hover">
						<thead>
							<tr>
								<th colspan="12">
									<div class="row">
										<div class="col-md-3 pull-left">
											<button type="button" class="btn btn-info pull-left"
												data-toggle="modal" data-target="#exampleModal"
												data-whatever="@mdo">
												<i class="glyphicon glyphicon-plus"></i>New
											</button>
										</div>
						</thead>

						<thead>
							<tr style="background-color: #4682B4; color: white;">
								<th>ID</th>
								<th>Domain</th>
								<th>URL</th>
								<th>Row_Selec</th>
								<th>Image_Selec</th>
								<th>Image_Attr</th>
								<th>Link_Selec</th>
								<th>Title_Selec</th>
								<th>Price_Selec</th>
								<th>Des_Selec</th>
								<th>Action</th>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button type="button" class="btn btn-info btn-sm"
										data-toggle="modal" data-target="#exampleModalEdit"
										data-whatever="@mdo">Edit</button>
									<button type="button" class="btn btn-danger btn-sm">Delete</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-xs-12">
				<button class="btn btn-primary pull-right">Clear</button>
			</div>


		</div>
	</div>

</aside>
</div>
<!-- NEW-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">New</h4>
				<div class="modal-body">
					<form role="form" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label>Domain Name</label><input name="txtdomain" id="domain"
								class="form-control" placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>URL</label><input name="txxurl" type="text" id="url"
								class="form-control" placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>Logo</label><input name="txtlogo" type="text" id="logo"
								class="form-control" placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>Row Selector</label><input name="txtrow" type="text"
								id="row" class="form-control" placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>Image Selector</label><input name="txtimg" type="text"
								id="image" class="form-control" placeholder="Enter text"
								required />
						</div>
						<div class="form-group">
							<label>Image Attribute</label><input name="txtimgAttr"
								type="text" id="password" class="form-control"
								placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>Link Selector</label><input name="txtlink" type="text"
								id="link" class="form-control" placeholder="Enter text" required />
						</div>
						<div class="form-group">
							<label>Title Selector</label><input name="txttitle" type="text"
								id="title" class="form-control" placeholder="Enter text"
								required />
						</div>
						<div class="form-group">
							<label>Price Selector</label><input name="txtprice" type="text"
								id="price" class="form-control" placeholder="Enter text"
								required />
						</div>
						<div class="form-group">
							<label>Description Selector</label><input name="txtxdes"
								type="text" id="description" class="form-control"
								placeholder="Enter text" required />
						</div>
				</div>
				<div class="modal-footer">
					<a href="">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</a> <a href="">
						<button type="submit" class="btn btn-primary" name="btnSave">Test</button>
					</a>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
<!--Modal Edit-->
<div class="modal fade" id="exampleModalEdit" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">Edit</h4>
			</div>
			<div class="modal-body">
				<form role="form" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>Domain Name</label><input name="txtdomain" id="domain"
							class="form-control" placeholder="Enter text" required />
					</div>
					<div class="form-group">
						<label>URL</label><input name="txxurledit" type="text"
							id="urledit" class="form-control" placeholder="Enter text"
							required />
					</div>
					<div class="form-group">
						<label>Logo</label><input name="txtlogoedit" type="text"
							id="logoedit" class="form-control" placeholder="Enter text"
							required />
					</div>
					<div class="form-group">
						<label>Row Selector</label><input name="txtrowedit" type="text"
							id="rowedit" class="form-control" placeholder="Enter text"
							required />
					</div>
					<div class="form-group">
						<label>Image Selector</label><input name="txtimgedit" type="text"
							id="imageedit" class="form-control" placeholder="Enter text"
							required />
					</div>
					<div class="form-group">
						<label>Image Attribute</label><input name="txtimgAttredit"
							type="text" id="imgAttredit" class="form-control"
							placeholder="Enter text" required />
					</div>
					<div class="form-group">
						<label>Link Selector</label><input name="txtlinkedit" type="text"
							id="linkedit" class="form-control" placeholder="Enter text"
							required />
					</div>
					<div class="form-group">
						<label>Title Selector</label><input name="txttitleedit"
							type="text" id="titleedit" class="form-control"
							placeholder="Enter text" required />
					</div>
					<div class="form-group">
						<label>Price Selector</label><input name="txtpriceedit"
							type="text" id="priceedit" class="form-control"
							placeholder="Enter text" required />
					</div>
					<div class="form-group">
						<label>Description Selector</label><input name="txtxdesedit"
							type="text" id="descriptionedit" class="form-control"
							placeholder="Enter text" required />
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Send message</button>
			</div>
		</div>
	</div>


	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/pages/page-layout/admin-layout/footer.jsp"></jsp:include>
