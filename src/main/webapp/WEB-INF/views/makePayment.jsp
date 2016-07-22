<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
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
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/payment.js"></script>
<!-- <script type="text/javascript">
	/* window.history.forward(); */
	function noBack() {
		window.history.forward();
	}
</script> -->

<link rel="stylesheet" href="resources/css/makepayment.css" />
<title></title>
</head>
<!-- <body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload=""> -->
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

	<div class="margincontainer">
		<h3 class="row col-lg-offset-2">Make Payment</h3>
		<div class="row margintop">
			<div class="col-lg-4 col-lg-offset-3">
				<form name="makePayment" id="makePayment" action="makepayment.do"
					method="post">
					<input type="hidden" name="orderId" value="${orderId}">
					<div class="form-group" id="errors"></div>
					<div class="form-group">
						<label class="row" control-label" for="name">Name on Card</label>
						<div class="">
							<input id="name" name="name" class="form-control input-md"
								type="text" maxlength="100">
						</div>
					</div>
					<div class="form-group">
						<label class="row" control-label" for="cardNumber">Card
							Number</label>
						<div class="row">
							<div class="col-lg-3">
								<input id="cardNumber1" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="moveFunction(this)">
							</div>
							<div class="col-lg-3">
								<input id="cardNumber2" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="moveFunction(this)">
							</div>
							<div class="col-lg-3">
								<input id="cardNumber3" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="moveFunction(this)">
							</div>
							<div class="col-lg-3">
								<input id="cardNumber4" name="cardNumber"
									class="form-control input-md" type="text" maxlength="4"
									onkeyup="moveFunction(this)">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div id="info">
							<p id="errormsg" class="text-danger"></p>
						</div>
						<label class="row" for="selectbasic">Expiration Date</label>

						<div class="row">
							<div class="col-lg-3">
								<select id="month" name="month" class="form-control">
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
							<div class="col-lg-3">
								<select id="year" name="year" class="form-control">
									<option value="13">2017</option>
									<option value="14">2018</option>
									<option value="15">2019</option>
									<option value="16">2020</option>
									<option value="17">2021</option>
									<option value="18">2022</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="row" for="cvv">CVV</label>
						<!-- <img
							src="resources/images/cvv.png"> -->
						<div class="">
							<input id="cvv" name="cvv" class="form-control input-md"
								type="text" maxlength="3">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="submit" class="btn btn-primary" id="singlebutton"
								name="pay" value="Pay" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer class="footer marginTop">
		<div class="margintop text-center">
			<p class="">© All Rights Reserved 2015</p>
		</div>
	</footer>
</body>
</html>