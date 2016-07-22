<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/login.css" />
<title>Login</title>
<style>
</style>
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

		<div id="form" class="col-sm-4 font">
			<form:form method="POST" commandName="user" action="login.go"
				class="form-horizontal h3" role="form" name="loginform">
				<div class="opaque">
					<h2 class="">Please log in</h2>
					<div class="form-group">
						<div class="input-group input-group-lg center">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span>
							<form:input path="username" placeholder="Enter Username"
								class="form-control" />
						</div>
						<div class="input-group input-group-lg center">
							<form:errors path="username" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group input-group-lg center">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span>
							<form:input path="password" placeholder="Enter Password"
								type="password" class="form-control" />
						</div>
						<div class="input-group input-group-lg center">
							<form:errors path="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group input-group-lg center font">
							<input type="checkbox" name="rememberme" value="RememberMe" /> <label
								class="control-label" for="rememberme">Remember Me</label>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group input-group-lg center">
							<input type="submit" name="submit" value="Login"
								class="btn btn-sm btn-primary" />
						</div>
					</div>
				</div>
			</form:form>
			<form method="POST" action="goToSignUp.go" class="form-horizontal h3"
				role="form">
				<div class="opaque margintop signup">
					<div class="form-group">
						<div class="input-group input-group-lg center font">
							<label class="control-label center" for="rememberme">Not
								a member?</label><br> <input type="submit" name="submit"
								value="Signup" class="btn btn-sm btn-primary" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
