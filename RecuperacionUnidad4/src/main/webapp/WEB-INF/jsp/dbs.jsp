<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Dbs Manager | Home</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/all-dbs">All Dbs</a></li>
					<li><a href="/new-db">New db</a></li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Db Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_DBS'}">
			<div class="container text-center" id="dbsDiv">
				<h3>My Dbs</h3>
				<hr />
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>FullName</th>
								<th>DataType</th>
								<th>Generic url</th>
								<th>Url syntax</th>
								<th>Url example</th>
								<th>Url prefix</th>

							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="db" items="${dbs}">
									<tr>
									<td>${db.id}</td>
									<td>${db.name}</td>
									<td>${db.fullName}</td>
									<td>${db.dataType}</td>
									<td>${db.genericUrl}</td>
									<td>${db.urlSyntax}</td>
									<td>${db.urlExample}</td>
									<td>${db.urlPrefix}</td>

										<td>
											<a href="update-db?id=${db.id}">
												<span class="glyphicon glyphicon-pencil"></span>
											</a>
										</td>
										<td>
											<a href="delete-db?id=${db.id}">
												<span class="glyphicon glyphicon-trash"></span>
											</a>
										</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode=='MODE_NEW' || mode=='MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Db</h3>
				<hr />
				<form class="form-horizontal" method="POST" action="save-db">
					<input type="hidden" name="id" value="${db.id}"/>
					<div class="form-group">
						<label class="control-label col-sm-3">Name:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="name"
								value="${db.name}" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">Full Name:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="fullName"
								value="${db.fullName}" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">Data Type:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="dataType"
								value="${db.dataType}" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">Generic url:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="genericUrl"
								value="${db.genericUrl}" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">Url syntax:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="urlSyntax"
								value="${db.urlSyntax}" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-3">Url example:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="urlExample"
								value="${db.urlExample}" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">Url prefix:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="urlPrefix"
								value="${db.urlPrefix}" />
						</div>
					</div>
						
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Save" />
						</div>
						
				</form>
			</div>
		
		</c:when>
	</c:choose>

	<script type="text/javascript" src="/static/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js">
		
	</script>

</body>
</html>