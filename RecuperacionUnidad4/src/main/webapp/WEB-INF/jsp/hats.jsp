<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Hats Manager | Home</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/all-hats">All Hats</a></li>
					<li><a href="/new-hat">New Hat</a></li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Hat Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_HATS'}">
			<div class="container text-center" id="hatsDiv">
				<h3>My hats</h3>
				<hr />
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Model</th>
								<th>Description</th>
								<th>Size</th>

							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="hat" items="${hats}">
									<tr>
										<td>${hat.id}</td>
										<td>${hat.model}</td>
										<td>${hat.description}</td>
										<td>${hat.size}</td>
										
										
										<td>
											<a href="update-hat?id=${hat.id}">
												<span class="glyphicon glyphicon-pencil"></span>
											</a>
										</td>
										<td>
											<a href="delete-hat?id=${hat.id}">
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
				<h3>Manage Hat</h3>
				<hr />
				<form class="form-horizontal" method="POST" action="save-hat">
					<input type="hidden" name="id" value="${hat.id}"/>
					
					
						<div class="form-group">
							<label class="control-label col-sm-3">Model:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="model" value="${hat.model }" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Description:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="description" value="${hat.description }" />
							</div>
						</div>
						
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3">Size:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="size" value="${hat.size }" />
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