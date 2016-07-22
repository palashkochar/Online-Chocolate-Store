<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/productdetails.js"></script>
<link rel="stylesheet" href="resources/css/productdetails.css" />

<title></title>

</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid headcolor">
		<div class="row">
			<div class="navbar-header size col-md-2 col-lg-offset-1">
				<a href="gohome.do"><img src="resources/images/companylogo.jpg" width=100%
					height=100% /></a>
			</div>
			<form name="myform" action="getProducts.do" method="post" class="">
				<div class="col-md-5 col-md-offset-1">
					<div class="row marginsearch">
						<div class="form-group form-horizontal pull-left">
							<div class="input-group input-group-sm center">
								<select name="category" class="form-control" id="roundleft">
									<c:forEach var="item" items="${categories}">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group form-horizontal pull-left">
							<div class="input-group input-group-sm center">
								<input type="text" id="chocName" name="search"
									class="form-control" placeholder="Search Chocolate"
									onKeyUp="ajaxFunction()">
							</div>
						</div>
						<div class="form-group form-horizontal">
							<div class="input-group input-group-sm center">
								<input type="submit" name="search" value="Search"
									class="btn btn-sm btn-muted" />
							</div>
						</div>
					</div>
					<!-- <div class="row">
						<p id="match" class="suggest"></p>
					</div> -->
				</div>
			</form>
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
		<div class="margintop details">
			<form action="addToCart.do" method="post">
				<input type="hidden" id="productId" name="productID"
					value="${requestScope.product.chocolateId}">
				<div class="row col-lg-10 col-lg-offset-1 detailsborder">
					<div class="col-lg-4 col-lg-offset-2">
						<div class="row col-lg-offset-1">
							<h1>${requestScope.product.chocolateName}</h1>
						</div>
						<div class="row col-lg-offset-1">
							<h3>${requestScope.product.description}</h3>
						</div>
						<div class="row col-lg-offset-1">
							<h3>$${requestScope.product.price}</h3>
						</div>
						<div class="row col-lg-offset-1 margintopmd">
							<div class="form-group pull-left marginright">
								<label for="quantity">Quantity</label>
							</div>
							<div class="form-group pull-left marginright">
								<div class="input-group input-group-md price">
									<input type="text" name="quantity" placeholder=""
										class="form-control pricewidth" id="quantity"
										OnKeyUp="ajaxFunction()"><br>
									
								</div>
							</div>
							<p id="match"></p>
						</div>
						<div class="row col-lg-offset-1 margintopmd">
							<input type="submit" value="Add to cart"
								class="btn btn-sm btn-warning" id="submit" disabled>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="image">
							<img id="img" src="resources/images/p3.jpg" alt="Lindt"
								class="imgborder">
						</div>
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





	<%-- <form action="addToCart.do" method="post">

<input type="hidden" id="productId" name="productID" value=${requestScope.product.chocolateId}>
<table>
<tr> <td>Details for Product:- ${requestScope.product.chocolateName}</td> </tr>

<tr> <td>description:- ${requestScope.product.price} </td></tr>

<tr> <td>description:- ${requestScope.product.quantity}</td></tr>

<tr><td> description:- ${requestScope.product.description}</td> </tr>

</table>
Quantity: <input type="text"  id="quantity"name="quantity" OnKeyUp="ajaxFunction()"/>
<p id="match"> </p>
<input type="submit" value="Add to cart">

</form> --%>
</body>
</html>