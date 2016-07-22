<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>
<link rel="stylesheet" href="resources/css/home.css" />
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<!-- <link
	href='http://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700,400italic,600italic,700italic&effect=shadow-multiple|crackle'
	rel='stylesheet' type='text/css'> -->
<!-- <link
	href='http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'> -->
<title>Home</title>
<script type="text/javascript">
	function ajaxFunction() {

		var xmlhttp;
		var productName = document.getElementById("chocName").value;
		var category = document.getElementById("roundleft").value;

		//document.getElementById("match").innerHTML = oldPass;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttp.open("POST", "checkforproduct.do", true);
		xmlhttp.setRequestHeader("productName", productName);
		xmlhttp.setRequestHeader("category", category);

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					/* if(xmlhttp.responseText == "false"){
						document.getElementById("match").innerHTML = "Quantity invalid";
						document.getElementById("submit").disabled = true;
					}else{
						document.getElementById("match").innerHTML = "Quantity available";
						document.getElementById("submit").disabled = false;
					} */
					//document.getElementById("match").innerHTML = xmlhttp.responseText;
					document.getElementById("match").innerHTML = xmlhttp.responseText;
				} else {
					alert('Something is wrong !!');
				}
			}
		}
		xmlhttp.send(null);
	}
</script>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid headcolor">
			<div class="row">
				<div class="navbar-header size col-md-2 col-lg-offset-1">
					<a href="#"><img src="resources/images/companylogo.jpg"
						width=100% height=100% /></a>
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
						<div class="row">
							<p id="match" class="suggest"></p>
						</div>
					</div>
				</form>
				<!-- <div class="row text-right"> -->
				<div class="col-md-3">
					<div class="row">
						<div class="col-lg-5 pull-left">
							<form method="POST" action="logout.go" class="" role="form">
								<div class="form-group">
									<div class="input-group input-group-lg pull-right">
										<input type="submit" name="logout" value="Logout"
											class="btn btn-sm btn-warning" />
									</div>
								</div>
							</form>
						</div>
						<div class="col-lg-5">
							<form method="POST" action="getOrderHistory.go" class=""
								role="form">
								<input type="hidden" name="customerID" value="${customerID}">

								<div class="form-group">
									<div class="input-group input-group-lg pull-right">
										<input type="submit" name="orderHistory"
											value="GetOrderHistory" class="btn btn-sm btn-warning" />
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-5 pull-left">
							<form action="goToChangePassword.do" method="post">
								<div class="form-group">
									<div class="input-group input-group-lg pull-right">
										<input type="submit" class="btn btn-sm btn-warning"
											value="Change Password" />
									</div>
								</div>
							</form>
						</div>
						<div class="col-lg-5">
							<form action="viewcart.do" method="post">
								<div class="form-group">
									<div class="input-group input-group-lg pull-right">
										<input type="submit" class="btn btn-sm btn-warning"
											value="View Cart" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div id="myCarousel"
		class="carousel slide carousel-fade marginauto margintop"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="container">
					<div class="carousel-caption">
						<img class="first-slide" id="myimg" src="resources/images/00.jpg"
							height="300" style="position: relative; right: 40%"> <img
							class="first-slide" id="myimg1" src="resources/images/01.jpg"
							height="300" style="position: absolute; left: 60%;">
						<h1>Godiva</h1>
						<h4>"All you need is love. But a little chocolate now and
							then doesn't hurt."</h4>
						<%-- <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p> --%>
					</div>
				</div>
			</div>
			<div class="item">
				<div>
					<!-- <img class="second-slide" src="resources/images/01.jpg"
					alt="Second slide"> -->
				</div>
				<div class="container">
					<div class="carousel-caption">
						<img class="first-slide" id="myimg" src="resources/images/05.jpg"
							height="300" style="position: relative; right: 40%"> <img
							class="first-slide" id="myimg1" src="resources/images/04.jpg"
							height="300" style="position: absolute; left: 60%;">
						<h1>Lindt</h1>
						<h4>"Anything is good if it's made of chocolate."</h4>
						<!-- <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p> -->
					</div>
				</div>
			</div>
			<div class="item">
				<div>
					<!-- <img class="third-slide" src="resources/images/04.jpg"
					alt="Third slide"> -->
				</div>
				<div class="container">
					<div class="carousel-caption">
						<img class="first-slide" id="myimg" src="resources/images/02.jpg"
							height="300" style="position: relative; right: 40%"> <img
							class="first-slide" id="myimg1" src="resources/images/03.jpg"
							height="300" style="position: absolute; left: 60%;">
						<h1>Hersheys</h1>
						<h4>"Strength is the capacity to break a Hershey bar into
							four pieces with your bare hands - and then eat just one of the
							pieces."</h4>
						<!-- <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p> -->
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class=" row backwall">
		<div class="row">
			<!-- <div class="col-lg-2 col-lg-offset-3 pull-left"><hr class=""></div> -->
			<h1 class="col-lg-3 col-lg-offset-5 pull-left">Shop By Brand</h1>
			<!-- <div class="col-lg-2"><hr class=""></div> -->
		</div>
		<div class="row col-sm-offset-1 margintopbrand">
			<div class="col4 brandimg brandimgmarginrt"
				style="background-color: #3f000b;">
				<img id="img" src="resources/images/hersheys.png" alt="Hersheys">
			</div>
			<div class="col4 brandimg brandimgmarginrt"
				style="background-color: #0B338B;">
				<img id="img" src="resources/images/lindt.png" alt="Lindt">
			</div>
			<div class="col4 brandimg brandimgmarginrt">
				<img id="img" src="resources/images/godiva.png" alt="Lindt">
			</div>
			<div class="col4 brandimg" style="background-color: #004C8A;">
				<img id="img" src="resources/images/ghirardelli.png" alt="Lindt">
			</div>
		</div>

		<hr>
		<div class="row">
			<!-- <div class="col-lg-2 col-lg-offset-3 pull-left"><hr class=""></div> -->
			<h1 class="col-lg-3 col-lg-offset-5 pull-left">Our Popular Items</h1>
			<!-- <div class="col-lg-2"><hr class=""></div> -->
		</div>

		<div class="row">
			<div class="col-lg-7 col-lg-offset-3">
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p1.jpg" class="image">
					<h4>Dark Peppermint Bark Bar</h4>
					<h4>$5.95</h4>
				</div>
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p2.jpg" class="image">
					<h4>Dark Chocolate Sea Salt Brownie Bar</h4>
					<h4>$5.95</h4>
				</div>
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p3.jpg" class="image">
					<h4>Dark Chocolate minis Gift Bag - 43 Count</h4>
					<h4>$15.95</h4>
				</div>
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p4.png" class="image">
					<h4>Milk LINDOR Truffles 75-pc Bag</h4>
					<h4>$26.00</h4>
				</div>
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p7.jpg" class="image">
					<h4>24 pc. Ultimate Dessert Truffles Gift Box</h4>
					<h4>$50.00</h4>
				</div>
				<div class="col-lg-3 pic newArt">
					<img src="resources/images/p6.jpg" class="image">
					<h4>Chocolate Biscuit Tin</h4>
					<h4>$40.00</h4>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="marginfooter text-center">
			<p class="">© All Rights Reserved 2015</p>
		</div>
	</footer>
</body>
</html>
