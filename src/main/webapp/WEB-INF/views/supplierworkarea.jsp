<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script src="resources/js/supplierWorkArea.js"></script>
<link rel="stylesheet" href="resources/css/supplierWorkArea.css" />

<title>add chocolate</title>
<style>
</style>
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
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3" id="addCompany">
				<form class="" id="addChocolate" method="post"
					action="addChocolate.do">
					<h2>${company.person.companyName}</h2>
					<h3>Add Chocolate</h3>
					<input type="hidden" value="${company.person.companyName}"
						name="companyName">
					<div id="msgDiv">
						<p id="errormsg" class="text-danger"></p>
					</div>
					<div class="form-group">
						<label for="category">Select Chocolate Category</label> <select
							id="selectbasic" name="category" class="form-control"
							title="Select Chocolate Category">
							<c:forEach var="item" items="${categories}">
								<option value="${item}">${item}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<!-- <label for="company">Email Id</label> -->
						<input id="chocolateName" name="chocolateName"
							class="form-control input-md" type="text" maxlength="100"
							onblur="validateChocolateName()"
							placeholder="Enter Name of Chocolate">
						<p id="chocolateNameError" class="text-danger"></p>
					</div>
					<div class="form-group">
						<!-- <label for="company">Company Name</label> -->
						<textarea class="form-control" id="textarea" maxlength="200"
							name="desc" placeholder="Add here description of chocolate"></textarea>
					</div>
					<div class="form-group">
						<!-- <label for="company">Company Name</label> -->
						<input id="quantity" name="quantity" class="form-control input-md"
							type="text" maxlength="3" onblur="validateQuantity()"
							placeholder="Enter Quantity of Chocolate">
						<p id="quantityError" class="text-danger"></p>
					</div>
					<div class="form-group">
						<!-- <label for="company">Company Name</label> -->
						<input id="price" name="price" class="form-control input-md"
							type="text" maxlength="5" onblur="validatePrice()"
							placeholder="Enter Price of Chocolate">
						<p id="priceError" class="text-danger"></p>
					</div>
					<div class="form-group">
						<label for="company" class="">Upload Picture</label> <input
							id="filebutton" name="upload" class="" type="file"
							value="Upload Image" onblur="validateUpload()" /> <input
							type="text" id="imgname" name="putImage" placeHolder="" />
					</div>
					<div>
						<input type="button" onClick="uploadFunction()" value="Uplaod" />
					</div>

					<!-- <div class="form-group">
						<div class="input-group input-group-lg center-block">
							<label class="control-label col-sm-5" for="image">Upload
								Picture* </label> <input type="file" name="image" id="image" class=""
								onblur="validateUpload()" /> <input type="text" id="putImage"
								name="putImage" placeHolder="File not uploaded yet." /><br />
							<p id="uploadError" class="text-danger col-sm-12"></p>
						</div>
					</div> -->

					<div class="form-group">
						<!-- <input type = "submit" class="btn" id="singlebutton" name="signup" value="Sign Up Me!" onclick = "return validate()"/> -->
						<input type="submit" id="singlebutton" name="addChocolate"
							class="btn btn-primary" onclick="return validate()"
							value="Add Chocolate" disabled>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>