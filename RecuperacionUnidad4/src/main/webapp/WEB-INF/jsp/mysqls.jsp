<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Msql Manager | Home</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-mysql">New Mysql</a></li>
					<li><a href="all-mysqls">All Mysqls</a></li>

				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Mysql Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_MYSQLS'}">
			<div class="container text-center" id="mysqlsDiv">
				<h3>My mysql</h3>
				<hr />
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>DATABASE</th>
								<th>HOSTNAME</th>
								<th>PASSWORD</th>
								<th>USERNAME</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="mysql" items="${mysqls}">
									<tr>
										<td>${mysql.id}</td>
										<td>${mysql.dataBase}</td>
										<td>${mysql.hostname}</td>
										<td>${mysql.password}</td>
										<td>${mysql.username}</td>
																				
										<td>
											<a href="update-mysql?id=${mysql.id}">
												<span class="glyphicon glyphicon-pencil"></span>
											</a>
										</td>
										<td>
											<a href="delete-mysql?id=${mysql.id}">
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
				<h3>Manage Mysql</h3>
				<hr />
				<form class="form-horizontal" method="POST" action="save-mysql">
					<input type="hidden" name="id" value="${mysql.id}"/>
					
						<div class="form-group">
							<label class="control-label col-sm-3">Data Base:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="dataBase" value="${mysql.dataBase}" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Hostname:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="hostname" value="${mysql.hostname }" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Password:</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password" value="${mysql.password}" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Username:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="username" value="${mysql.username}" />
							</div>
						</div>
												
						
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Save" />
						</div>
						
				</form>
			</div>
		
		</c:when>
		
		
		
	</c:choose>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
	
</body>
</html>