<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/productdisplay.js"></script>
<link rel="stylesheet" href="resources/css/productdisplay.css" />

<title>Search Results</title>
<script>
	/* $(document).ready(function() {
		$(".popdetails").hover(function() {
			$(".popimg").css("border", "2px solid #692e11");
		}, function() {
			$(".popimg").css("border", "none");
		});
	}); */
</script>
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
	<div class="container-fluid margincontainer">
		<div class="row backwall">
			<div class="quickbar col-lg-2 quickborder">
				<div class="">
					<h4 class="margintop filter1">Filter Chocolates by...</h4>
				</div>
				<form action="quickSearch.do" method="post" class="margintop">
					<div class="form-group margintopsm">
						<div class="form-group marginright">
							<label>Chocolate</label>
						</div>
						<div class="input-group input-group-md center">
							<input type="text" name="chocolateName"
								placeholder="Enter Chocolate Name" class="form-control"
								id="round">
						</div>
					</div>
					<div class="margintop">
						<div class="form-group">
							<!-- <span class="gender">Gender</span> -->
							<div class="form-group">
								<div class="form-group pull-left marginright margintopsm">
									<label>Company</label>
								</div>
								<div class="input-group input-group-md col-md-12">
									<select name="company" class="form-control" id="round">
										<c:forEach var="item" items="${companyList}">
											<option value="${item}">${item}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<!-- <div class="col-lg-7"></div> -->
					</div>
					<div class="margintop">
						<div class="form-group pull-left marginright margintopmd">
							<label>Price</label>
						</div>
						<div class="form-group pull-left marginright">
							<div class="input-group input-group-md price">
								<input type="text" name="priceFrom" placeholder="From"
									class="form-control pricewidth" id="round">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group input-group-md price">
								<input type="text" name="priceTo" placeholder="To"
									class="form-control pricewidth" id="round">
							</div>
						</div>
					</div>
					<%-- <div class="form-group form-horizontal col-md-2">
				<div class="input-group input-group-md">
					<select name="category" class="form-control">
						<c:forEach var="item" items="${categories}">
							<option value="${item}">${item}</option>
						</c:forEach>
					</select>
				</div>
			</div> --%>
					<div class="form-group pull-right">
						<div class="input-group input-group-lg">
							<input type="submit" name="quicksearch" value="Go"
								class="btn btn-sm btn-info" />
						</div>
					</div>

					<!-- <span class="input-group-addon"><span
					class="glyphicon glyphicon-search"></span></span> -->

				</form>
			</div>
			<div class="col-lg-8 col-lg-offset-1">
				<div class="">
					<h4 class="margintop filter2">You Searched For......</h4>
				</div>
				<div class="margint marginleft col-lg-offset-1">
					<c:forEach var="product" items="${searchResult}">
						<div class="col-lg-3 col-lg-offset-2">
							<div class="margintop">
								<div class="popimg">
									<img alt="product" src="resources/images/${product.path }"
										width="200" height="200">
								</div>
								<div class="popdetails text-center">
									<h3>
										<a
											href="showProductDetails.do?productID=${product.chocolateId}">${product.chocolateName}</a>
									</h3>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

	<%-- <c:forEach var="product" items="${searchResult}">
                    <tr>
	                    <td><c:out value="${product.chocolateName}"/></td>
	                    <td>
	                   		 <a href="showProductDetails.do?productID=${product.chocolateId}"> Show Product Details</a>
	                    </td>
                    </tr>
</c:forEach>  --%>
</body>
</html>