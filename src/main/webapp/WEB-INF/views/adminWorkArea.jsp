<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/adminWorkArea.css" />
<script type="text/javascript" src="resources/js/adminWorkArea.js"></script>

<title>Admin Work Area</title>
</head>
<body>
	<!-- Fixed navbar -->
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid headcolor">
		<div class="row">
			<div class="navbar-header size col-md-2 col-lg-offset-1">
				<a href="#"><img src="resources/images/companylogo.jpg"
					width=100% height=100% /></a>
			</div>
			<div class="col-md-5 col-md-offset-1">
				<div class="row marginsearch"></div>
			</div>
			<!-- <div class="row text-right"> -->
			<div class="col-md-3">
				<div class="row">
					<form method="POST" action="logout.go" class="" role="form">
						<div class="col-lg-5 marginLogout">
							<div class="form-group">
								<div class="input-group input-group-lg pull-right">
									<input type="submit" name="logout" value="Logout"
										class="btn btn-sm btn-warning" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="row margintopmd"></div>
			</div>
		</div>
	</div>
	</nav>
	<div class="container margincontainer">
		<div class="row text-center">
			<div class="col-lg-6">
				<div class="row text-right">
					<button type="button" id="addComp" class="btn btn-primary">Add
						Company</button>
				</div>
				<div class="row col-lg-11">
					<div class="" id="addCompany">
						<form class="text-left" id="regCompany" action="addCompany.do"
							method="post">
							<h3>Add Company</h3>
							<div class="form-group" id="errors1"></div>
							<div class="form-group">
								<!-- <label for="company">Company Name</label> -->
								<input type="text" class="form-control" name="companyName"
									id="companyName" placeholder="Enter Company Name">
							</div>
							<div class="form-group">
								<!-- <label for="company">Company Name</label> -->
								<input type="text" class="form-control" name="username"
									id="username" placeholder="Enter Username"
									onkeyup="ajaxFunction()">
								<p id="match" class="text-danger"></p>
							</div>
							<div class="form-group">
								<!-- <label for="company">Company Name</label> -->
								<input type="text" class="form-control" name="password"
									id="password" placeholder="Enter Password">
							</div>
							<br> <input type="submit" class="btn btn-default margin"
								value="Add Company" id="signup" disabled />
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row text-left">
					<button type="button" id="addCat" class="btn btn-primary">Add
						Category</button>
				</div>
				<div class="row col-lg-11">
					<div class="" id="addCategory">
						<form class="text-left" id="regCategory" method="post"
							action="addCategory.do">
							<h3>Add Category</h3>
							<div class="form-group" id="errors2"></div>
							<div class="form-group">
								<!-- <label for="category">Category Name</label> -->
								<input type="text" class="form-control" name="categoryName"
									id="category" placeholder="Enter Category">
							</div>
							<br> <input type="submit" class="btn btn-default margin"
								value="Add Category" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>