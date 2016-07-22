<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
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
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/signup.js"></script>
<link rel="stylesheet" href="resources/css/signup.css" />

<title>Sign Up Page</title>
</head>
<body>
	<div id="myCarousel" class="carousel slide carousel-fade"
		data-ride="carousel">

		<div class="carousel-inner">
			<div class="item active">
				<!-- <div class="fill" style="background-image:url('images/1blur.jpg');"> -->
				<img src="resources/images/f.jpg">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
				<!-- </div> -->
			</div>
			<div class="item">
				<!-- <div class="fill" style="background-image:url('/images/2blur.jpg');"> -->
				<img src="resources/images/c.jpg">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
				<!-- </div> -->
			</div>
			<div class="item">
				<!-- <div class="fill" style="background-image:url('/images/3blur.jpg');"> -->
				<img src="resources/images/d.jpg">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
				<!-- </div> -->
			</div>
		</div>
	</div>

	<div id="form" class="col-sm-4 font">
		<form method="POST" action="signup.do" name="signupform">
			<div class="opaque">
				<div class="row">
					<div class="col-lg-3">
						<h4 class="">Please sign up</h4>
					</div>
					<div class="col-lg-9">
						<div id="info" class="margintop text-right">
							<p id="allmsg" class="text-danger">
								<strong>* All Fields are mandatory!</strong>
							</p>
						</div>
						<!-- <div id="lastmsg" class=" text-right">
							<p id="errormsg" class="text-danger">
								<strong></strong>
							</p>
						</div> -->
					</div>
				</div>
				<fieldset class="fsStyle">
					<legend class="legendStyle">
						<a data-toggle="" data-target="#demo" href="#">Personal
							Details</a>
					</legend>
					<div class="collapse in" id="demo">
						<div class="row">
							<div class="col-lg-6">
								<p id="errorFirstName" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="firstName" class="form-control"
											onblur="firstNameVal()" placeholder="First Name">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errorLastName" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="lastName" class="form-control"
											onblur="lastNameVal()" placeholder="Last Name">

									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">
								<p id="errorAddress" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="address" class="form-control" id=""
											onblur="addressVal()" placeholder="Address">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errordob" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="dob" class="form-control" id=""
											onblur="dobVal()" placeholder="Date Of Birth">
									</div>
								</div>
							</div>
						</div>

						<div class="row marginbot">
							<div class="col-lg-4">
								<div class="form-group col-lg-2 padding">
									<div class="">
										<span class="gender">Gender</span>
									</div>
								</div>
								<div class="col-lg-7">
									<div class="btn-group padding" data-toggle="buttons">
										<label class="btn btn-default active"> <input
											type="radio" name="gender" checked="checked" value="Female" />
											Female
										</label> <label class="btn btn-default"> <input type="radio"
											name="gender" value="Male" /> Male
										</label>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<p id="errorEmail" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="email" class="form-control" id=""
											onblur="emailVal()" placeholder="Email Id">

									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<p id="errorPhoneNo" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="phoneNo" class="form-control" id=""
											onblur="phoneNoVal()" placeholder="Phone No">
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>

				<fieldset class="fsStyle">
					<legend class="legendStyle">
						<a data-toggle="" data-target="#demo1" href="#">User Account
							Details</a>
					</legend>
					<div class="collapse in" id="demo1">
						<div class="row">
							<div class="col-lg-6">
								<p id="errorUsername" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="username" class="form-control"
											id="username" onblur="usernameVal()" placeholder="User Name">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="match" class="text-danger col-sm-12">
									<strong></strong>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<p id="errorPassword" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="password" name="password" class="form-control"
											onblur="passwordVal()" placeholder="Password">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errorConfirmPassword" class="text-danger col-sm-12">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="password" name="confirmPassword" class="form-control"
											id="" onblur="matchOrConfirm()"
											placeholder="Confirm Password">

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-4 col-lg-offset-4 text-right">
								<div class="input-group input-group-lg">
									<input type="submit" name="submit" value="Signup"
										onclick="return submitVal()" class="btn btn-sm btn-primary"
										data-toggle="popover" data-placement="right"
										data-content="One or more fields are empty!" id="signup"
										disabled />
								</div>
							</div>
							<div class="form-group col-lg-4">
								<div id="lastmsg" class=" text-right">
									<p id="errormsg" class="text-danger msgfont">
										<strong></strong>
									</p>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>