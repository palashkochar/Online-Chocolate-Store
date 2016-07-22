<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/payment.js"></script>
<link rel="stylesheet" href="resources/css/paymentsuccess.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid headcolor">
		<div class="row">
			<div class="navbar-header size col-md-2 col-lg-offset-1">
				<a href="gohome.do"><img src="resources/images/companylogo.jpg"
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
				<div class="row margintopmd">
					<form action="viewcart.do" method="post">
						<div class="col-lg-5">
							<div class="form-group">
								<div class="input-group input-group-lg pull-right">
									<input type="submit" class="btn btn-sm btn-warning"
										value="View Cart" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="margincontainer height">
		<h3 class="row col-lg-offset-2">Payment Successful</h3>
		<form method="post" action="viewPdf.do" target="_blank">
			<input type="hidden" name="orderId" value="${orderID}" /> <input
				type="hidden" name="paymentId" value="${paymentID}" />
			<div class="form-group col-lg-offset-2">
				<div class="input-group input-group-lg">
					<input type="submit" name="submit" value="Genrate Invoice PDF"
						class="btn btn-sm btn-success" />
				</div>
			</div>

		</form>
	</div>
	<footer class="footer marginTop">
	<div class="margintop text-center">
		<p class="">© All Rights Reserved 2015</p>
	</div>
	</footer>
</body>
</html>