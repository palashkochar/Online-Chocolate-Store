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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/shoppingcart.js"></script>
<link rel="stylesheet" href="resources/css/shoppingcart.css" />

<title></title>

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

	<div class="margincontainer">
		<h3 class="row col-lg-offset-2">My Cart</h3>
		<div class="margintop">
			<form action="proceedforpayment.do" method="post">
				<input type="hidden" value="${cart.orderId}" name="orderId">
				<div class="row">
					<div class="row">
						<div class="col-lg-3 col-lg-offset-2 pull-left bordertop">
							<h3>Product Deatils</h3>
						</div>
						<div class="col-lg-1 pull-left bordertop">
							<h3>Unit Price</h3>
						</div>
						<div class="col-lg-1 pull-left bordertop">
							<h3>Quantity</h3>
						</div>
						<div class="col-lg-1 pull-left bordertop">
							<h3>Options</h3>
						</div>
						<div class="col-lg-1 bordertop">
							<h3>Subtotal</h3>
						</div>
					</div>
					<c:forEach var="orderItem" items="${cart.orderItem}">
						<div class="row padding">
							<div class="col-lg-3 col-lg-offset-2 pull-left">
								${orderItem.chocolate.chocolateName}</div>
							<div class="col-lg-1">${orderItem.chocolate.price}</div>
							<div class="col-lg-1">${orderItem.quantity}</div>
							<div class="col-lg-1">
								<a
									href="deleteOrderItem.do?orderItemid=${orderItem.orderItemId}&orderID=${cart.orderId}">
									Delete</a>
							</div>
							<div class="col-lg-1">${orderItem.totalCost}</div>
						</div>
					</c:forEach>
					<div class="row space">
						<div class="col-lg-6 col-lg-offset-2 pull-left">
							<h3>Cart Total</h3>
						</div>
						<div class="col-lg-1">
							<h3>${cart.orderTotal}</h3>
						</div>
					</div>
				</div>
				<div class="row space">
					<div class="col-lg-5 col-lg-offset-2 bordertop"></div>
					<div class="col-lg-2 bordertop">
						<input type="submit" class="btn btn-warning margintopmd"
							id="payment" name="payment" value="Proceed To Payment" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<footer class="footer marginTop">
		<div class="margintop text-center">
			<p class="">© All Rights Reserved 2015</p>
		</div>
	</footer>
</body>
</html>